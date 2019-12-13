"
<express_specification>
ENTITY LwsAcceptStatement SUBTYPE OF (LwsCompoundStatement);
	entryName : LwsQualifiedIdentifier;
	parameters : List OF LwsFormalParameter;
	statements : List OF LwsStatement;
	handlers : List OF LwsExceptionHandler;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAcceptStatement,
	#superclass : #LwsCompoundStatement,
	#instVars : [
		'handlers',
		'entryName',
		'parameters',
		'statements'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsAcceptStatement class >> annotation [
	<MSEClass: #LwsAcceptStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAcceptStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAcceptStatement: self
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> entryName [
	<MSEProperty: #entryName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ entryName
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> entryName: aQualifiedIdentifier [
	<generatedByPlatypus>
	entryName := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> handlers [
	<MSEProperty: #handlers type: #LwsExceptionHandler>
	<multivalued>
	<generatedByPlatypus>
	^ handlers
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> handlers: aListOfExceptionHandler [
	<generatedByPlatypus>
	handlers := aListOfExceptionHandler
]

{ #category : #'initialize-release' }
LwsAcceptStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	entryName := nil.
	parameters := OrderedCollection new.
	statements := OrderedCollection new.
	handlers := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> parameters [
	<MSEProperty: #parameters type: #LwsFormalParameter>
	<multivalued>
	<generatedByPlatypus>
	^ parameters
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> parameters: aListOfFormalParameter [
	<generatedByPlatypus>
	parameters := aListOfFormalParameter
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> statements [
	<MSEProperty: #statements type: #LwsStatement>
	<multivalued>
	<generatedByPlatypus>
	^ statements
]

{ #category : #'explicit attributes' }
LwsAcceptStatement >> statements: aListOfStatement [
	<generatedByPlatypus>
	statements := aListOfStatement
]
