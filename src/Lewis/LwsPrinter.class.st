"
A LwsPrinter is a basic ada 95 pretty printer.
Basic because line length is not token into account. (this is the responsibility of LwsSmartPrinter).

Comments and pragmas  point:
Comment and pragmas are available as token in a token list.
They are not contains in the AST tree. So, comments and pragmas are only correctly restored and formatted if a tokenList is available as input.
The token list is typically available in a LwsParsingResult that is the result of a parsing with LwsParser.

as an example:
LwsPrinter format: (LwsParser parse: 
'--  This Ada package was automatically generated 
with Ada.Strings.Unbounded; -- just to test comments here
use Ada.Strings.Unbounded;

Package Resources is 
type Resources_Type is (No_Protocol,	Priority_Ceiling_Protocol);
procedure To_Resources_Type is new Convert_Strings(Resources_Type, No_Protocol);
End Resources;
-- the end')

Instance Variables
	classifier:		<LwsClassifier>
	inputTokens:		<OrderedCollection of LwsToken>
	level:		<Integer>
	pendingBlanks:		<OrderedCollection of LwsToken>
	tokenList:		<LwsTokenList>

classifier
	- a LwsClassifier is responsible for the creation of an adequate LwsToken instance from a String. see the #token: method as an example

inputTokens
	- the collection of token that comes from a parsing. It is optional but if not present, comments and pragma are not pushed in the result

level
	- the lexical indentation level

pendingBlanks
	- a private collection of blank tokens (LwsBlank) that are added to a token

tokenList
	- the result of the formatting, the string form is computed from the this token list

"
Class {
	#name : #LwsPrinter,
	#superclass : #LewisAbstractVisitor,
	#instVars : [
		'level',
		'classifier',
		'tokenList',
		'inputTokens',
		'pendingBlanks'
	],
	#category : #'Lewis-Visitors'
}

