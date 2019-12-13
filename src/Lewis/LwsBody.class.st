"
<express_specification>
ENTITY LwsBody ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBody,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsBody class >> annotation [
	<MSEClass: #LwsBody super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBody: self
]

{ #category : #'initialize-release' }
LwsBody >> initialize [
	<generatedByPlatypus>
	super initialize
]
