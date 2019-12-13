"
<express_specification>
ENTITY LwsSelectiveWaitStatement SUBTYPE OF (LwsSelectStatement);
	alternatives : List OF LwsSelectiveWaitAlternative;
	elseAlternative : List OF LwsStatement;
WHERE
	haveAtLeastOneAlternative :: self alternatives size >= 1;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSelectiveWaitStatement,
	#superclass : #LwsSelectStatement,
	#instVars : [
		'elseAlternative',
		'alternatives'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsSelectiveWaitStatement class >> annotation [
	<MSEClass: #LwsSelectiveWaitStatement super: #LwsSelectStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSelectiveWaitStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSelectiveWaitStatement: self
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitStatement >> alternatives [
	<MSEProperty: #alternatives type: #LwsSelectiveWaitAlternative>
	<multivalued>
	<generatedByPlatypus>
	^ alternatives
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitStatement >> alternatives: aListOfSelectiveWaitAlternative [
	<generatedByPlatypus>
	alternatives := aListOfSelectiveWaitAlternative
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitStatement >> elseAlternative [
	<MSEProperty: #elseAlternative type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ elseAlternative
]

{ #category : #'explicit attributes' }
LwsSelectiveWaitStatement >> elseAlternative: aListOfStatement [
	<generatedByPlatypus>
	elseAlternative := aListOfStatement
]

{ #category : #'where rules' }
LwsSelectiveWaitStatement >> haveAtLeastOneAlternative [
	<generatedByPlatypus>
	^ self alternatives size >= 1
]

{ #category : #'initialize-release' }
LwsSelectiveWaitStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	alternatives := OrderedCollection new.
	elseAlternative := OrderedCollection new
]
