"
<express_specification>
ENTITY LwsCharacterValueToken SUBTYPE OF (LwsValueToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCharacterValueToken,
	#superclass : #LwsValueToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsCharacterValueToken class >> annotation [
	<MSEClass: #LwsCharacterValueToken super: #LwsValueToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCharacterValueToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCharacterValueToken: self
]

{ #category : #'initialize-release' }
LwsCharacterValueToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
