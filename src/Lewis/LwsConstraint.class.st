"
<express_specification>
ENTITY LwsConstraint ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsConstraint,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsConstraint class >> annotation [
	<MSEClass: #LwsConstraint super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsConstraint >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitConstraint: self
]

{ #category : #'initialize-release' }
LwsConstraint >> initialize [
	<generatedByPlatypus>
	super initialize
]
