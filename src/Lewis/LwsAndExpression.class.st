"
<express_specification>
ENTITY LwsAndExpression SUBTYPE OF (LwsLogicalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'and';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAndExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAndExpression class >> annotation [
	<MSEClass: #LwsAndExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAndExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAndExpression: self
]

{ #category : #'initialize-release' }
LwsAndExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsAndExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'and'
]
