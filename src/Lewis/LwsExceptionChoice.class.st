"
<express_specification>
ENTITY LwsExceptionChoice ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExceptionChoice,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsExceptionChoice class >> annotation [
	<MSEClass: #LwsExceptionChoice super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsExceptionChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExceptionChoice: self
]

{ #category : #'initialize-release' }
LwsExceptionChoice >> initialize [
	<generatedByPlatypus>
	super initialize
]
