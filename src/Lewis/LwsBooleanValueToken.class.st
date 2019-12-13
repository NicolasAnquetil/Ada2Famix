"
<express_specification>
ENTITY LwsBooleanValueToken SUBTYPE OF (LwsValueToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBooleanValueToken,
	#superclass : #LwsValueToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsBooleanValueToken class >> annotation [
	<MSEClass: #LwsBooleanValueToken super: #LwsValueToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBooleanValueToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBooleanValueToken: self
]

{ #category : #'initialize-release' }
LwsBooleanValueToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
