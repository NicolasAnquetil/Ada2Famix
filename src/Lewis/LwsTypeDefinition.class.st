"
<express_specification>
ENTITY LwsTypeDefinition SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTypeDefinition,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTypeDefinition class >> annotation [
	<MSEClass: #LwsTypeDefinition super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTypeDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTypeDefinition: self
]

{ #category : #'initialize-release' }
LwsTypeDefinition >> initialize [
	<generatedByPlatypus>
	super initialize
]
