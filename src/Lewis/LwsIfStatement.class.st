"
<express_specification>
ENTITY LwsIfStatement SUBTYPE OF (LwsCompoundStatement);
	ifClauses : List OF LwsIfClause;
	elseClause : OPTIONAL List OF LwsStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIfStatement,
	#superclass : #LwsCompoundStatement,
	#instVars : [
		'ifClauses',
		'elseClause'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsIfStatement class >> annotation [
	<MSEClass: #LwsIfStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIfStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIfStatement: self
]

{ #category : #'explicit attributes' }
LwsIfStatement >> elseClause [
	<MSEProperty: #elseClause type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ elseClause
]

{ #category : #'explicit attributes' }
LwsIfStatement >> elseClause: aListOfStatementOrNil [
	<generatedByPlatypus>
	elseClause := aListOfStatementOrNil
]

{ #category : #'explicit attributes' }
LwsIfStatement >> ifClauses [
	<MSEProperty: #ifClauses type: #LwsIfClause>
	<multivalued>
	<generatedByPlatypus>
	^ ifClauses
]

{ #category : #'explicit attributes' }
LwsIfStatement >> ifClauses: aListOfIfClause [
	<generatedByPlatypus>
	ifClauses := aListOfIfClause
]

{ #category : #'initialize-release' }
LwsIfStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	ifClauses := OrderedCollection new
]
