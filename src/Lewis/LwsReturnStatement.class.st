"
<express_specification>
ENTITY LwsReturnStatement SUBTYPE OF (LwsSimpleStatement);
	result : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsReturnStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'result'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsReturnStatement class >> annotation [
	<MSEClass: #LwsReturnStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsReturnStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitReturnStatement: self
]

{ #category : #'initialize-release' }
LwsReturnStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	result := nil
]

{ #category : #'explicit attributes' }
LwsReturnStatement >> result [
	<MSEProperty: #result type: #LwsExpression>
	<generatedByPlatypus>
	^ result
]

{ #category : #'explicit attributes' }
LwsReturnStatement >> result: anExpressionOrNil [
	<generatedByPlatypus>
	result := anExpressionOrNil
]
