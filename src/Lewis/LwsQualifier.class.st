"
<express_specification>
ENTITY LwsQualifier ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsQualifier,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsQualifier class >> annotation [
	<MSEClass: #LwsQualifier super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsQualifier >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitQualifier: self
]

{ #category : #'initialize-release' }
LwsQualifier >> initialize [
	<generatedByPlatypus>
	super initialize
]
