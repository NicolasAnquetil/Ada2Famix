"
<express_specification>
ENTITY LwsGenericFormalPackage SUBTYPE OF (LwsGenericFormalElement);
	name : String;
	isNewName : LwsQualifiedIdentifier;
	boxArgument : Boolean := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalPackage,
	#superclass : #LwsGenericFormalElement,
	#instVars : [
		'name',
		'isNewName',
		'boxArgument'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalPackage class >> annotation [
	<MSEClass: #LwsGenericFormalPackage super: #LwsGenericFormalElement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalPackage >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalPackage: self
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> boxArgument [
	<MSEProperty: #boxArgument type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ boxArgument ifNil: [ boxArgument := self boxArgumentDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> boxArgument: aBoolean [
	<generatedByPlatypus>
	boxArgument := aBoolean
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> boxArgumentDefaultValue [
	<MSEProperty: #boxArgument type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'initialize-release' }
LwsGenericFormalPackage >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	isNewName := nil.
	boxArgument := nil
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> isNewName [
	<MSEProperty: #isNewName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ isNewName
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> isNewName: aQualifiedIdentifier [
	<generatedByPlatypus>
	isNewName := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsGenericFormalPackage >> name: aString [
	<generatedByPlatypus>
	name := aString
]
