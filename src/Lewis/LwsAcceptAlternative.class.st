"
<express_specification>
ENTITY LwsAcceptAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
	statements : List OF LwsStatement;
WHERE
	haveAtLeastOneStatement :: self statements size >= 1;
	firstStatementIsAccept :: self statements first isKindOf: LwsAcceptStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAcceptAlternative,
	#superclass : #LwsSelectiveWaitAlternative,
	#instVars : [
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsAcceptAlternative class >> annotation [
	<MSEClass: #LwsAcceptAlternative super: #LwsSelectiveWaitAlternative>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAcceptAlternative >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAcceptAlternative: self
]

{ #category : #'where rules' }
LwsAcceptAlternative >> firstStatementIsAccept [
	<generatedByPlatypus>
	^ self statements first isKindOf: LwsAcceptStatement
]

{ #category : #'where rules' }
LwsAcceptAlternative >> haveAtLeastOneStatement [
	<generatedByPlatypus>
	^ self statements size >= 1
]

{ #category : #'initialize-release' }
LwsAcceptAlternative >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsAcceptAlternative >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsAcceptAlternative >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
