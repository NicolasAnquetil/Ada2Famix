"
<express_specification>
ENTITY LwsRealType SUBTYPE OF (LwsScalarType);
	range : OPTIONAL LwsRangeConstraint;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRealType,
	#superclass : #LwsScalarType,
	#instVars : [
		'range'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRealType class >> annotation [
	<MSEClass: #LwsRealType super: #LwsScalarType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRealType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRealType: self
]

{ #category : #'initialize-release' }
LwsRealType >> initialize [
	<generatedByPlatypus>
	super initialize.
	range := nil
]

{ #category : #'explicit attributes' }
LwsRealType >> range [
	<MSEProperty: #range type: #LwsRangeConstraint>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsRealType >> range: aRangeConstraintOrNil [
	<generatedByPlatypus>
	range := aRangeConstraintOrNil
]
