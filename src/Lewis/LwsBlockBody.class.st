"
<express_specification>
ENTITY LwsBlockBody SUBTYPE OF (LwsBody);
	statements : List OF LwsStatement;
	handlers : List OF LwsExceptionHandler;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBlockBody,
	#superclass : #LwsBody,
	#instVars : [
		'statements',
		'handlers'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsBlockBody class >> annotation [
	<MSEClass: #LwsBlockBody super: #LwsBody>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBlockBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBlockBody: self
]

{ #category : #'explicit attributes' }
LwsBlockBody >> handlers [
	<MSEProperty: #handlers type: #LwsExceptionHandler>
	<multivalued>
	<generatedByPlatypus>
	^ handlers
]

{ #category : #'explicit attributes' }
LwsBlockBody >> handlers: aListOfExceptionHandler [
	<generatedByPlatypus>
	handlers := aListOfExceptionHandler
]

{ #category : #'initialize-release' }
LwsBlockBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	statements := OrderedCollection new.
	handlers := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsBlockBody >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsBlockBody >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
