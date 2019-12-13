"
<express_specification>
ENTITY LwsPragmaToken SUBTYPE OF (LwsCommentToken);
	pragma : LwsPragma;
	tokens : List OF LwsToken;
DERIVE
	parsedString : String ::= 
			String
				streamContents: [ :strm | 
					strm nextPutAll: super parsedString asUppercase.
					self tokens do: [ :t | strm nextPutAll: t parsedString ] ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPragmaToken,
	#superclass : #LwsCommentToken,
	#instVars : [
		'tokens',
		'pragma'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsPragmaToken class >> annotation [
	<MSEClass: #LwsPragmaToken super: #LwsCommentToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPragmaToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPragmaToken: self
]

{ #category : #'initialize-release' }
LwsPragmaToken >> initialize [
	<generatedByPlatypus>
	super initialize.
	pragma := nil.
	tokens := OrderedCollection new
]

{ #category : #'derived attributes' }
LwsPragmaToken >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<derived>
	<generatedByPlatypus>
	^ String
		streamContents: [ :strm | 
			strm nextPutAll: super parsedString asUppercase.
			self tokens do: [ :t | strm nextPutAll: t parsedString ] ]
]

{ #category : #'explicit attributes' }
LwsPragmaToken >> pragma [
	<MSEProperty: #pragma type: #LwsPragma>
	<generatedByPlatypus>
	^ pragma
]

{ #category : #'explicit attributes' }
LwsPragmaToken >> pragma: aPragma [
	<generatedByPlatypus>
	pragma := aPragma
]

{ #category : #'explicit attributes' }
LwsPragmaToken >> tokens [
	<MSEProperty: #tokens type: #LwsToken>
	<multivalued>
	<generatedByPlatypus>
	^ tokens
]

{ #category : #'explicit attributes' }
LwsPragmaToken >> tokens: aListOfToken [
	<generatedByPlatypus>
	tokens := aListOfToken
]
