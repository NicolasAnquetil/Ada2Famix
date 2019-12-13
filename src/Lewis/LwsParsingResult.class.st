"
<express_specification>
ENTITY LwsParsingResult SUBTYPE OF (LwsEntity);
	entities : List OF LwsEntity;
	tokenList : LwsTokenList ::= LwsTokenList new;
DERIVE
	tokens : List OF LwsToken ::= self tokenList tokens;
	asString : String ::= self tokenList asString;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsParsingResult,
	#superclass : #LwsEntity,
	#instVars : [
		'tokenList',
		'entities'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsParsingResult class >> annotation [
	<MSEClass: #LwsParsingResult super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsParsingResult >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitParsingResult: self
]

{ #category : #'derived attributes' }
LwsParsingResult >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self tokenList asString
]

{ #category : #'explicit attributes' }
LwsParsingResult >> entities [
	<MSEProperty: #entities type: #LwsEntity>
	<multivalued>
	<generatedByPlatypus>
	^ entities
]

{ #category : #'explicit attributes' }
LwsParsingResult >> entities: aListOfEntity [
	<generatedByPlatypus>
	entities := aListOfEntity
]

{ #category : #'initialize-release' }
LwsParsingResult >> initialize [
	<generatedByPlatypus>
	super initialize.
	entities := OrderedCollection new.
	tokenList := nil
]

{ #category : #'explicit attributes' }
LwsParsingResult >> tokenList [
	<MSEProperty: #tokenList type: #LwsTokenList>
	<derived>
	<generatedByPlatypus>
	^ tokenList ifNil: [ tokenList := self tokenListDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsParsingResult >> tokenList: aTokenList [
	<generatedByPlatypus>
	tokenList := aTokenList
]

{ #category : #'explicit attributes' }
LwsParsingResult >> tokenListDefaultValue [
	<MSEProperty: #tokenList type: #LwsTokenList>
	<derived>
	<generatedByPlatypus>
	^ LwsTokenList new
]

{ #category : #'derived attributes' }
LwsParsingResult >> tokens [
	<MSEProperty: #tokens type: #LwsToken>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ self tokenList tokens
]
