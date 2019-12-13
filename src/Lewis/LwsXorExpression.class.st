"
<express_specification>
ENTITY LwsXorExpression SUBTYPE OF (LwsLogicalExpression);
DERIVE
	SELF\LwsBinaryExpression.opString : STRING := 'xor';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsXorExpression,
	#superclass : #LwsLogicalExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsXorExpression class >> annotation [
	<MSEClass: #LwsXorExpression super: #LwsLogicalExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsXorExpression >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitXorExpression: self
]

{ #category : #'initialize-release' }
LwsXorExpression >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsXorExpression >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'xor'
]
