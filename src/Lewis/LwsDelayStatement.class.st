"
<express_specification>
ENTITY LwsDelayStatement SUBTYPE OF (LwsSimpleStatement);
	delay : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDelayStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'delay'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsDelayStatement class >> annotation [
	<MSEClass: #LwsDelayStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDelayStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDelayStatement: self
]

{ #category : #'explicit attributes' }
LwsDelayStatement >> delay [
	<MSEProperty: #delay type: #LwsExpression>
	<generatedByPlatypus>
	^ delay
]

{ #category : #'explicit attributes' }
LwsDelayStatement >> delay: anExpression [
	<generatedByPlatypus>
	delay := anExpression
]

{ #category : #'initialize-release' }
LwsDelayStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	delay := nil
]
