"
<express_specification>
ENTITY LwsTimedEntryCall SUBTYPE OF (LwsSelectStatement);
	statements : List OF LwsStatement;
	orStatements : List OF LwsStatement;
WHERE
	haveAtLeastOneStatement :: self statements size >= 1;
	haveAtLeastOneOrStatement :: self orStatements size >= 1;
	firstStatementIsEntryCall :: self statements first isKindOf: LwsEntryCall;
	firstOrStatementIsDelay :: self orStatements first isKindOf: LwsDelayStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTimedEntryCall,
	#superclass : #LwsSelectStatement,
	#instVars : [
		'orStatements',
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsTimedEntryCall class >> annotation [
	<MSEClass: #LwsTimedEntryCall super: #LwsSelectStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTimedEntryCall >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTimedEntryCall: self
]

{ #category : #'where rules' }
LwsTimedEntryCall >> firstOrStatementIsDelay [
	<generatedByPlatypus>
	^ self orStatements first isKindOf: LwsDelayStatement
]

{ #category : #'where rules' }
LwsTimedEntryCall >> firstStatementIsEntryCall [
	<generatedByPlatypus>
	^ self statements first isKindOf: LwsEntryCall
]

{ #category : #'where rules' }
LwsTimedEntryCall >> haveAtLeastOneOrStatement [
	<generatedByPlatypus>
	^ self orStatements size >= 1
]

{ #category : #'where rules' }
LwsTimedEntryCall >> haveAtLeastOneStatement [
	<generatedByPlatypus>
	^ self statements size >= 1
]

{ #category : #'initialize-release' }
LwsTimedEntryCall >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new.
	orStatements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsTimedEntryCall >> orStatements [
	<MSEProperty: #orStatements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ orStatements
]

{ #category : #'explicit attributes' }
LwsTimedEntryCall >> orStatements: aListOfStatement [
	<generatedByPlatypus>
	orStatements := aListOfStatement
]

{ #category : #'explicit attributes' }
LwsTimedEntryCall >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsTimedEntryCall >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
