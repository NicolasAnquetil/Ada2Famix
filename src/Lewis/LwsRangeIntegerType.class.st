"
<express_specification>
ENTITY LwsRangeIntegerType SUBTYPE OF (LwsIntegerType);
	range : LwsRangeConstraint;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRangeIntegerType,
	#superclass : #LwsIntegerType,
	#instVars : [
		'range'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRangeIntegerType class >> annotation [
	<MSEClass: #LwsRangeIntegerType super: #LwsIntegerType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRangeIntegerType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRangeIntegerType: self
]

{ #category : #'initialize-release' }
LwsRangeIntegerType >> initialize [
	<generatedByPlatypus>
	super initialize.
	range := nil
]

{ #category : #'explicit attributes' }
LwsRangeIntegerType >> range [
	<MSEProperty: #range type: #LwsRangeConstraint>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsRangeIntegerType >> range: aRangeConstraint [
	<generatedByPlatypus>
	range := aRangeConstraint
]
