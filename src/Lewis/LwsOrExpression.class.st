"
<express_specification>
ENTITY LwsOrExpression SUBTYPE OF (LwsLogicalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'or';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOrExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsOrExpression class >> annotation [
	<MSEClass: #LwsOrExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOrExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOrExpression: self
]

{ #category : #'initialize-release' }
LwsOrExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsOrExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'or'
]
