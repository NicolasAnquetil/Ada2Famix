"
<express_specification>
ENTITY LwsSimpleType SUBTYPE OF (LwsDiscreteType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSimpleType,
	#superclass : #LwsDiscreteType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSimpleType class >> annotation [
	<MSEClass: #LwsSimpleType super: #LwsDiscreteType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSimpleType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSimpleType: self
]

{ #category : #'initialize-release' }
LwsSimpleType >> initialize [
	<generatedByPlatypus>
	super initialize
]
