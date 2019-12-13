"
<express_specification>
ENTITY LwsAnyRangeType SUBTYPE OF (LwsAnyType);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAnyRangeType,
	#superclass : #LwsAnyType,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAnyRangeType class >> annotation [
	<MSEClass: #LwsAnyRangeType super: #LwsAnyType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAnyRangeType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAnyRangeType: self
]

{ #category : #'initialize-release' }
LwsAnyRangeType >> initialize [
	<generatedByPlatypus>
	super initialize
]
