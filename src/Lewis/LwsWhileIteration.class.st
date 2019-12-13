"
<express_specification>
ENTITY LwsWhileIteration SUBTYPE OF (LwsIterationPolicy);
	condition : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsWhileIteration,
	#superclass : #LwsIterationPolicy,
	#instVars : [
		'condition'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsWhileIteration class >> annotation [
	<MSEClass: #LwsWhileIteration super: #LwsIterationPolicy>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsWhileIteration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitWhileIteration: self
]

{ #category : #'explicit attributes' }
LwsWhileIteration >> condition [
	<MSEProperty: #condition type: #LwsExpression>
	<generatedByPlatypus>
	^ condition
]

{ #category : #'explicit attributes' }
LwsWhileIteration >> condition: anExpression [
	<generatedByPlatypus>
	condition := anExpression
]

{ #category : #'initialize-release' }
LwsWhileIteration >> initialize [
	<generatedByPlatypus>
	super initialize.
	condition := nil
]
