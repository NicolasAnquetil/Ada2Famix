"
<express_specification>
ENTITY LwsStringValueToken SUBTYPE OF (LwsValueToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStringValueToken,
	#superclass : #LwsValueToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsStringValueToken class >> annotation [
	<MSEClass: #LwsStringValueToken super: #LwsValueToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsStringValueToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStringValueToken: self
]

{ #category : #'initialize-release' }
LwsStringValueToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
