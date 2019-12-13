"
<express_specification>
ENTITY LwsAsynchronousSelect SUBTYPE OF (LwsSelectStatement);
	statements : List OF LwsStatement;
	abortStatements : List OF LwsStatement;
WHERE
	haveAtLeastOneStatement :: self statements size >= 1;
	haveAtLeastOneAbordStatement :: self abortStatements size >= 1;
	firstStatementIsEntryCall :: (self statements first isKindOf: LwsEntryCall) or: [ self statements first isKindOf: LwsDelayStatement ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAsynchronousSelect,
	#superclass : #LwsSelectStatement,
	#instVars : [
		'statements',
		'abortStatements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsAsynchronousSelect class >> annotation [
	<MSEClass: #LwsAsynchronousSelect super: #LwsSelectStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #'explicit attributes' }
LwsAsynchronousSelect >> abortStatements [
	<MSEProperty: #abortStatements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ abortStatements
]

{ #category : #'explicit attributes' }
LwsAsynchronousSelect >> abortStatements: aListOfStatement [
	<generatedByPlatypus>
	abortStatements := aListOfStatement
]

{ #category : #visiting }
LwsAsynchronousSelect >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAsynchronousSelect: self
]

{ #category : #'where rules' }
LwsAsynchronousSelect >> firstStatementIsEntryCall [
	<generatedByPlatypus>
	^ (self statements first isKindOf: LwsEntryCall) or: [ self statements first isKindOf: LwsDelayStatement ]
]

{ #category : #'where rules' }
LwsAsynchronousSelect >> haveAtLeastOneAbordStatement [
	<generatedByPlatypus>
	^ self abortStatements size >= 1
]

{ #category : #'where rules' }
LwsAsynchronousSelect >> haveAtLeastOneStatement [
	<generatedByPlatypus>
	^ self statements size >= 1
]

{ #category : #'initialize-release' }
LwsAsynchronousSelect >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new.
	abortStatements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsAsynchronousSelect >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsAsynchronousSelect >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
