"
<express_specification>
ENTITY LwsOrElseExpression SUBTYPE OF (LwsLogicalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'or else';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOrElseExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsOrElseExpression class >> annotation [
	<MSEClass: #LwsOrElseExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOrElseExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOrElseExpression: self
]

{ #category : #'initialize-release' }
LwsOrElseExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsOrElseExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'or else'
]
