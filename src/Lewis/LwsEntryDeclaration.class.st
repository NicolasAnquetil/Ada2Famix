"
<express_specification>
ENTITY LwsEntryDeclaration SUBTYPE OF (LwsBasicDeclaration);
	name : String;
	range : OPTIONAL LwsRange;
	parameters : List OF LwsFormalParameter;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'range',
		'name',
		'parameters'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsEntryDeclaration class >> annotation [
	<MSEClass: #LwsEntryDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryDeclaration: self
]

{ #category : #'initialize-release' }
LwsEntryDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	range := nil.
	parameters := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> parameters [
	<MSEProperty: #parameters type: #LwsFormalParameter>
	<multivalued>
	<generatedByPlatypus>
	^ parameters
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> parameters: aListOfFormalParameter [
	<generatedByPlatypus>
	parameters := aListOfFormalParameter
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsEntryDeclaration >> range: aRangeOrNil [
	<generatedByPlatypus>
	range := aRangeOrNil
]
