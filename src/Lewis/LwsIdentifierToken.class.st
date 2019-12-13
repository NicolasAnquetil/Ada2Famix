"
<express_specification>
ENTITY LwsIdentifierToken SUBTYPE OF (LwsToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIdentifierToken,
	#superclass : #LwsToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsIdentifierToken class >> annotation [
	<MSEClass: #LwsIdentifierToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIdentifierToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIdentifierToken: self
]

{ #category : #'initialize-release' }
LwsIdentifierToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
