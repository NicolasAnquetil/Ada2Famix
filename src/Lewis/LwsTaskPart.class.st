"
<express_specification>
ENTITY LwsTaskPart SUBTYPE OF (LwsEntity);
	entries : list OF LwsEntryDeclaration;
	representations : List OF LwsRepresentation;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskPart,
	#superclass : #LwsEntity,
	#instVars : [
		'entries',
		'representations'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTaskPart class >> annotation [
	<MSEClass: #LwsTaskPart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskPart: self
]

{ #category : #'explicit attributes' }
LwsTaskPart >> entries [
	<MSEProperty: #entries type: #LwsEntryDeclaration>
	<multivalued>
	<generatedByPlatypus>
	^ entries
]

{ #category : #'explicit attributes' }
LwsTaskPart >> entries: aListOfEntryDeclaration [
	<generatedByPlatypus>
	entries := aListOfEntryDeclaration
]

{ #category : #'initialize-release' }
LwsTaskPart >> initialize [
	<generatedByPlatypus>
	super initialize.
	entries := OrderedCollection new.
	representations := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsTaskPart >> representations [
	<MSEProperty: #representations type: #LwsRepresentation>
	<multivalued>
	<generatedByPlatypus>
	^ representations
]

{ #category : #'explicit attributes' }
LwsTaskPart >> representations: aListOfRepresentation [
	<generatedByPlatypus>
	representations := aListOfRepresentation
]
