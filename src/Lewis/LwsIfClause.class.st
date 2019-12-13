"
<express_specification>
ENTITY LwsIfClause SUBTYPE OF (LwsEntity);
	condition : LwsExpression;
	statements : list OF LwsStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIfClause,
	#superclass : #LwsEntity,
	#instVars : [
		'condition',
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsIfClause class >> annotation [
	<MSEClass: #LwsIfClause super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIfClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIfClause: self
]

{ #category : #'explicit attributes' }
LwsIfClause >> condition [
	<MSEProperty: #condition type: #LwsExpression>
	<generatedByPlatypus>
	^ condition
]

{ #category : #'explicit attributes' }
LwsIfClause >> condition: anExpression [
	<generatedByPlatypus>
	condition := anExpression
]

{ #category : #'initialize-release' }
LwsIfClause >> initialize [
	<generatedByPlatypus>
	super initialize.
	condition := nil.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsIfClause >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsIfClause >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
