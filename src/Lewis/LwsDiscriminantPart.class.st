"
<express_specification>
ENTITY LwsDiscriminantPart ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDiscriminantPart,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDiscriminantPart class >> annotation [
	<MSEClass: #LwsDiscriminantPart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsDiscriminantPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDiscriminantPart: self
]

{ #category : #'initialize-release' }
LwsDiscriminantPart >> initialize [
	<generatedByPlatypus>
	super initialize
]
