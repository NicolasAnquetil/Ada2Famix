"
<express_specification>
ENTITY LwsCompoundStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsStatement);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCompoundStatement,
	#superclass : #LwsStatement,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsCompoundStatement class >> annotation [
	<MSEClass: #LwsCompoundStatement super: #LwsStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsCompoundStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCompoundStatement: self
]

{ #category : #'initialize-release' }
LwsCompoundStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]
