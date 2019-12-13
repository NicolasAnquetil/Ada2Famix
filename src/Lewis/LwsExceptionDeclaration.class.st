"
<express_specification>
ENTITY LwsExceptionDeclaration SUBTYPE OF (LwsBasicDeclaration);
	names : List OF String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExceptionDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'names'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsExceptionDeclaration class >> annotation [
	<MSEClass: #LwsExceptionDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExceptionDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExceptionDeclaration: self
]

{ #category : #'initialize-release' }
LwsExceptionDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsExceptionDeclaration >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsExceptionDeclaration >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
