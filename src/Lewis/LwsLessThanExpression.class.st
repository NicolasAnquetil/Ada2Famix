"
<express_specification>
ENTITY LwsLessThanExpression SUBTYPE OF (LwsRelationalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := '<';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLessThanExpression,
	#superclass : #LwsRelationalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsLessThanExpression class >> annotation [
	<MSEClass: #LwsLessThanExpression super: #LwsRelationalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsLessThanExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLessThanExpression: self
]

{ #category : #'initialize-release' }
LwsLessThanExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsLessThanExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ '<'
]
