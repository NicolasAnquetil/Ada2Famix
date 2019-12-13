"
<express_specification>
ENTITY LwsGenericFormalElement ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalElement,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalElement class >> annotation [
	<MSEClass: #LwsGenericFormalElement super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsGenericFormalElement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalElement: self
]

{ #category : #'initialize-release' }
LwsGenericFormalElement >> initialize [
	<generatedByPlatypus>
	super initialize
]
