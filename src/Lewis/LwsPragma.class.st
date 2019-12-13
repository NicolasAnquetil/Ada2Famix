"
<express_specification>
ENTITY LwsPragma SUBTYPE OF (LwsEntity);
	name : String;
	arguments : List OF LwsPragmaArgument;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPragma,
	#superclass : #LwsEntity,
	#instVars : [
		'arguments',
		'name'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsPragma class >> annotation [
	<MSEClass: #LwsPragma super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPragma >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPragma: self
]

{ #category : #'explicit attributes' }
LwsPragma >> arguments [
	<MSEProperty: #arguments type: #LwsPragmaArgument>
	<multivalued>
	<generatedByPlatypus>
	^ arguments
]

{ #category : #'explicit attributes' }
LwsPragma >> arguments: aListOfPragmaArgument [
	<generatedByPlatypus>
	arguments := aListOfPragmaArgument
]

{ #category : #'initialize-release' }
LwsPragma >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	arguments := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsPragma >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsPragma >> name: aString [
	<generatedByPlatypus>
	name := aString
]
