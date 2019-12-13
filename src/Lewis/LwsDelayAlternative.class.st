"
<express_specification>
ENTITY LwsDelayAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
	statements : List OF LwsStatement;
WHERE
	haveAtLeastOneStatement :: self statements size >= 1;
	firstStatementIsDelay :: self statements first isKindOf: LwsDelayStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDelayAlternative,
	#superclass : #LwsSelectiveWaitAlternative,
	#instVars : [
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsDelayAlternative class >> annotation [
	<MSEClass: #LwsDelayAlternative super: #LwsSelectiveWaitAlternative>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDelayAlternative >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDelayAlternative: self
]

{ #category : #'where rules' }
LwsDelayAlternative >> firstStatementIsDelay [
	<generatedByPlatypus>
	^ self statements first isKindOf: LwsDelayStatement
]

{ #category : #'where rules' }
LwsDelayAlternative >> haveAtLeastOneStatement [
	<generatedByPlatypus>
	^ self statements size >= 1
]

{ #category : #'initialize-release' }
LwsDelayAlternative >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsDelayAlternative >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsDelayAlternative >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
