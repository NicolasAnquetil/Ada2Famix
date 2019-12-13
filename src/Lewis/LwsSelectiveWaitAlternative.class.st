"
<express_specification>
ENTITY LwsSelectiveWaitAlternative ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	when : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSelectiveWaitAlternative,
	#superclass : #LwsEntity,
	#instVars : [
		'when'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsSelectiveWaitAlternative class >> annotation [
	<MSEClass: #LwsSelectiveWaitAlternative super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsSelectiveWaitAlternative >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSelectiveWaitAlternative: self
]

{ #category : #'initialize-release' }
LwsSelectiveWaitAlternative >> initialize [
	<generatedByPlatypus>
	super initialize.
	when := nil
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitAlternative >> when [
	<MSEProperty: #when type: #LwsExpression>
	<generatedByPlatypus>
	^ when
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitAlternative >> when: anExpressionOrNil [
	<generatedByPlatypus>
	when := anExpressionOrNil
]
