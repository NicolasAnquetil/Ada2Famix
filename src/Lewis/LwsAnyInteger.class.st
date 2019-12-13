"
<express_specification>
ENTITY LwsAnyInteger SUBTYPE OF (LwsScalarType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAnyInteger,
	#superclass : #LwsScalarType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAnyInteger class >> annotation [
	<MSEClass: #LwsAnyInteger super: #LwsScalarType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAnyInteger >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAnyInteger: self
]

{ #category : #'initialize-release' }
LwsAnyInteger >> initialize [
	<generatedByPlatypus>
	super initialize
]
