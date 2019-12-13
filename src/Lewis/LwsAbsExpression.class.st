"
<express_specification>
ENTITY LwsAbsExpression SUBTYPE OF (LwsSimpleUnaryExpression);
DERIVE
	SELF\LwsSimpleUnaryExpression.opString : STRING := 'abs';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAbsExpression,
	#superclass : #LwsSimpleUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAbsExpression class >> annotation [
	<MSEClass: #LwsAbsExpression super: #LwsSimpleUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAbsExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAbsExpression: self
]

{ #category : #'initialize-release' }
LwsAbsExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsAbsExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'abs'
]
