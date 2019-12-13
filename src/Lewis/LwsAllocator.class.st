"
<express_specification>
ENTITY LwsAllocator SUBTYPE OF (LwsSimpleUnaryExpression);
	SELF\LwsSimpleUnaryExpression.right : LwsQualifiedIdentifier;
DERIVE
	SELF\LwsSimpleUnaryExpression.opString : STRING := 'new';
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAllocator,
	#superclass : #LwsSimpleUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAllocator class >> annotation [
	<MSEClass: #LwsAllocator super: #LwsSimpleUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAllocator >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAllocator: self
]

{ #category : #'initialize-release' }
LwsAllocator >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsAllocator >> opString [
	<MSEProperty: #opString type: #String>
	<derived>
	<generatedByPlatypus>
	^ 'new'
]
