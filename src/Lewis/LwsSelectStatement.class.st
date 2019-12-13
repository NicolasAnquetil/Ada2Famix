"
<express_specification>
ENTITY LwsSelectStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsCompoundStatement);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSelectStatement,
	#superclass : #LwsCompoundStatement,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsSelectStatement class >> annotation [
	<MSEClass: #LwsSelectStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsSelectStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSelectStatement: self
]

{ #category : #'initialize-release' }
LwsSelectStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]
