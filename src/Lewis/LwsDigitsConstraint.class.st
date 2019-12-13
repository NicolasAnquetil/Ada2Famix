"
<express_specification>
ENTITY LwsDigitsConstraint SUBTYPE OF (LwsConstraint);
	expression : LwsExpression;
	rangeConstraint : OPTIONAL LwsRangeConstraint;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDigitsConstraint,
	#superclass : #LwsConstraint,
	#instVars : [
		'expression',
		'rangeConstraint'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDigitsConstraint class >> annotation [
	<MSEClass: #LwsDigitsConstraint super: #LwsConstraint>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDigitsConstraint >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDigitsConstraint: self
]

{ #category : #'explicit attributes' }
LwsDigitsConstraint >> expression [
	<MSEProperty: #expression type: #LwsExpression>
	<generatedByPlatypus>
	^ expression
]

{ #category : #'explicit attributes' }
LwsDigitsConstraint >> expression: anExpression [
	<generatedByPlatypus>
	expression := anExpression
]

{ #category : #'initialize-release' }
LwsDigitsConstraint >> initialize [
	<generatedByPlatypus>
	super initialize.
	expression := nil.
	rangeConstraint := nil
]

{ #category : #'explicit attributes' }
LwsDigitsConstraint >> rangeConstraint [
	<MSEProperty: #rangeConstraint type: #LwsRangeConstraint>
	<generatedByPlatypus>
	^ rangeConstraint
]

{ #category : #'explicit attributes' }
LwsDigitsConstraint >> rangeConstraint: aRangeConstraintOrNil [
	<generatedByPlatypus>
	rangeConstraint := aRangeConstraintOrNil
]
