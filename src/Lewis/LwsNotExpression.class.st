"
<express_specification>
ENTITY LwsNotExpression SUBTYPE OF (LwsSimpleUnaryExpression);
DERIVE
	SELF\LwsSimpleUnaryExpression.opString : STRING := 'not';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNotExpression,
	#superclass : #LwsSimpleUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNotExpression class >> annotation [
	<MSEClass: #LwsNotExpression super: #LwsSimpleUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNotExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNotExpression: self
]

{ #category : #'initialize-release' }
LwsNotExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsNotExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'not'
]
