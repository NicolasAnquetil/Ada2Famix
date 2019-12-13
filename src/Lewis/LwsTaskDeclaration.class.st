"
<express_specification>
ENTITY LwsTaskDeclaration SUBTYPE OF (LwsBasicDeclaration);
	name : String;
	definition : OPTIONAL LwsTaskDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'definition',
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTaskDeclaration class >> annotation [
	<MSEClass: #LwsTaskDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskDeclaration: self
]

{ #category : #'explicit attributes' }
LwsTaskDeclaration >> definition [
	<MSEProperty: #definition type: #LwsTaskDefinition>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsTaskDeclaration >> definition: aTaskDefinitionOrNil [
	<generatedByPlatypus>
	definition := aTaskDefinitionOrNil
]

{ #category : #'initialize-release' }
LwsTaskDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	definition := nil
]

{ #category : #'explicit attributes' }
LwsTaskDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsTaskDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]
