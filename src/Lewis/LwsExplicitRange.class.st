"
<express_specification>
ENTITY LwsExplicitRange SUBTYPE OF (LwsRange);
	start : LwsExpression;
	stop : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExplicitRange,
	#superclass : #LwsRange,
	#instVars : [
		'stop',
		'start'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsExplicitRange class >> annotation [
	<MSEClass: #LwsExplicitRange super: #LwsRange>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExplicitRange >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExplicitRange: self
]

{ #category : #'initialize-release' }
LwsExplicitRange >> initialize [
	<generatedByPlatypus>
	super initialize.
	start := nil.
	stop := nil
]

{ #category : #'explicit attributes' }
LwsExplicitRange >> start [
	<MSEProperty: #start type: #LwsExpression>
	<generatedByPlatypus>
	^ start
]

{ #category : #'explicit attributes' }
LwsExplicitRange >> start: anExpression [
	<generatedByPlatypus>
	start := anExpression
]

{ #category : #'explicit attributes' }
LwsExplicitRange >> stop [
	<MSEProperty: #stop type: #LwsExpression>
	<generatedByPlatypus>
	^ stop
]

{ #category : #'explicit attributes' }
LwsExplicitRange >> stop: anExpression [
	<generatedByPlatypus>
	stop := anExpression
]
