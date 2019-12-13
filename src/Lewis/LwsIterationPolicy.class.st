"
<express_specification>
ENTITY LwsIterationPolicy ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIterationPolicy,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsIterationPolicy class >> annotation [
	<MSEClass: #LwsIterationPolicy super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsIterationPolicy >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIterationPolicy: self
]

{ #category : #'initialize-release' }
LwsIterationPolicy >> initialize [
	<generatedByPlatypus>
	super initialize
]
