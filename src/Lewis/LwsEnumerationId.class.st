"
<express_specification>
ENTITY LwsEnumerationId ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEnumerationId,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsEnumerationId class >> annotation [
	<MSEClass: #LwsEnumerationId super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsEnumerationId >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEnumerationId: self
]

{ #category : #'initialize-release' }
LwsEnumerationId >> initialize [
	<generatedByPlatypus>
	super initialize
]
