"
<express_specification>
ENTITY LwsProtectedUnitPart SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitPart,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitPart class >> annotation [
	<MSEClass: #LwsProtectedUnitPart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitPart: self
]

{ #category : #'initialize-release' }
LwsProtectedUnitPart >> initialize [
	<generatedByPlatypus>
	super initialize
]
