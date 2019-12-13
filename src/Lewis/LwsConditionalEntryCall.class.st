"
<express_specification>
ENTITY LwsConditionalEntryCall SUBTYPE OF (LwsSelectStatement);
	statements : List OF LwsStatement;
	elseStatements : List OF LwsStatement;
WHERE
	haveAtLeastOneStatement :: self statements size >= 1;
	firstStatementIsEntryCall :: self statements first isKindOf: LwsEntryCall;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsConditionalEntryCall,
	#superclass : #LwsSelectStatement,
	#instVars : [
		'elseStatements',
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsConditionalEntryCall class >> annotation [
	<MSEClass: #LwsConditionalEntryCall super: #LwsSelectStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsConditionalEntryCall >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitConditionalEntryCall: self
]

{ #category : #'explicit attributes' }
LwsConditionalEntryCall >> elseStatements [
	<MSEProperty: #elseStatements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ elseStatements
]

{ #category : #'explicit attributes' }
LwsConditionalEntryCall >> elseStatements: aListOfStatement [
	<generatedByPlatypus>
	elseStatements := aListOfStatement
]

{ #category : #'where rules' }
LwsConditionalEntryCall >> firstStatementIsEntryCall [
	<generatedByPlatypus>
	^ self statements first isKindOf: LwsEntryCall
]

{ #category : #'where rules' }
LwsConditionalEntryCall >> haveAtLeastOneStatement [
	<generatedByPlatypus>
	^ self statements size >= 1
]

{ #category : #'initialize-release' }
LwsConditionalEntryCall >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new.
	elseStatements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsConditionalEntryCall >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsConditionalEntryCall >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
