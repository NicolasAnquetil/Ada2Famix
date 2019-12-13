"
<express_specification>
ENTITY LwsExceptionHandler SUBTYPE OF (LwsEntity);
	name : OPTIONAL String;
	choices : List OF LwsExceptionChoice;
	statements : List OF LwsStatement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExceptionHandler,
	#superclass : #LwsEntity,
	#instVars : [
		'statements',
		'name',
		'choices'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsExceptionHandler class >> annotation [
	<MSEClass: #LwsExceptionHandler super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExceptionHandler >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExceptionHandler: self
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> choices [
	<MSEProperty: #choices type: #LwsExceptionChoice>
	<multivalued>
	<generatedByPlatypus>
	^ choices
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> choices: aListOfExceptionChoice [
	<generatedByPlatypus>
	choices := aListOfExceptionChoice
]

{ #category : #'initialize-release' }
LwsExceptionHandler >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	choices := OrderedCollection new.
	statements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> name: aStringOrNil [
	<generatedByPlatypus>
	name := aStringOrNil
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsExceptionHandler >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
