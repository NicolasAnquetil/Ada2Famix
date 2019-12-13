"
<express_specification>
ENTITY LwsRepresentation ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRepresentation,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRepresentation class >> annotation [
	<MSEClass: #LwsRepresentation super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsRepresentation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRepresentation: self
]

{ #category : #'initialize-release' }
LwsRepresentation >> initialize [
	<generatedByPlatypus>
	super initialize
]
