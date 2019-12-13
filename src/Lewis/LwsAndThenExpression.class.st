"
<express_specification>
ENTITY LwsAndThenExpression SUBTYPE OF (LwsLogicalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'and then';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAndThenExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAndThenExpression class >> annotation [
	<MSEClass: #LwsAndThenExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAndThenExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAndThenExpression: self
]

{ #category : #'initialize-release' }
LwsAndThenExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsAndThenExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'and then'
]
