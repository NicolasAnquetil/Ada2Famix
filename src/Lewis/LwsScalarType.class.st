"
<express_specification>
ENTITY LwsScalarType SUBTYPE OF (LwsElementaryType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsScalarType,
	#superclass : #LwsElementaryType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsScalarType class >> annotation [
	<MSEClass: #LwsScalarType super: #LwsElementaryType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsScalarType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitScalarType: self
]

{ #category : #'initialize-release' }
LwsScalarType >> initialize [
	<generatedByPlatypus>
	super initialize
]
