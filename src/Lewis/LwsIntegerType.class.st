"
<express_specification>
ENTITY LwsIntegerType SUBTYPE OF (LwsSimpleType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIntegerType,
	#superclass : #LwsSimpleType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsIntegerType class >> annotation [
	<MSEClass: #LwsIntegerType super: #LwsSimpleType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIntegerType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIntegerType: self
]

{ #category : #'initialize-release' }
LwsIntegerType >> initialize [
	<generatedByPlatypus>
	super initialize
]
