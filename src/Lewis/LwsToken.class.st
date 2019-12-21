"
<express_specification>
ENTITY LwsToken;
	start : Integer;
	id : PRIVATE Array OF Integer;
	value : String;
	blanks : List OF LwsBlankToken ::= OrderedCollection new;
	level : OPTIONAL integer ::= 0;
DERIVE
	blankString : String ::= String streamContents: [ :strm | self blanks do: [ :b | strm nextPutAll: b parsedString ] ];
	parsedString : String ::= 
			String
				streamContents: [ :strm | 
					strm
						nextPutAll: self blankString;
						nextPutAll: self value ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsToken,
	#superclass : #PtsObject,
	#instVars : [
		'id',
		'blanks',
		'start',
		'value',
		'level'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsToken class >> annotation [
	<MSEClass: #LwsToken super: #PtsObject>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsToken class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #visiting }
LwsToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitToken: self
]

{ #category : #'derived attributes' }
LwsToken >> blankString [
	<MSEProperty: #blankString type: #String>
	<derived>
	<generatedByPlatypus>
	^ String streamContents: [ :strm | self blanks do: [ :b | strm nextPutAll: b parsedString ] ]
]

{ #category : #'explicit attributes' }
LwsToken >> blanks [
	<MSEProperty: #blanks type: #LwsBlankToken>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ blanks ifNil: [ blanks := self blanksDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsToken >> blanks: aListOfBlankToken [
	<generatedByPlatypus>
	blanks := aListOfBlankToken
]

{ #category : #'explicit attributes' }
LwsToken >> blanksDefaultValue [
	<MSEProperty: #blanks type: #LwsBlankToken>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]

{ #category : #'system primitive' }
LwsToken >> doesNotUnderstand: aMessage [
	<generatedByPlatypus>
	(self class namespace receiverOfMessage: aMessage) ifNotNil: [ :rcvr | ^ aMessage sendTo: rcvr ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #'explicit attributes' }
LwsToken >> id [
	<MSEProperty: #id type: #Number>
	<multivalued>
	<generatedByPlatypus>
	^ id
]

{ #category : #'explicit attributes' }
LwsToken >> id: anArrayOfNumber [
	<generatedByPlatypus>
	id := anArrayOfNumber
]

{ #category : #'explicit attributes' }
LwsToken >> ids [
	self flag: 'for compatibility with LwsParser'.
	^ id
]

{ #category : #'initialize-release' }
LwsToken >> initialize [
	<generatedByPlatypus>
	super initialize.
	start := nil.
	id := OrderedCollection new.
	value := nil.
	level := nil
]

{ #category : #'explicit attributes' }
LwsToken >> level [
	<MSEProperty: #level type: #Number>
	<generatedByPlatypus>
	^ level
]

{ #category : #'explicit attributes' }
LwsToken >> level: aNumberOrNil [
	<generatedByPlatypus>
	level := aNumberOrNil
]

{ #category : #'derived attributes' }
LwsToken >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<derived>
	<generatedByPlatypus>
	^ String
		streamContents: [ :strm | 
			strm
				nextPutAll: self blankString;
				nextPutAll: self value ]
]

{ #category : #'explicit attributes' }
LwsToken >> start [
	<MSEProperty: #start type: #Number>
	<generatedByPlatypus>
	^ start
]

{ #category : #'explicit attributes' }
LwsToken >> start: aNumber [
	<generatedByPlatypus>
	start := aNumber
]

{ #category : #'explicit attributes' }
LwsToken >> value [
	<MSEProperty: #value type: #String>
	<generatedByPlatypus>
	^ value
]

{ #category : #'explicit attributes' }
LwsToken >> value: aString [
	<generatedByPlatypus>
	value := aString
]
