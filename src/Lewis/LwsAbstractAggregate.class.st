"
<express_specification>
ENTITY LwsAbstractAggregate ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAbstractAggregate,
	#superclass : #LwsUnaryExpression,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAbstractAggregate class >> annotation [
	<MSEClass: #LwsAbstractAggregate super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsAbstractAggregate >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAbstractAggregate: self
]

{ #category : #'initialize-release' }
LwsAbstractAggregate >> initialize [
	<generatedByPlatypus>
	super initialize
]
