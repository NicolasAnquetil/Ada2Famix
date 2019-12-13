Class {
	#name : #Ada95Scanner,
	#superclass : #SmaCCScanner,
	#instVars : [
		'tokenListStack',
		'tokenClassifier',
		'pendingBlanks'
	],
	#category : #'Lewis-AdaParser'
}

{ #category : #'as yet unclassified' }
Ada95Scanner class >> buildTokenForSource: aString [

	^ (self on: aString readStream ) buildTokenList
]

{ #category : #'generated-initialization' }
Ada95Scanner class >> initializeKeywordMap [
	keywordMap := Dictionary new.
	#(#(100 'ABORT' 2) #(100 'ABS' 3) #(100 'ABSTRACT' 4) #(100 'ACCEPT' 11) #(100 'ACCESS' 12) #(100 'ALIASED' 19) #(100 'ALL' 34) #(100 'AND' 20) #(100 'ARRAY' 21) #(100 'AT' 22) #(100 'BEGIN' 17) #(100 'BODY' 18) #(100 'CASE' 13) #(100 'CONSTANT' 29) #(100 'DECLARE' 14) #(100 'DELAY' 15) #(100 'DELTA' 48) #(100 'DIGITS' 47) #(100 'DO' 55) #(100 'ELSE' 79) #(100 'ELSIF' 80) #(100 'END' 81) #(100 'ENTRY' 82) #(100 'EXCEPTION' 77) #(100 'EXIT' 78) #(100 'FOR' 73) #(100 'FUNCTION' 32) #(100 'GENERIC' 74) #(100 'GOTO' 75) #(100 'IF' 84) #(100 'IN' 83) #(100 'IS' 85) #(100 'LIMITED' 93) #(100 'LOOP' 92) #(100 'MOD' 95) #(100 'NEW' 94) #(100 'NOT' 91) #(100 'NULL' 90) #(100 'OF' 89) #(100 'OR' 86) #(100 'OTHERS' 87) #(100 'OUT' 88) #(100 'PACKAGE' 76) #(100 'PRAGMA' 72) #(100 'PRIVATE' 71) #(100 'PROCEDURE' 31) #(100 'PROTECTED' 33) #(100 'RAISE' 56) #(100 'RANGE' 57) #(100 'RECORD' 58) #(100 'REM' 53) #(100 'RENAMES' 54) #(100 'REQUEUE' 49) #(100 'RETURN' 50) #(100 'REVERSE' 51) #(100 'SELECT' 52) #(100 'SEPARATE' 59) #(100 'SUBTYPE' 60) #(100 'TAGGED' 67) #(100 'TASK' 68) #(100 'TERMINATE' 69) #(100 'THEN' 70) #(100 'TYPE' 65) #(100 'UNTIL' 66) #(100 'USE' 61) #(100 'WHEN' 62) #(100 'WHILE' 63) #(100 'WITH' 64) #(100 'XOR' 16))
		do: [ :each | (keywordMap at: each first ifAbsentPut: [ Dictionary new ]) at: (each at: 2) put: each last ].
	^ keywordMap
]

{ #category : #private }
Ada95Scanner >> addToken: aToken [
	aToken blanks addAll: pendingBlanks.
	pendingBlanks removeAll.
	self tokenList add: aToken
]

{ #category : #private }
Ada95Scanner >> buildTokenList [
	[self atEnd]
		whileFalse: [self next].
	^ self tokenList
]

{ #category : #accessing }
Ada95Scanner >> classifier [
	^ tokenClassifier
]

{ #category : #private }
Ada95Scanner >> createTokenFor: string [
	| token |
	string asUppercase = 'PRAGMA'
		ifTrue: [ | haveSomethingBefore |
			haveSomethingBefore := self haveSomethingBeforeOnTheSameLine.
			token := LwsPragmaToken value: string start: start + 1 id: matchActions.
			token haveSomethingBeforeOnTheSameLine: haveSomethingBefore.
			self addToken: token.
			self pushTokenList ]
		ifFalse: [ 
			| tokenClass |
			tokenClass := matchActions = self eofTokenId
				ifTrue: [ LwsEofToken ]
				ifFalse: [ self classifier tokenClassFor: string ].
			token := tokenClass value: string start: start + 1 id: matchActions.
			self addToken: token ].
	^ token
]

{ #category : #accessing }
Ada95Scanner >> eatComment [
	| rem lp haveSomethingBefore |
	start := stream position + 1.
	haveSomethingBefore := self haveSomethingBeforeOnTheSameLine.
	[ 
	currentCharacter := stream next.
	outputStream nextPut: currentCharacter.
	stream atEnd
		or: [ 
			{(Character cr).
			(Character lf)} includes: currentCharacter ] ] whileFalse.
	rem := outputStream contents.
	lp := (stream atEnd not
		and: [ 
			{(Character cr).
			(Character lf)} includes: rem last ])
		ifTrue: [ rem size - 1 ]
		ifFalse: [ rem size ].
	self
		addToken:
			(LwsCommentToken new
				start: start;
				value: (rem copyFrom: 1 to: lp);
				haveSomethingBeforeOnTheSameLine: haveSomethingBefore).
	pendingBlanks
		add:
			(LwsEolToken new
				value: String cr;
				start: stream position;
				yourself).
	stream atEnd
		ifTrue: [ super next ]
]

{ #category : #accessing }
Ada95Scanner >> eatSeparators [
	[ self isBeforeSeparator ]
		whileTrue: [ 
			| tokenClass token v |
			tokenClass := self classifier tokenClassFor: (v := stream next asString).
			token := tokenClass value: v start: stream position id: #().
			pendingBlanks add: token ]
]

{ #category : #generated }
Ada95Scanner >> emptySymbolTokenId [
	^ 463
]

{ #category : #generated }
Ada95Scanner >> errorTokenId [
	^ 464
]

{ #category : #accessing }
Ada95Scanner >> haveSomethingBeforeOnTheSameLine [

	self tokenList ifEmpty: [ ^false ].
	pendingBlanks
		reverseDo: [ :b | 
			b isEol
				ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #'initialize-release' }
Ada95Scanner >> initialize [
	super initialize.
	tokenClassifier := LwsTokenClassifier new.
	pendingBlanks := OrderedCollection new.
]

{ #category : #accessing }
Ada95Scanner >> isBeforeComment [
	| pik2 |
	pik2 := self peekTwiceFrom: stream.
	^ (pik2 first = $- and: [ pik2 second = $- ])

]

{ #category : #accessing }
Ada95Scanner >> isBeforeSeparator [
	^ stream atEnd not and: [ stream peek isSeparator ]

]

{ #category : #private }
Ada95Scanner >> keywordFor: aString [ 
	^aString asUppercase
]

{ #category : #accessing }
Ada95Scanner >> next [
	self isBeforeSeparator
		ifTrue: [ self eatSeparators ].
	self resetScanner.
	self isBeforeComment
		ifTrue: [ 
			self eatComment.
			stream atEnd ifFalse: [^ self next ]].
	^ super next
]

{ #category : #private }
Ada95Scanner >> peekTwiceFrom: aStream [
	"Answer what would be returned if the message next were sent two times to aStream. 
	If the aStream is at the end, answer nil."

	| array |
	aStream atEnd 
		ifTrue: [^Array with: nil with: nil].
	array := Array with: (aStream next) with: (aStream peek).
	aStream position: aStream position - 1.
	^array
]

{ #category : #accessing }
Ada95Scanner >> popTokenList [
	^ self tokenListStack pop
]

{ #category : #generated }
Ada95Scanner >> pragmaId [
	^ 461
]

{ #category : #accessing }
Ada95Scanner >> previousTokenWithOneOf: aCollection [
	| uppercased |
	uppercased := aCollection collect: [ :v | v asUppercase ].
	self tokenList
		reverseDo: [ :t | 
			(uppercased includes: t value asUppercase)
				ifTrue: [ ^ t ] ].
	^ nil
]

{ #category : #accessing }
Ada95Scanner >> pushTokenList [
	self tokenListStack push: OrderedCollection new
]

{ #category : #generated }
Ada95Scanner >> scan1 [
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(97).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!) or: [ currentCharacter >= $# ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan10 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan11 [
	[ 
	self recordMatch: #(98).
	self step.
	currentCharacter = $_
		ifTrue: [ ^ self scan10 ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan12 [
	[ 
	self recordMatch: #(100).
	self step.
	currentCharacter = $_
		ifTrue: [ 
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	(currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ] ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan2 [
	[ 
	self recordMatch: #(98).
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $_
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan3 [
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $#
				ifTrue: [ ^ self scan4 ].
			currentCharacter = $.
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $_
				ifTrue: [ ^ self scan3 ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan4 [
	self recordMatch: #(99).
	self step.
	('Ee' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan6 ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan5 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan6 [
	[ 
	self recordMatch: #(99).
	self step.
	currentCharacter = $_
		ifTrue: [ ^ self scan5 ].
	currentCharacter isDigit ] whileTrue.
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan7 [
	self step.
	((currentCharacter between: $0 and: $9)
		or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $#
				ifTrue: [ ^ self scan4 ].
			currentCharacter = $_
				ifTrue: [ ^ self scan7 ].
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ] ] ] whileTrue ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan8 [
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(98).
			self step.
			currentCharacter = $_
				ifTrue: [ ^ self scan8 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan9 ] ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scan9 [
	self step.
	currentCharacter isDigit
		ifTrue: [ ^ self scan11 ].
	('+-' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	^ self reportLastMatch
]

{ #category : #generated }
Ada95Scanner >> scanForToken [
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $&
		ifTrue: [ ^ self recordAndReportMatch: #(42) ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(39).
			self step.
			true
				ifTrue: [ 
					self step.
					currentCharacter = $'
						ifTrue: [ ^ self recordAndReportMatch: #(96) ] ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(25) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter = $-
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(36).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self recordAndReportMatch: #(40) ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(38).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $<
				ifTrue: [ ^ self recordAndReportMatch: #(23) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(24) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(43).
			self step.
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(45).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(35) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan2 ].
	((currentCharacter between: $A and: $Z) or: [ currentCharacter between: $a and: $z ])
		ifTrue: [ ^ self scan12 ].
	^ self reportLastMatch
]

{ #category : #accessing }
Ada95Scanner >> storePragma: aPragma [
	"sent from the parser"

	| pragmaTokenList misplacedTokens |
	misplacedTokens := OrderedCollection new.
	pragmaTokenList := self popTokenList.
	[ pragmaTokenList isEmpty or: [ pragmaTokenList last isKindOf: LwsSemicolonToken ] ]
		whileFalse: [ misplacedTokens addFirst: pragmaTokenList removeLast ].
	self tokenList addAll: misplacedTokens.
	self tokenList
		reverseDo: [ :e | 
			(e isKindOf: LwsPragmaToken)
				ifTrue: [ 
					e pragma: aPragma.
					e tokens: pragmaTokenList ] ]
]

{ #category : #private }
Ada95Scanner >> tokenClass [
	^LwsToken 
]

{ #category : #accessing }
Ada95Scanner >> tokenList [
	^ self tokenListStack top
]

{ #category : #accessing }
Ada95Scanner >> tokenListStack [
	^ tokenListStack
		ifNil: [ 
			tokenListStack := Stack new.
			tokenListStack push: OrderedCollection new.
			tokenListStack ]
]
