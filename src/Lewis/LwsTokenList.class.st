"
<express_specification>
ENTITY LwsTokenList;
	tokens : List OF LwsToken ::= OrderedCollection new;
DERIVE
	size : Integer ::= self tokens size;
	last : LwsToken ::= self tokens ifEmpty: [  ] ifNotEmpty: [ :t | t last ];
	asString : String ::= String streamContents: [ :strm | self tokens do: [ :t | strm nextPutAll: t parsedString ] ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTokenList,
	#superclass : #PtsObject,
	#instVars : [
		'tokens'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsTokenList class >> annotation [
	<MSEClass: #LwsTokenList super: #PtsObject>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsTokenList class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #visiting }
LwsTokenList >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTokenList: self
]

{ #category : #'derived attributes' }
LwsTokenList >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ String streamContents: [ :strm | self tokens do: [ :t | strm nextPutAll: t parsedString ] ]
]

{ #category : #'system primitive' }
LwsTokenList >> doesNotUnderstand: aMessage [
	<generatedByPlatypus>
	(self class namespace receiverOfMessage: aMessage) ifNotNil: [ :rcvr | ^ aMessage sendTo: rcvr ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #'initialize-release' }
LwsTokenList >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsTokenList >> last [
	<MSEProperty: #last type: #LwsToken>
	<derived>
	<generatedByPlatypus>
	^ self tokens ifEmpty: [  ] ifNotEmpty: [ :t | t last ]
]

{ #category : #'derived attributes' }
LwsTokenList >> size [
	<MSEProperty: #size type: #Number>
	<derived>
	<generatedByPlatypus>
	^ self tokens size
]

{ #category : #'explicit attributes' }
LwsTokenList >> tokens [
	<MSEProperty: #tokens type: #LwsToken>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ tokens ifNil: [ tokens := self tokensDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsTokenList >> tokens: aListOfToken [
	<generatedByPlatypus>
	tokens := aListOfToken
]

{ #category : #'explicit attributes' }
LwsTokenList >> tokensDefaultValue [
	<MSEProperty: #tokens type: #LwsToken>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]
