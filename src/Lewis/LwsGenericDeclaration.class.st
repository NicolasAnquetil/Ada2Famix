"
<express_specification>
ENTITY LwsGenericDeclaration SUBTYPE OF (LwsBasicDeclaration);
	formalPart : List OF LwsGenericFormalElement;
	declaration : LwsGenericDeclarationTarget;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericDeclaration,
	#superclass : #Object,
	#instVars : [
		'declaration',
		'formalPart'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericDeclaration class >> annotation [
	<MSEClass: #LwsGenericDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericDeclaration: self
]

{ #category : #'explicit attributes' }
LwsGenericDeclaration >> declaration [
	<MSEProperty: #declaration type: #Object>
	<generatedByPlatypus>
	^ declaration
]

{ #category : #'explicit attributes' }
LwsGenericDeclaration >> declaration: aGenericDeclarationTarget [
	<generatedByPlatypus>
	declaration := aGenericDeclarationTarget
]

{ #category : #'explicit attributes' }
LwsGenericDeclaration >> formalPart [
	<MSEProperty: #formalPart type: #LwsGenericFormalElement>
	<multivalued>
	<generatedByPlatypus>
	^ formalPart
]

{ #category : #'explicit attributes' }
LwsGenericDeclaration >> formalPart: aListOfGenericFormalElement [
	<generatedByPlatypus>
	formalPart := aListOfGenericFormalElement
]

{ #category : #'initialize-release' }
LwsGenericDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	formalPart := OrderedCollection new.
	declaration := nil
]
