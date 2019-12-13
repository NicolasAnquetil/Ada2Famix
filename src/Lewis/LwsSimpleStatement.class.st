"
<express_specification>
ENTITY LwsSimpleStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsStatement);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSimpleStatement,
	#superclass : #LwsStatement,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsSimpleStatement class >> annotation [
	<MSEClass: #LwsSimpleStatement super: #LwsStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsSimpleStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSimpleStatement: self
]

{ #category : #'initialize-release' }
LwsSimpleStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]
