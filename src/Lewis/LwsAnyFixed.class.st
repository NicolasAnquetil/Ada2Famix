"
<express_specification>
ENTITY LwsAnyFixed SUBTYPE OF (LwsScalarType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAnyFixed,
	#superclass : #LwsScalarType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAnyFixed class >> annotation [
	<MSEClass: #LwsAnyFixed super: #LwsScalarType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAnyFixed >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAnyFixed: self
]

{ #category : #'initialize-release' }
LwsAnyFixed >> initialize [
	<generatedByPlatypus>
	super initialize
]
