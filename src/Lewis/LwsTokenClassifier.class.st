"
A LwsTokenClassifier is xxxxxxxxx.

Instance Variables
	classifier:		<Object>
	heuristicList:		<Object>

classifier
	- xxxxx

heuristicList
	- xxxxx
	


"
Class {
	#name : #LwsTokenClassifier,
	#superclass : #Object,
	#instVars : [
		'classifier',
		'heuristicList'
	],
	#category : #'Lewis-AdaParser'
}

{ #category : #'initialize/release' }
LwsTokenClassifier >> classificationBlock: aBlock for: aTokenClass [
	self heuristicList add: (aBlock -> aTokenClass)
]

{ #category : #accessing }
LwsTokenClassifier >> classifier [
	^ classifier ifNil: [ classifier := Dictionary new ]
]

{ #category : #'initialize/release' }
LwsTokenClassifier >> classify: aTokenValue as: aTokenClass [
	self classifier at: aTokenValue put: aTokenClass
]

{ #category : #'initialize/release' }
LwsTokenClassifier >> classifyAll: collection as: aTokenClass [
	collection do: [ :t | self classifier at: t put: aTokenClass]
]

{ #category : #accessing }
LwsTokenClassifier >> heuristicList [
	^ heuristicList ifNil: [ heuristicList := OrderedCollection new ]
]

{ #category : #'initialize/release' }
LwsTokenClassifier >> initialize [

	super initialize.
	self classifyAll: #('''' '.' '..'  '|' '?' '<<' '>>' '<>' ',' ':' '[' '{' '(' ']' '}' ')' ) as: LwsDelimToken.
	self classifyAll: #('=' '/=' '-' '+' '<' '<=' '/' '*' '>=' '**'  '&' '=>') as: LwsOperatorToken.
	self classifyAll: #('true' 'false') as: LwsBooleanValueToken.
	self classify: ';' as: LwsSemicolonToken.
	self 
		classifyAll:
			#('constant'  'abstract' 'accept' 'access' 'aliased' 'all' 'at'  'delay' 'delta' 'digits'  'exit' 'use' 'goto' 'limited' 'null' 'of' 'range' 'renames' 'requeue'  'reverse' 'separate' 'tagged'  'until' 'with'  'in' 'out' 'others'  'exception' 'select' 'declare' 'entry' )
		as: LwsKeywordToken.
	self 
		classifyAll:
			#('package' 'procedure' 'function' 'generic'  'protected' 'type' 'subtype' 'record' 'task' 'begin' 'end' 'with' 'is' 'private' 'body'  'if' 'case'  'for' 'loop' 'while' 'else' 'elsif' 'then' 'do' 'return' 'terminate'  'abort' 'raise' 'when'  )
		as: LwsUnitElementToken.
	self classifyAll: #('and' 'new' 'not' 'or' 'rem' 'xor' 'abs' 'mod' 'or else' 'and then' 'not in') as: LwsOperatorToken.
	self classifyAll: #('boolean' 'string' 'integer' 'array') as: LwsBuiltinTypeToken.
	self classify: ':=' as: LwsAssignToken.
	self classify: String tab as: LwsTabulationToken.
	self classify: String space as: LwsSpaceToken.
	self classify: String cr as: LwsEolToken.
	self classify: String lf as: LwsEolToken.
	self classify: String new as: LwsEofToken.
	self
		classificationBlock: [ :v | v size > 1 and: [ v first isDigit and: [v allSatisfy: [ :c | c isDigit or: [ #($. $e $E $- $+ $_ $# $A $B $C $D $E $F) includes: c ] ] ] ] ]
		for: LwsNumberValueToken.
	self classificationBlock: [ :v | v size >= 2 and: [ v first = $" and: [ v last = $" ] ] ] for: LwsStringValueToken.
	self classificationBlock: [ :v | v size = 3 and: [ v first == $' and: [ v last = $' ] ] ] for: LwsCharacterValueToken
]

{ #category : #'public accessing' }
LwsTokenClassifier >> tokenClassFor: aString [
	self heuristicList
		do: [ :assoc | 
			(assoc key value: aString)
				ifTrue: [ ^ assoc value ] ].
	^ self classifier at: aString asLowercase ifAbsent: [ LwsIdentifierToken ]
]