{ #category : #'public accessing' }
LwsPrinter class >> format: aParseTree [
	^ self new format: aParseTree
]

{ #category : #'public accessing' }
LwsPrinter class >> formatFileNamed: aFilePathString [
	"Takes aFilePathString as a name of a ada source file. 
	first make a backup file named with '.ori' as suffix
	then parse the file and write the result in the same file"
	| i o ast |
	i := aFilePathString asFileReference readStream.
	[ o := (aFilePathString , '.ori') asFileReference writeStream.
	o nextPutAll: i contents ]
		ensure: [ o close ].
	[ 
	i reset.
	ast := LwsParser parseStream: i ]
		ensure: [ i close ].
	ast
		ifNotNil: [ 
			[ 
			o := aFilePathString asFileReference writeStream.
			o nextPutAll: (self format: ast) ]
				ensure: [ o close ] ]
]

{ #category : #'private formatting' }
LwsPrinter >> addToken: aToken [
	self inputTokens
		ifNotEmpty: [ 
			| oldToken |
			((oldToken := self inputTokens first copy) isComment)
				ifTrue: [
					self privateAddComment: oldToken.
					aToken isEol
						ifFalse: [ ^ self addToken: aToken ] ] ].
	self addTokenWithPendingBlanks: aToken
]

{ #category : #'private formatting' }
LwsPrinter >> addTokenWithPendingBlanks: aToken [
	aToken isBlank
		ifTrue: [ 
			self tokenList last
				ifNotNil: [ :last | 
					(last isPragma and: [ aToken isEol ])
						ifTrue: [ 
							self hasPendingEol
								ifTrue: [ ^ self ] ].
					(last isComment and: [ aToken isSpace ])
						ifFalse: [ pendingBlanks add: aToken ] ] ]
		ifFalse: [ 
			self tokenList last
				ifNotNil: [ :last | 
					last isComment
						ifTrue: [ 
							self hasPendingEol
								ifFalse: [ self pendingNewLine ] ] ].
			self inputTokens
				ifNotEmpty: [ 
					| next |
					next := self inputTokens first.
					next value asUppercase = aToken value asUppercase
						ifTrue: [ self inputTokens removeFirst ] ].
			aToken blanks addAll: pendingBlanks.
			pendingBlanks removeAll.
			self tokenList addToken: aToken ]
]

{ #category : #accessing }
LwsPrinter >> classifier [
	^ classifier
]

{ #category : #'private formatting' }
LwsPrinter >> cr [
	self token: String cr
]

{ #category : #'private formatting' }
LwsPrinter >> currentTabulationTokens [
	| l |
	l := OrderedCollection new.
	level
		timesRepeat: [ 
			l
				add:
					(LwsTabulationToken new
						value: String tab;
						yourself) ].
	^ l
]

{ #category : #initialization }
LwsPrinter >> defaultTokenClassifier. [
	^ LwsTokenClassifier new
]

{ #category : #'private formatting' }
LwsPrinter >> eof [
	[self inputTokens notEmpty]
		whileTrue: [ | t |
			t := self inputTokens removeFirst.
			t isComment ifTrue: [ self privateAddComment: t ] ].
	self token: String new
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> exceptionDeclarationHead: anExceptionDeclaration [
	anExceptionDeclaration names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ':';
		space;
		token: 'exception'
]

{ #category : #'public formatting' }
LwsPrinter >> format: aParseTree [
	aParseTree accept: self.
	self eof.
	^self tokenList asString
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> functionDeclarationHead: aFunctionDeclaration [
	self token: 'function'; space.
	aFunctionDeclaration name accept: self.
	self visitSubprogramDeclaration: aFunctionDeclaration.
	aFunctionDeclaration returnType 
		ifNotNil: [ 
			self space; token: 'return'; space.
			aFunctionDeclaration returnType accept: self]
]

{ #category : #'private formatting' }
LwsPrinter >> hasPendingEol [
	^ pendingBlanks notEmpty and: [ pendingBlanks anySatisfy: [ :p | p isEol ] ]
]

{ #category : #'private formatting' }
LwsPrinter >> indent: aBlock [
	level := level + 1.
	aBlock ensure: [level := level - 1]
]

{ #category : #initialization }
LwsPrinter >> initialize [ 
	super initialize.
	classifier := self defaultTokenClassifier.
	level := 0.
	tokenList := LwsTokenList new.
	pendingBlanks := OrderedCollection new
]

{ #category : #accessing }
LwsPrinter >> inputTokens [
	^ inputTokens ifNil: [ inputTokens := OrderedCollection new ]
]

{ #category : #private }
LwsPrinter >> labeledStatement: aStatement before: aBlock [
	aStatement labels ifEmpty: [ ^ aBlock value ].
	aStatement labels
		do: [ :l | 
			self
				token: '<<';
				token: l;
				token: '>>';
				newLine].
	aBlock value
]

{ #category : #accessing }
LwsPrinter >> level [
	^ level
]

{ #category : #accessing }
LwsPrinter >> level: anInteger [
	level := anInteger
]

{ #category : #'private formatting' }
LwsPrinter >> newLine [
	self newLines: 1
]

{ #category : #'private formatting' }
LwsPrinter >> newLineTokens [
	| l |
	l := OrderedCollection new.
	l
		add:
			(LwsEolToken new
				value: String cr;
				yourself).
	l addAll: self currentTabulationTokens.
	^ l
]

{ #category : #'private formatting' }
LwsPrinter >> newLines: anInteger [
	anInteger timesRepeat: [ self cr ].
	self upToCurrentLevel
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> objectDeclarationHead: anObjectDeclaration [
	anObjectDeclaration names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ':'.
	self
		indent: [ 
			anObjectDeclaration isAliased
				ifTrue: [ 
					self
						space;
						token: 'aliased' ].
			anObjectDeclaration isConstant
				ifTrue: [ 
					self
						space;
						token: 'constant' ].
			self space.
			anObjectDeclaration definition accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> packageDeclarationHead: aPackageDeclaration [
	self
		token: 'package';
		space.
	aPackageDeclaration name accept: self
]

{ #category : #private }
LwsPrinter >> parenthesis: anExpression around:aBlock [
	anExpression parenthesis 
		ifFalse: [^ aBlock value].
	self token: '('; space.
	self indent: aBlock.
	self space; token: ')'
]

{ #category : #'private formatting' }
LwsPrinter >> pendingNewLine [
	pendingBlanks addAll: self newLineTokens
]

{ #category : #'private formatting' }
LwsPrinter >> pendingSpace [
	pendingBlanks add: self spaceToken
]

{ #category : #'private formatting' }
LwsPrinter >> point [
	self token: '.'
]

{ #category : #'private formatting' }
LwsPrinter >> privateAddComment: aToken [
	aToken blanks removeAll.
	pendingBlanks removeAll.
	aToken haveSomethingBeforeOnTheSameLine
		ifTrue: [ self pendingSpace ]
		ifFalse: [ self pendingNewLine ].
	self addTokenWithPendingBlanks: aToken
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> procedureDeclarationHead: aProcedureDeclaration [
	self token: 'procedure'; space.
	aProcedureDeclaration name accept: self.
	self visitSubprogramDeclaration: aProcedureDeclaration.

]

{ #category : #'private formatting' }
LwsPrinter >> semicolon [ 
	self token: ';' 
]

{ #category : #'private formatting' }
LwsPrinter >> space [
	self token: ' '
]

{ #category : #'private formatting' }
LwsPrinter >> spaceToken [
	^ LwsSpaceToken new value: String space
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> subprogramDeclarationHead: asubprogramDeclaration [
	(asubprogramDeclaration isKindOf: LwsProcedureDeclaration)
		ifTrue: [ self procedureDeclarationHead: asubprogramDeclaration ]
		ifFalse: [ self functionDeclarationHead: asubprogramDeclaration ]
]

{ #category : #'private formatting' }
LwsPrinter >> tab [
	self token: String tab
]

{ #category : #'private formatting' }
LwsPrinter >> tic [ 
	self token: ''''
]

{ #category : #'private formatting' }
LwsPrinter >> token: aString [ 
	self addToken: (self tokenFromString: aString)
]

{ #category : #'private formatting' }
LwsPrinter >> tokenFromString: aString [ 
	| tokenClass token |
	tokenClass := self classifier tokenClassFor: aString.
	token := tokenClass new value: aString.
	token level: level.
	^ token

]

{ #category : #accessing }
LwsPrinter >> tokenList [
	^ tokenList
]

{ #category : #'private formatting' }
LwsPrinter >> upToCurrentLevel [
	level timesRepeat: [ self tab ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitAbortStatement: anAbortStatement [
	self
		labeledStatement: anAbortStatement
		before: [ 
			self token: 'abort'.
			anAbortStatement taskNames
				ifNotNil: [ :a | 
					self space.
					a
						do: [ :e | e accept: self ]
						separatedBy: [ 
							self
								token: ',';
								space ] ].
			self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitAcceptAlternative: anAcceptAlternative [
	self visitSelectiveWaitAlternative: anAcceptAlternative

]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitAcceptStatement: anAcceptStatement [
	self
		labeledStatement: anAcceptStatement
		before: [ 
			self
				token: 'ACCEPT';
				space.
			anAcceptStatement entryName accept: self.
			self writeParameters: anAcceptStatement parameters.
			anAcceptStatement statements
				ifNotEmpty: [ :stmts | 
					self
						space;
						token: 'do'.
					self
						indent: [ 
							self newLine.
							anAcceptStatement statements do: [ :s | s accept: self ] separatedBy: [ self newLine ] ].
					anAcceptStatement handlers
						ifNotEmpty: [ :handlers | 
							self
								newLine;
								token: 'exception'.
							self
								indent: [ 
									self newLine.
									handlers do: [ :h | h accept: self ] separatedBy: [ self newLine ] ] ].
					self
						newLine;
						token: 'end';
						space.
					self token: anAcceptStatement entryName name ].
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitAccessAttribute: anAccessAttribute [
	self tic; token: 'access'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAccessToObject: anAccessToObject [
	self visitAccessType: anAccessToObject.
	super visitAccessToObject: anAccessToObject
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAccessToSubprogram: anAccessToSubprogram [
	self visitAccessType: anAccessToSubprogram.
	self space.
	anAccessToSubprogram returnType ifNotNil: [ self token: 'function' ] ifNil: [ self token: 'procedure' ].
	anAccessToSubprogram parameters
		ifNotEmpty: [ :params | 
			self
				token: '(';
				space.
			self
				indent: [ 
					params
						do: [ :p | p accept: self ]
						separatedBy: [ 
							self
								token: ',';
								space ].
					self
						space;
						token: ')' ] ].
	anAccessToSubprogram returnType
		ifNotNil: [ 
			self
				space;
				token: 'return';
				space.
			anAccessToSubprogram returnType accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAccessType: anAccessType [
	self
		token: 'access';
		space.
	anAccessType accessMode
		ifNotNil: [ 
			anAccessType accessMode = #constantAccessMode
				ifTrue: [ self token: 'constant' ].
			anAccessType accessMode = #protectedAccessMode
				ifTrue: [ self token: 'protected' ].
			anAccessType accessMode = #allAccessMode
				ifTrue: [ self token: 'all' ].
			self space ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAddressRepresentation: anAddressRepresentation [

	self
		token: 'for';
		space.
	anAddressRepresentation name accept: self.
	self
		space;
		token: 'use';
		space;
		token: 'at';
		space.
	anAddressRepresentation useAt accept: self.
	self semicolon
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitAggregate: anAggregate [
	self
		parenthesis: anAggregate
		around: [ 
			self
				token: '(';
				space.
			self
				indent: [ 
					anAggregate elements
						ifNotNil: [ :a | 
							a
								do: [ :e | e accept: self ]
								separatedBy: [ 
									self
										token: ',';
										space ] ] ].
			self
				space;
				token: ')' ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitAllSelector: aASelector [
	self point; token: 'all'

]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitAllocator: anAllocator [
	self visitSimpleUnaryExpression: anAllocator

]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAnyExpression: anAnyExpression [
	self token: '<>'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAnyRangeType: anAnyRangeType [
	self
		token: 'range';
		space;
		token: '<>'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAnyType: anAnyType [
	self parenthesis: anAnyType around: [ self token: '<>' ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitArgumentsSelector: anArgumentsSelector [
	anArgumentsSelector arguments ifNotNil: [ :e | e accept: self ].

]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitArrayType: anArrayType [
	self
		token: 'array';
		token: '(';
		space.
	anArrayType indexes
		do: [ :e | e accept: self ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ')';
		space;
		token: 'of'.
	self
		indent: [ 
			self space.
			anArrayType componentType accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitAssignment: anAssignment [
	self
		labeledStatement: anAssignment
		before: [ 
			anAssignment variableName ifNotNil: [ :a | a accept: self ].
			self
				space;
				token: ':=';
				space.
			self
				indent: [ 
					anAssignment expression ifNotNil: [ :a | a accept: self ].
					self semicolon ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitAsynchronousSelect: anAsynchronousSelect [
	
	self token: 'select'.
	self
		indent: [ 
			self newLine.
			anAsynchronousSelect statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	anAsynchronousSelect abortStatements
		ifNotEmpty: [ :a | 
			self
				newLine;
				token: 'then'; space; token: 'abort'.
			self
				indent: [ 
					self newLine.
					a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
	self
		newLine;
		token: 'end';
		space;
		token: 'select';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitAttributeRepresentation: anAttributeRepresentation [
	self
		token: 'for';
		space.
	anAttributeRepresentation name accept: self.
	self
		space;
		token: 'use';
		space.
	anAttributeRepresentation useExpression accept: self.
	self semicolon
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitBinaryExpression: aBinaryExpression [
	self
		parenthesis: aBinaryExpression
		around: [ 
			aBinaryExpression left ifNotNil: [ :a | a accept: self ].
			self
				indent: [ 
					self
						space;
						token: aBinaryExpression opString;
						space.
					aBinaryExpression right ifNotNil: [ :a | a accept: self ] ] ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitBlockBody: aBlockBody [
	self token: 'begin'.
	self
		indent: [ 
			self newLine.
			aBlockBody statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	aBlockBody handlers
		ifNotEmpty: [ :a | 
			self
				newLine;
				token: 'exception'.
			self
				indent: [ 
					self newLine.
					a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
	self newLine.
	self token: 'end'
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitBlockStatement: aBlockStatement [
	self
		labeledStatement: aBlockStatement
		before: [ 
			aBlockStatement stamp
				ifNotNil: [ :s | 
					self
						token: s;
						token: ':';
						newLine ].
			aBlockStatement locals
				ifNotEmpty: [ :a | 
					self token: 'declare'.
					self
						indent: [ 
							self newLine.
							a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
					self newLine ].
			aBlockStatement body ifNotNil: [ :a | a accept: self ].
			aBlockStatement stamp
				ifNotNil: [ :s | 
					self
						space;
						token: s ].
			self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitCaseAlternative: aCaseAlternative [
	self
		token: 'when';
		space.
	aCaseAlternative choices
		do: [ :e | e accept: self ]
		separatedBy: [ 
			self
				space;
				token: '|';
				space ].
	self space; token: '=>'.
	self
		indent: [ 
			self newLine.
			aCaseAlternative statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitCaseStatement: aCaseStatement [
	self
		labeledStatement: aCaseStatement
		before: [ 
			self
				token: 'case';
				space.
			aCaseStatement selector accept: self.
			self space; token: 'is'.
			self
				 indent: [ 
					self newLine.
					aCaseStatement alternatives do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
			self
				newLine;
				token: 'end';
				space;
				token: 'case';
				semicolon ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitCharacterEnumerationId: anEnumerationId [
	self token: '''', anEnumerationId element asString, ''''
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitCharacterLiteral: aCharacterLiteral [
	self
		parenthesis: aCharacterLiteral
		around: [ self token: ('''', aCharacterLiteral parsedString, '''') ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitCharacterSelector: aCharacterSelector [
	self point; token: ''''; token: aCharacterSelector parsedString ; token: ''''
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitCodeStatement: aCodeStatement [
	self
		labeledStatement: aCodeStatement
		before: [ 
			super visitCodeStatement: aCodeStatement.
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitComponentAssociation: aComponentAssociation [
	aComponentAssociation choices
		ifNotNil: [ :a | 
			a
				do: [ :e | e accept: self ]
				separatedBy: [ 
					self
						space;
						token: '|';
						space ] ].
	self
		space;
		token: '=>';
		space.
	aComponentAssociation expression ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitComponentAttribute: aComponentAttribute [
	aComponentAttribute names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ':';
		space.
	self
		indent: [ 
			aComponentAttribute domain accept: self.
			aComponentAttribute initialization
				ifNotNil: [ :a | 
					self
						space;
						token: ':=';
						space.
					a accept: self ] ].
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitComponentLocation: aComponentLocation [
	aComponentLocation name accept: self.
	self
		space;
		token: 'at';
		space.
	aComponentLocation at accept: self.
	self
		space;
		token: 'range';
		space.
	aComponentLocation range accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitComponentSubtype: aComponentSubtype [
	aComponentSubtype isAliased 
		ifTrue: [ self token: 'aliased'; space ].
	aComponentSubtype definition ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitCompoundName: aCompoundName [
	aCompoundName elements do: [ :e | self token: e ] separatedBy: [ self token: '.' ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitConditionalEntryCall: aConditionalEntryCall [
	self token: 'select'.
	self
		indent: [ 
			self newLine.
			aConditionalEntryCall statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	aConditionalEntryCall elseStatements
		ifNotEmpty: [ :a | 
			self
				newLine;
				token: 'else'.
			self
				indent: [ 
					self newLine.
					a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
	self
		newLine;
		token: 'end';
		space;
		token: 'select';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitDecimalFixedType: aDecimalFixedType [
	self
		token: 'delta';
		space.
	aDecimalFixedType delta accept: self.
	self
		space;
		token: 'digits';
		space.
	aDecimalFixedType digits accept: self.
	aDecimalFixedType range
		ifNotNil: [ :r | 
			self space.
			r accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitDefinedRecordType: aRecordType [
	self visitRecordType: aRecordType.
	self token: 'record'.
	self
		indent: [ 
			self newLine.
			aRecordType definition accept: self ].
	self
		newLine;
		token: 'end';
		space;
		token: 'record'
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitDelayAlternative: aDelayAlternative [
	self visitSelectiveWaitAlternative: aDelayAlternative

]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitDelayStatement: aDelayStatement [
	self
		labeledStatement: aDelayStatement
		before: [ 
			self token: 'delay'.
			aDelayStatement delay
				ifNotNil: [ :n | 
					self space.
					n accept: self ].
			self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitDelayUntilStatement: aDelayStatement [
	self
		labeledStatement: aDelayStatement
		before: [ 
			self
				token: 'delay';
				space;
				token: 'until'.
			aDelayStatement delay
				ifNotNil: [ :n | 
					self space.
					n accept: self ].
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitDeltaAttribute: aDeltaAttribute [
	self tic; token: 'delta'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitDerivedType: aDerivedType [
	aDerivedType isAbstract
		ifTrue: [ 
			self
				token: 'abstract';
				space ].
	self
		token: 'new';
		space.
	aDerivedType subtypeIndication ifNotNil: [ :a | a accept: self ].
	aDerivedType withRecord
		ifNotNil: [ :a | 
			self space.
			self token: 'with'.
			self space.
			a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitDigitsAttribute: aDigitAttribute [
	self tic; token: 'digits'
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitDigitsConstraint: aDigitConstraint [
	self
		token: 'digits';
		space.
	aDigitConstraint expression accept: self.
	aDigitConstraint rangeConstraint
		ifNotNil: [ :a | 
			self space.
			a accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitDiscreteRange: aDiscreteRange [
	aDiscreteRange identifier accept: self.
	aDiscreteRange rangeConstraint
		ifNotNil: [ :a | 
			self space.
			a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitDiscriminantAttribute: aDiscriminantAttribute [
	aDiscriminantAttribute names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ':';
		space.
	self
		indent: [ 
			aDiscriminantAttribute isAccess 
				ifTrue: [ self token: 'access'; space ].
			aDiscriminantAttribute domainName accept: self.
			aDiscriminantAttribute initialization
				ifNotNil: [ :a | 
					self
						space;
						token: ':=';
						space.
					a accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitDiscriminantSpecification: aDiscriminantSpecification [
	self
		token: '(';
		space.
	aDiscriminantSpecification elements
		do: [ :e | e accept: self ]
		separatedBy: [ 
			self
				semicolon;
				space ].
	self
		space;
		token: ')'
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitEntryBody: anEntryBody [
	self
		token: 'entry';
		space;
		token: anEntryBody name.
	anEntryBody iteration ifNotNil: [ :a | a accept: self ].
	anEntryBody parameters
		ifNotEmpty: [ :a | 
			self
				token: '(';
				space.
			self
				indent: [ 
					a
						do: [ :e | e accept: self ]
						separatedBy: [ 
							self
								semicolon;
								space ].
					self
						space;
						token: ')' ] ].
	self
		space;
		token: 'when';
		space.
	anEntryBody whenCondition accept: self.
	anEntryBody body
		ifNotNil: [ :a | 
			self space.
			a accept: self.
			self
				space;
				token: anEntryBody name ].
	self semicolon
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitEntryBodyPart: anEntryBodyPart [
	self token: 'is'.
	anEntryBodyPart locals
		ifNotEmpty: [ :a | 
			self
				indent: [ 
					self newLine.
					a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
	anEntryBodyPart blockBody
		ifNotNil: [ :a | 
			self newLine.
			a accept: self ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitEntryCall: anEntryCall [
	self
		labeledStatement: anEntryCall
		before: [ 
			super visitEntryCall: anEntryCall.
			self semicolon ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitEntryDeclaration: anEntryDeclaration [
	self
		token: 'entry';
		space;
		token: anEntryDeclaration name.
	anEntryDeclaration range
		ifNotNil: [ :r | 
			self
				token: '(';
				space.
			r accept: self.
			self
				space;
				token: ')' ].
	anEntryDeclaration parameters
		ifNotEmpty: [ :params | 
			self
				token: '(';
				space.
			params
				do: [ :p | p accept: self ]
				separatedBy: [ 
					self
						semicolon;
						space ].
			self
				space;
				token: ')' ].
	self semicolon
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitEntryIteration: anEntryIteration [
	self
		token: '(';
		space;
		token: 'for';
		space;
		token: anEntryIteration name;
		space;
		token: 'in';
		space.
	anEntryIteration range accept: self.
	self
		space;
		token: ')'
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitEntryNameArgument: anEntryNameArgument [
	self token: '('; space.
	super visitEntryNameArgument: anEntryNameArgument.
	self space; token: ')'

]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitEnumerationType: anEnumerationType [
	self
		token: '(';
		space.
	self
		indent: [ 
			anEnumerationType elements
				do: [ :e | e accept: self ]
				separatedBy: [ 
					self
						token: ',';
						space ].
			self
				space;
				token: ')' ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitExceptionDeclaration: anExceptionDeclaration [
	self exceptionDeclarationHead: anExceptionDeclaration.
	self semicolon
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitExceptionHandler: anExceptionHandler [
	self
		token: 'when';
		space.
	anExceptionHandler name
		ifNotNil: [ :n | 
			self
				token: n;
				space;
				token: ':';
				space ].
	self
		indent: [ 
			anExceptionHandler choices
				do: [ :c | c accept: self ]
				separatedBy: [ 
					self
						space;
						token: '|';
						space ] ].
	self
		space;
		token: '=>'.
	self
		indent: [ 
			self newLine.
			anExceptionHandler statements do: [ :s | s accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitExceptionRenamingDeclaration: aRenamingDeclaration [
	self exceptionDeclarationHead: aRenamingDeclaration newDeclaration.
	self
		space;
		token: 'renames';
		space.
	aRenamingDeclaration renamedEntityName accept: self.
	self semicolon
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitExitStatement: anExitStatement [
	self
		labeledStatement: anExitStatement
		before: [ 
			self token: 'exit'.
			anExitStatement name
				ifNotNil: [ :a | 
					self space.
					a accept: self ].
			anExitStatement when
				ifNotNil: [ :a | 
					self space.
					self token: 'when'.
					self space.
					a accept: self ].
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitExplicitRange: anExplicitRange [
	anExplicitRange start ifNotNil: [ :a | a accept: self ].
	self
		space;
		token: '..';
		space.
	anExplicitRange stop ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitFloatingType: aFloatingType [
	self
		token: 'digits';
		space.
	aFloatingType digits accept: self.
	aFloatingType range
		ifNotNil: [ :r | 
			self space.
			r accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitFormalParameter: aFormalParameter [
	aFormalParameter names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self
		space;
		token: ':'.
	aFormalParameter mode
		ifNotNil: [ :m | 
			self space.
			self writeParameterMode: m ].
	self space.
	aFormalParameter domainName accept: self.
	aFormalParameter initialization
		ifNotNil: [ :a | 
			self
				space;
				token: ':=';
				space.
			a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitFullTypeDeclaration: aTypeDeclaration [
	self visitTypeDeclaration: aTypeDeclaration.
	self
		space;
		token: 'is';
		space.
	aTypeDeclaration typeDefinition accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitFunctionDeclaration: aFunctionDeclaration [
	self functionDeclarationHead: aFunctionDeclaration.
	aFunctionDeclaration isAbstract
		ifTrue: [ 
			self
				space;
				token: 'is';
				space;
				token: 'abstract' ].
	self
		semicolon
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericDeclaration: aGenericDeclaration [
	self token: 'generic'.
	aGenericDeclaration formalPart
		ifNotEmpty: [ 
			self
				indent: [ 
					self newLine.
					aGenericDeclaration formalPart do: [ :f | f accept: self ] separatedBy: [ self newLine ] ] ].
	self newLine.
	aGenericDeclaration declaration accept: self
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitGenericDiscriminant: aGenericDiscriminant [
	self
		token: '(';
		space;
		token: '<>';
		space;
		token: ')'
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalFunction: aGenericFormalFunction [
	self visitGenericFormalSubprogram: aGenericFormalFunction

]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalPackage: aGenericFormalPackage [
	self
		token: 'with';
		space;
		token: 'package';
		space;
		token: aGenericFormalPackage name;
		space;
		token: 'is';
		space;
		token: 'new';
		space.
	aGenericFormalPackage isNewName accept: self.
	aGenericFormalPackage boxArgument
		ifTrue: [ 
			self
				token: '(';
				space;
				token: '<>';
				space;
				token: ')' ].
	self semicolon
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalParameter: aGenericFormalParameter [
	super visitGenericFormalParameter: aGenericFormalParameter.
	self semicolon
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalProcedure: aGenericFormalProcedure [
	self visitGenericFormalSubprogram: aGenericFormalProcedure

]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalSubprogram: aGenericFormalSubprogram [
	self
		token: 'with';
		space.
	aGenericFormalSubprogram base
		ifNotNil: [ :a | self subprogramDeclarationHead: a ].
	aGenericFormalSubprogram subpDefault
		ifNotNil: [ :a | 
			self space.
			a accept: self ].
	self semicolon
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalType: aGenericFormalType [
	super visitGenericFormalType: aGenericFormalType

]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericFormalUseClause: aGenericFormalUseClause [
	super visitGenericFormalUseClause: aGenericFormalUseClause

]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitGenericInstanciation: aGenericInstanciation [
	self token: 'is'; space; token: 'new'; space.
	aGenericInstanciation name accept: self.

]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericPackageDeclaration: aGenericPackageDeclaration [

	self visitGenericDeclaration: aGenericPackageDeclaration

]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitGenericPackageInstanciation: aGenericPackageInstanciation [
	self token: 'package'; space.
	aGenericPackageInstanciation packageDeclaration accept: self.
	self space.
	self visitGenericInstanciation: aGenericPackageInstanciation.
	self semicolon 
]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericSubprogramDeclaration: aGenericSubprogramDeclaration [

	self visitGenericDeclaration: aGenericSubprogramDeclaration

]

{ #category : #'LwsGenericDeclarationSchema visiting' }
LwsPrinter >> visitGenericSubprogramDefault: aGenericSubprogramDefault [
	self token: 'is'; space.
	aGenericSubprogramDefault default accept: self.
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitGenericSubprogramInstanciation: aGenericSubprogramInstanciation [
	self subprogramDeclarationHead: aGenericSubprogramInstanciation subprogramDeclaration.
	self space.
	self visitGenericInstanciation: aGenericSubprogramInstanciation.
	self semicolon 
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitGotoStatement: aGotoStatement [
	self
		labeledStatement: aGotoStatement
		before: [ 
			self token: 'goto'.
			self
				space;
				token: aGotoStatement targetLabel.
			self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitIfClause: anIfClause [
	anIfClause condition accept: self.
	self
		space;
		token: 'then'.
	self
		indent: [ 
			self newLine.
			anIfClause statements do: [ :s | s accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitIfStatement: anIfStatement [
	self
		labeledStatement: anIfStatement
		before: [ 
			self
				token: 'if';
				space.
			anIfStatement ifClauses
				ifNotNil: [ :a | 
					a
						do: [ :e | 
							e accept: self.
							self newLine ]
						separatedBy: [ 
							self
								token: 'elsif';
								space ] ].
			anIfStatement elseClause
				ifNotNil: [ :a | 
					self token: 'else'.
					self
						indent: [ 
							self newLine.
							a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
					self newLine ] ].
	self
		token: 'end';
		space;
		token: 'if';
		semicolon
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitImportClause: aClause [
	aClause keywords do: [ :kw | self token: kw ] separatedBy: [ self space ].
	self space.
	aClause names
		ifNotNil: [ :a | 
			a
				do: [ :e | e accept: self ]
				separatedBy: [ 
					self
						token: ',';
						space ] ].
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitIncompleteTypeDeclaration: anIncompleteTypeDeclaration [
	self visitTypeDeclaration: anIncompleteTypeDeclaration.
	self semicolon 
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitIndex: anIndex [
	super visitIndex: anIndex.
	self
		space;
		token: 'range';
		space;
		token: '<>'
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitIndexedAggregate: anIndexedAggregate [
	self
		parenthesis: anIndexedAggregate
		around: [ 
			self
				token: '(';
				space.
			self
				indent: [ 
					anIndexedAggregate base
						ifNotNil: [ :b | 
							b accept: self.
							self
								space;
								token: #with;
								space ].
					anIndexedAggregate indexes
						ifEmpty: [ 
							self
								token: #null;
								space;
								token: #record ]
						ifNotEmpty: [ :a | 
							a
								do: [ :e | e accept: self ]
								separatedBy: [ 
									self
										token: ',';
										space ] ] ].
			self
				space;
				token: ')' ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitLiteral: aLiteral [
	self
		parenthesis: aLiteral
		around: [self token: aLiteral parsedString ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitLoopStatement: aLoopStatement [
	self
		labeledStatement: aLoopStatement
		before: [ 
			aLoopStatement stamp
				ifNotNil: [ :s | 
					self
						token: s;
						token: ':';
						newLine ].
			aLoopStatement policy ifNotNil: [ :p | p accept: self ].
			self token: 'loop'.
			self
				indent: [ 
					self newLine.
					aLoopStatement statements ifNotNil: [ :a | a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
			self
				newLine;
				token: 'end';
				space;
				token: 'loop'.
			aLoopStatement stamp
				ifNotNil: [ :s | 
					self
						space;
						token: s ].
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitMembershipExpression: aMembershipExpression [
		self
		parenthesis: aMembershipExpression
		around: [ 
			aMembershipExpression left ifNotNil: [ :a | a accept: self ].
			self
				space;
				token: aMembershipExpression opString;
				space.
			aMembershipExpression right ifNotNil: [ :a | a accept: self ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitMembershipIteration: aMembershipIteration [
	self
		token: 'for';
		space;
		token: aMembershipIteration identifier;
		space;
		token: 'in';
		space. 
	aMembershipIteration reverse
		ifTrue: [ 
			self
				token: 'reverse';
				space ].
	aMembershipIteration range accept: self.
	self space
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitModIntegerType: aModIntegerType [
	self
		token: 'mod';
		space.
	aModIntegerType modu accept: self
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitNamedAttribute: aNamedAttribute [
	self tic; token: aNamedAttribute parsedString
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitNamedExceptionChoice: aNamedExceptionChoice [
	aNamedExceptionChoice identifier accept: self
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitNamedRange: aNamedRange [
	self
		parenthesis: aNamedRange
		around: [ 
			aNamedRange name ifNotNil: [ :a | a accept: self ].
			self
				tic;
				token: 'range'.
			aNamedRange argument
				ifNotNil: [ :exp | 
					self
						token: '(';
						space.
					exp accept: self.
					self
						space;
						token: ')' ] ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitNamedSelector: aSelector [
	self point; token: aSelector parsedString

]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitNullLiteral: aNullLiteral [
	self token: 'null'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitNullRecordType: aNullRecordType [
	self visitRecordType: aNullRecordType.
	self token: 'null'; space; token: 'record'.
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitNullStatement: aNullStatement [
	self
		labeledStatement: aNullStatement
		before: [ 
			self
				token: 'null';
				semicolon ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitNumberDeclaration: aNumberDeclaration [
	aNumberDeclaration names
		do: [ :n | self token: n ]
		separatedBy: [ 
			self
				token: ',';
				space ].
	self space.
	self token: ':'.
	self
		indent: [ 
			self
				space;
				token: 'constant';
				space;
				token: ':=';
				space.
			aNumberDeclaration initialization accept: self.
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitNumericLiteral: aNumericLiteral [
	self parenthesis:  aNumericLiteral around: [ self token: aNumericLiteral parsedString ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitObjectDeclaration: anObjectDeclaration [
	self objectDeclarationHead: anObjectDeclaration.
	anObjectDeclaration initialization
		ifNotNil: [ :a | 
			self
				space;
				token: ':='.
			self
				indent: [ 
					self space.
					a accept: self ] ].
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitObjectRenamingDeclaration: anObjectRenamingDeclaration [
	self objectDeclarationHead: anObjectRenamingDeclaration newDeclaration.
	self
		space;
		token: 'renames';
		space.
	anObjectRenamingDeclaration renamedEntityName accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitOperatorOverloadDeclaration: anOperatorOverloadDeclaration [
	self visitFunctionDeclaration: anOperatorOverloadDeclaration
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitOrdinaryFixedType: anOrdinaryFixedType [
	self
		token: 'delta';
		space.
	anOrdinaryFixedType delta accept: self.
	anOrdinaryFixedType range
		ifNotNil: [ :r | 
			self space.
			r accept: self ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitOtherChoice: anOtherChoice [
	self token: 'others'
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitOthersExceptionChoice: anOthersExceptionChoice [
	self token: 'others'
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitPackageBody: aPackageBody [
	self
		token: 'package';
		space;
		token: 'body';
		space.
	aPackageBody name accept: self.
	self
		space;
		token: 'is'.
	self
		indent: [ 
			aPackageBody locals
				ifNotEmpty: [ 
					self newLine.
					aPackageBody locals do: [ :l | l accept: self ] separatedBy: [ self newLine ] ] ].
	aPackageBody blockBody
		ifNotNil: [ :a | 
			self newLine.
			a accept: self ]
		ifNil: [ 
			self
				newLine;
				token: 'end' ].
	self space.
	aPackageBody name accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPackageBodyStubDeclaration: aPackageBodyStubDeclaration [
	self
		token: 'package';
		space;
		token: 'body';
		space.
	aPackageBodyStubDeclaration name accept: self.
	self	space;
		token: 'is';
		space;
		token: 'separate';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPackageDeclaration: aPackageDeclaration [
	self packageDeclarationHead: aPackageDeclaration.
	self
		space;
		token: 'is';
		space.
	aPackageDeclaration definition accept: self.
	self newLine; token: 'end'; space. aPackageDeclaration name accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPackageDefinition: aPackageDefinition [
	self indent: [ aPackageDefinition publicPart accept: self ].
	aPackageDefinition privatePart
		ifNotNil: [ 
			self
				newLines: 2;
				token: 'private'.
			self indent: [ aPackageDefinition privatePart accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPackagePart: aPackagePart [
	aPackagePart elements
		ifNotEmpty: [ 
			self newLine.
			aPackagePart elements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPackageRenamingDeclaration: aPackageRenamingDeclaration [
	| newName |
	newName := aPackageRenamingDeclaration newName.
	self token: 'package'.
	self space.
	newName accept: self.
	self
		space;
		token: 'renames';
		space.
	aPackageRenamingDeclaration renamedEntityName accept: self.
	self semicolon
]

{ #category : #'LwsParsingResultSchema visiting' }
LwsPrinter >> visitParsingResult: aParsingResult [
	inputTokens := aParsingResult tokenList tokens copy.
	aParsingResult entities do: [ :pr | pr accept: self ] separatedBy: [ self newLine ]

]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitPrimaryQualifier: aPrimaryQualifier [
	self tic.
	super visitPrimaryQualifier: aPrimaryQualifier
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPrivateRecordType: aPrivateRecordType [
	self token: 'private'
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPrivateTypeDeclaration: aTypeDeclaration [
		self visitFullTypeDeclaration: aTypeDeclaration.
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitPrivateTypeDefinition: aPrivateTypeDefinition [
	aPrivateTypeDefinition isTagged
		ifTrue: [ 
			self
				token: 'tagged';
				space ].
	aPrivateTypeDefinition isLimited
		ifTrue: [ 
			self
				token: 'limited';
				space ].
	self token: 'private'
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitProcedureCall: aProcedureCall [
	self
		labeledStatement: aProcedureCall
		before: [ 
			super visitProcedureCall: aProcedureCall.
			self semicolon ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProcedureDeclaration: aProcedureDeclaration [
	self procedureDeclarationHead: aProcedureDeclaration.
	aProcedureDeclaration isAbstract
		ifTrue: [ 
			self
				space;
				token: 'is';
				space;
				token: 'abstract' ].
	self
		semicolon
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitProtectedUnitBody: aProtectedUnitBody [
	self
		token: 'protected';
		space;
		token: 'body';
		space;
		token: aProtectedUnitBody name;
		space;
		token: 'is'.
	self
		indent: [ 
			aProtectedUnitBody elements
				ifNotEmpty: [ 
					self newLine.
					aProtectedUnitBody elements do: [ :l | l accept: self ] separatedBy: [ self newLine ] ] ].
	self
		newLine;
		token: 'end';
		space;
		token: aProtectedUnitBody name;
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitBodyStubDeclaration: aStubDeclaration [
	self
		token: 'protected';
		space;
		token: 'body';
		space;
		token: aStubDeclaration name;
		space;
		token: 'is';
		space;
		token: 'separate';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitDeclaration: aProtectedUnitDeclaration [
	self
		token: 'protected';
		space;
		token: aProtectedUnitDeclaration name.
	self
		space;
		token: 'is'.
	aProtectedUnitDeclaration definition accept: self.
	self newLine.
	self
		token: 'end';
		space;
		token: aProtectedUnitDeclaration name;
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitDefinition: aProtectedUnitDefinition [
	self indent: [ aProtectedUnitDefinition publicPart accept: self ].
	aProtectedUnitDefinition privatePart
		ifNotNil: [ 
			self
				newLine;
				token: 'private'.
			self indent: [ aProtectedUnitDefinition privatePart accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitPart: aProtectedUnitPart [
	aProtectedUnitPart entries
		ifNotEmpty: [ 
			self newLine.
			aProtectedUnitPart entries do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitPrivatePart: aProtectedUnitPart [
	self visitProtectedUnitPart: aProtectedUnitPart
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitPublicPart: aProtectedUnitPart [
	self visitProtectedUnitPart: aProtectedUnitPart
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitProtectedUnitTypeDeclaration: aProtectedUnitDeclaration [
	self
		token: 'protected';
		space;
		token: 'type';
		space;
		token: aProtectedUnitDeclaration name.
	aProtectedUnitDeclaration discriminant ifNotNil: [ aProtectedUnitDeclaration discriminant accept: self  ].
	self space; token: 'is'.
	aProtectedUnitDeclaration definition accept: self.
	self newLine.
	self
		token: 'end';
		space;
		token: aProtectedUnitDeclaration name;
		semicolon
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitQualifiedIdentifier: aQualifiedIdentifier [
	self
		parenthesis: aQualifiedIdentifier
		around: [ 
			self token: aQualifiedIdentifier name.
			super visitQualifiedIdentifier: aQualifiedIdentifier ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitRaiseStatement: aRaiseStatement [
	self
		labeledStatement: aRaiseStatement
		before: [ 
			self token: 'raise'.
			aRaiseStatement name
				ifNotNil: [ :n | 
					self space.
					n accept: self ].
			self semicolon ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitRangeConstraint: aRangeConstraint [
	self token: 'range'; space.
	super visitRangeConstraint: aRangeConstraint
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitRecordDefinition: aRecordDefinition [
	(aRecordDefinition elements isEmpty and: [ aRecordDefinition variantPart isNil ])
		ifTrue: [ 
			^ self
				token: 'null';
				semicolon ].
	aRecordDefinition elements ifNotEmpty: [ :a | a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	aRecordDefinition variantPart
		ifNotNil: [ :a | 
			aRecordDefinition elements ifNotEmpty: [ self newLine ].
			a accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitRecordType: aRecordType [
	aRecordType isAbstract 	
		ifTrue: [ self token: 'abstract'; space ].
	aRecordType isTagged
		ifTrue: [ self token: 'tagged'; space ].		
	aRecordType isLimited 
		ifTrue: [ self token: 'limited'; space ].
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitRecordTypeRepresentation: aRecordTypeRepresentation [
	self
		token: 'for';
		space.
	aRecordTypeRepresentation name accept: self.
	self
		space;
		token: 'use';
		space;
		token: 'record'.
	self
		indent: [ 
			self newLine.
			aRecordTypeRepresentation align
				ifNotNil: [ :a | 
					self
						space;
						token: 'at';
						space;
						token: 'mod';
						space.
					a accept: self.
					self semicolon; newLine ].
			aRecordTypeRepresentation locations do: [ :l | l accept: self ] separatedBy: [ self newLine ]].
	self
		token: 'end';
		space;
		token: 'record';
		semicolon
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitRequeueStatement: aRequeueStatement [
	self
		labeledStatement: aRequeueStatement
		before: [ 
			self
				token: 'requeue';
				space.
			aRequeueStatement taskName accept: self.
			aRequeueStatement withAbort
				ifTrue:
					[ 
					self
						space;
						token: 'with';
						space;
						token: 'abort' ] self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitReturnStatement: aReturnStatement [
	self
		labeledStatement: aReturnStatement
		before: [ 
			self token: 'return'.
			aReturnStatement result
				ifNotNil: [ :a | 
					self space.
					a accept: self ].
			self semicolon ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitSelectiveWaitAlternative: anAlternative [
	anAlternative when
		ifNotNil: [ :w | 
			self
				token: 'when';
				space.
			anAlternative when accept: self.
			self
				space;
				token: '=>'.
			self
				indent: [ 
					self newLine.
					anAlternative statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ]
		ifNil: [ anAlternative statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitSelectiveWaitStatement: aSelectiveWaitStatement [
	self token: 'select'.
	aSelectiveWaitStatement alternatives
		do: [ :e | 
			self
				indent: [ 
					self newLine.
					e accept: self ] ]
		separatedBy: [ 
			self
				newLine;
				token: 'or' ].
	aSelectiveWaitStatement elseAlternative
		ifNotEmpty: [ :a | 
			self
				newLine;
				token: 'else'.
			self
				indent: [ 
					self newLine.
					a
						do: [ :e | 
							e accept: self.
							self newLine ] ] ].
	self
		newLine;
		token: 'end';
		space;
		token: 'select';
		semicolon
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitSeparateBody: aSeparateBody [

	self
		token: 'separate';
		token: '(';
		space;
		token: aSeparateBody name;
		space;
		token: ')';
		newLine.
	aSeparateBody subunitBody accept: self
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSimpleIdentifier: aSimpleIdentifier [
	self token: aSimpleIdentifier name
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitSimpleUnaryExpression: aSimpleUnaryExpression [
	self
		parenthesis: aSimpleUnaryExpression
		around: [
			self token: aSimpleUnaryExpression opString.
			(#('+' '-') includes: aSimpleUnaryExpression opString)
				ifFalse: [ self space ].
			aSimpleUnaryExpression right ifNotNil: [ :a | a accept: self ]]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitStringDesignator: aStringDesignator [
	self token: aStringDesignator name
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitStringEnumerationId: aStringEnumerationId [
	self token: aStringEnumerationId element
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitStringLiteral: aStringLiteral [
	self
		parenthesis: aStringLiteral
		around: [ self token: ('"', aStringLiteral parsedString, '"') ]
]

{ #category : #'LwsExpressionSchema visiting' }
LwsPrinter >> visitStringSelector: aStringSelector [
	self point; token: '"'; token: aStringSelector parsedString ; token: '"'
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitSubprogramBody: aSubprogramBody [
	self subprogramDeclarationHead: aSubprogramBody declaration.
	self
		space;
		token: 'is'.
	self
		indent: [ 
			aSubprogramBody locals
				ifNotEmpty: [ 
					self newLine.
					aSubprogramBody locals do: [ :l | l accept: self ] separatedBy: [ self newLine ] ] ].
	aSubprogramBody blockBody
		ifNotNil: [ :a | 
			self newLine.
			a accept: self ].
	self space.
	aSubprogramBody declaration name accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSubprogramBodyStubDeclaration: aSubprogramBodyStubDeclaration [
	self subprogramDeclarationHead: aSubprogramBodyStubDeclaration declaration.
	self	space;
		token: 'is';
		space;
		token: 'separate';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSubprogramDeclaration: aSubprogramDeclaration [
	aSubprogramDeclaration parameters
		ifNotEmpty: [ :a | 
			self
				token: '(';
				space.
			self
				indent: [ 
					a
						do: [ :e | e accept: self ]
						separatedBy: [ 
							self
								semicolon;
								space ].
					self
						space;
						token: ')' ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSubprogramRenamingDeclaration: aSubprogramRenamingDeclaration [
	self subprogramDeclarationHead: aSubprogramRenamingDeclaration newDeclaration.
	self
		space;
		token: 'renames';
		space.
	aSubprogramRenamingDeclaration renamedEntityName accept: self.
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSubtypeDeclaration: aSubtypeDeclaration [
	self
		token: 'SUBTYPE';
		space;
		token: aSubtypeDeclaration name;
		space;
		token: 'is';
		space.
	aSubtypeDeclaration subtypeIndication accept: self.
	self
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitSubtypeIndication: aSubtypeIndication [
	aSubtypeIndication name accept: self.
	aSubtypeIndication constraint
		ifNotNil: [ :a | 
			self space.
			a accept: self ]
]

{ #category : #'LwsDeclarationBodySchema visiting' }
LwsPrinter >> visitTaskBody: aTaskBody [
	self
		token: 'task';
		space;
		token: 'body';
		space;
		token: aTaskBody name;
		space;
		token: 'is'.
	self
		indent: [ 
			aTaskBody locals
				ifNotEmpty: [ 
					self newLine.
					aTaskBody locals do: [ :l | l accept: self ] separatedBy: [ self newLine ] ] ].
	aTaskBody blockBody
		ifNotNil: [ :a | 
			self newLine.
			a accept: self ]
		ifNil: [ 
			self
				newLine;
				token: 'end' ].
	self
		space;
		token: aTaskBody name;
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTaskBodyStubDeclaration: aTaskBodyStubDeclaration [
	self
		token: 'task';
		space;
		token: 'body';
		space;
		token: aTaskBodyStubDeclaration name;
		space;
		token: 'is';
		space;
		token: 'separate';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTaskDeclaration: aTaskDeclaration [
	self
		token: 'task';
		space;
		token: aTaskDeclaration name.
	aTaskDeclaration definition
		ifNotNil: [ 
			self
				space;
				token: 'is'.
			aTaskDeclaration definition accept: self.
			self newLine.
			self
				token: 'end';
				space;
				token: aTaskDeclaration name ].
	self semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTaskDefinition: aTaskDefinition [
	self indent: [ aTaskDefinition publicPart accept: self ].
	aTaskDefinition privatePart
		ifNotNil: [ 
			self
				newLines: 2;
				token: 'private'.
			self indent: [ aTaskDefinition privatePart accept: self ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTaskPart: aTaskPart [
	aTaskPart entries
		ifNotEmpty: [ 
			self newLine.
			aTaskPart entries do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	aTaskPart representations
		ifNotEmpty: [ 
			self newLine.
			aTaskPart representations do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTaskTypeDeclaration: aTaskDeclaration [
	self
		token: 'task';
		space;
		token: 'type';
		space;
		token: aTaskDeclaration name.
	aTaskDeclaration discriminant ifNotNil: [ :d | d accept: self ].
	aTaskDeclaration definition
		ifNotNil: [ 
			self
				space;
				token: 'is';
				space.
			aTaskDeclaration definition accept: self.
			self
				newLine;
				token: 'end';
				space;
				token: aTaskDeclaration name ].
	self semicolon
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitTerminateAlternative: anAlternative [
	self token: 'terminate'; semicolon 
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitTimedEntryCall: aTimedEntryCall [
	self token: 'select'.
	self
		indent: [ 
			self newLine.
			aTimedEntryCall statements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	aTimedEntryCall orStatements
		ifNotEmpty: [ :a | 
			self
				newLine;
				token: 'or'.
			self
				indent: [ 
					self newLine.
					a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ] ].
	self
		newLine;
		token: 'end';
		space;
		token: 'select';
		semicolon
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitTypeDeclaration: aTypeDeclaration [
	self token: 'type'; space; token: aTypeDeclaration name.
	aTypeDeclaration discriminant ifNotNil: [ aTypeDeclaration discriminant accept: self  ].
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitUnit: anUnit [
	anUnit interfaces
		ifNotEmpty: [ :interf | 
			interf do: [ :e | e accept: self ] separatedBy: [ self newLine ].
			self
				newLine;
				newLine ].
	anUnit element ifNotNil: [ :a | a accept: self ]
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitUnitInterface: anUnitInterface [
	anUnitInterface withClause ifNotNil: [ :a | a accept: self ].
	anUnitInterface useClauses
		ifNotEmpty: [ :a | 
			self newLine.
			a do: [ :e | e accept: self ] separatedBy: [ self newLine ] ]
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitUseClause: aUseClause [
	self visitImportClause: aUseClause
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitVariantComponentAttribute: aVariantComponentAttribute [
	self
		token: 'when';
		space.
	aVariantComponentAttribute choices
		do: [ :e | e accept: self ]
		separatedBy: [ 
			self
				space;
				token: '|';
				space ].
	self
		space;
		token: '=>'.
	self
		indent: [ 
			self newLine.
			aVariantComponentAttribute record accept: self ]
]

{ #category : #'LwsDeclarationSchema visiting' }
LwsPrinter >> visitVariantRecordPart: aVariantRecordPart [
	self
		token: 'case';
		space.
	aVariantRecordPart caseIdentifier accept: self.
	self
		space;
		token: 'is'.
	self
		indent: [ 
			self newLine.
			aVariantRecordPart elements do: [ :e | e accept: self ] separatedBy: [ self newLine ] ].
	self newLine; token: 'end'; space; token: 'case'; semicolon 
]

{ #category : #'LwsStatementSchema visiting' }
LwsPrinter >> visitWhileIteration: aWhileIteration [
	self token: 'while'; space.
	aWhileIteration condition accept: self.
	self space
]

{ #category : #'LwsStructureSchema visiting' }
LwsPrinter >> visitWithClause: aUseClause [
	self visitImportClause: aUseClause
]

{ #category : #private }
LwsPrinter >> writeParameterMode: aMode [
	aMode = #inputMode
		ifTrue: [ ^ self token: 'in' ].
	aMode = #outputMode
		ifTrue: [ ^ self token: 'out' ].
	aMode = #inputOutputMode
		ifTrue: [ 
			^ self
				token: 'in';
				space;
				token: 'out' ].
	aMode = #accessMode
		ifTrue: [ ^ self token: 'access' ]
]

{ #category : #private }
LwsPrinter >> writeParameters: aListOfParameters [
	aListOfParameters
		ifNotEmpty: [ :params | 
			self
				token: '(';
				space.
			params
				do: [ :p | p accept: self ]
				separatedBy: [ 
					self
						token: ',';
						space ].
			self
				space;
				token: ')' ]
]
