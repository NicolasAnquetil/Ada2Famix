"
<express_specification>
ENTITY LwsGenericFormalType SUBTYPE OF (LwsGenericFormalElement);
	base : LwsFullTypeDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalType,
	#superclass : #LwsGenericFormalElement,
	#instVars : [
		'base'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalType class >> annotation [
	<MSEClass: #LwsGenericFormalType super: #LwsGenericFormalElement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalType: self
]

{ #category : #'explicit attributes' }
LwsGenericFormalType >> base [
	<MSEProperty: #base type: #LwsFullTypeDeclaration>
	<generatedByPlatypus>
	^ base
]

{ #category : #'explicit attributes' }
LwsGenericFormalType >> base: aFullTypeDeclaration [
	<generatedByPlatypus>
	base := aFullTypeDeclaration
]

{ #category : #'initialize-release' }
LwsGenericFormalType >> initialize [
	<generatedByPlatypus>
	super initialize.
	base := nil
]
