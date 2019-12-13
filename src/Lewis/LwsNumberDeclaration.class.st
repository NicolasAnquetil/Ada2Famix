"
<express_specification>
ENTITY LwsNumberDeclaration SUBTYPE OF (LwsBasicDeclaration);
	names : List OF String;
	initialization : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNumberDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'names',
		'initialization'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsNumberDeclaration class >> annotation [
	<MSEClass: #LwsNumberDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNumberDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNumberDeclaration: self
]

{ #category : #'explicit attributes' }
LwsNumberDeclaration >> initialization [
	<MSEProperty: #initialization type: #LwsExpression>
	<generatedByPlatypus>
	^ initialization
]

{ #category : #'explicit attributes' }
LwsNumberDeclaration >> initialization: anExpression [
	<generatedByPlatypus>
	initialization := anExpression
]

{ #category : #'initialize-release' }
LwsNumberDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new.
	initialization := nil
]

{ #category : #'explicit attributes' }
LwsNumberDeclaration >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsNumberDeclaration >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
