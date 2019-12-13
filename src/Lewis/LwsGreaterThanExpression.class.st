"
<express_specification>
ENTITY LwsGreaterThanExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '>';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGreaterThanExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsGreaterThanExpression class >> annotation [
	<MSEClass: #LwsGreaterThanExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGreaterThanExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGreaterThanExpression: self
]

{ #category : #'initialize-release' }
LwsGreaterThanExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsGreaterThanExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '>'
]
