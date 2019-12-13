"
<express_specification>
ENTITY LwsFixedType SUBTYPE OF (LwsRealType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFixedType,
	#superclass : #LwsRealType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsFixedType class >> annotation [
	<MSEClass: #LwsFixedType super: #LwsRealType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFixedType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFixedType: self
]

{ #category : #'initialize-release' }
LwsFixedType >> initialize [
	<generatedByPlatypus>
	super initialize
]
