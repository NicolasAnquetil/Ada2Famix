"
<express_specification>
ENTITY LwsDiscreteType SUBTYPE OF (LwsScalarType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDiscreteType,
	#superclass : #LwsScalarType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDiscreteType class >> annotation [
	<MSEClass: #LwsDiscreteType super: #LwsScalarType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDiscreteType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDiscreteType: self
]

{ #category : #'initialize-release' }
LwsDiscreteType >> initialize [
	<generatedByPlatypus>
	super initialize
]
