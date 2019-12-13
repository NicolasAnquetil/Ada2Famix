"
<express_specification>
ENTITY LwsValueToken SUBTYPE OF (LwsToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsValueToken,
	#superclass : #LwsToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsValueToken class >> annotation [
	<MSEClass: #LwsValueToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsValueToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitValueToken: self
]

{ #category : #'initialize-release' }
LwsValueToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
