"
<express_specification>
ENTITY LwsCaseAlternative SUBTYPE OF (LwsEntity);
	choices : list OF LwsChoice;
	statements : List OF LwsStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCaseAlternative,
	#superclass : #LwsEntity,
	#instVars : [
		'choices',
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsCaseAlternative class >> annotation [
	<MSEClass: #LwsCaseAlternative super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCaseAlternative >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCaseAlternative: self
]

{ #category : #'explicit attributes' }
LwsCaseAlternative >> choices [
	<MSEProperty: #choices type: #LwsChoice>
	<multivalued>
	<generatedByPlatypus>
	^ choices
]

{ #category : #'explicit attributes' }
LwsCaseAlternative >> choices: aListOfChoice [
	<generatedByPlatypus>
	choices := aListOfChoice
]

{ #category : #'initialize-release' }
LwsCaseAlternative >> initialize [
	<generatedByPlatypus>
	super initialize.
	choices := OrderedCollection new.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsCaseAlternative >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsCaseAlternative >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
