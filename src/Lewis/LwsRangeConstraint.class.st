"
<express_specification>
ENTITY LwsRangeConstraint SUBTYPE OF (LwsConstraint);
	range : LwsRange;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRangeConstraint,
	#superclass : #LwsConstraint,
	#instVars : [
		'range'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsRangeConstraint class >> annotation [
	<MSEClass: #LwsRangeConstraint super: #LwsConstraint>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRangeConstraint >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRangeConstraint: self
]

{ #category : #'initialize-release' }
LwsRangeConstraint >> initialize [
	<generatedByPlatypus>
	super initialize.
	range := nil
]

{ #category : #'explicit attributes' }
LwsRangeConstraint >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsRangeConstraint >> range: aRange [
	<generatedByPlatypus>
	range := aRange
]
