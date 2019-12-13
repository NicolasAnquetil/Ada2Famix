"
<express_specification>
ENTITY LwsChoice ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsChoice,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsChoice class >> annotation [
	<MSEClass: #LwsChoice super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitChoice: self
]

{ #category : #'initialize-release' }
LwsChoice >> initialize [
	<generatedByPlatypus>
	super initialize
]
