"
<express_specification>
ENTITY LwsGenericFormalParameter SUBTYPE OF (LwsGenericFormalElement);
	base : LwsFormalParameter;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalParameter,
	#superclass : #LwsGenericFormalElement,
	#instVars : [
		'base'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalParameter class >> annotation [
	<MSEClass: #LwsGenericFormalParameter super: #LwsGenericFormalElement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalParameter >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalParameter: self
]

{ #category : #'explicit attributes' }
LwsGenericFormalParameter >> base [
	<MSEProperty: #base type: #LwsFormalParameter>
	<generatedByPlatypus>
	^ base
]

{ #category : #'explicit attributes' }
LwsGenericFormalParameter >> base: aFormalParameter [
	<generatedByPlatypus>
	base := aFormalParameter
]

{ #category : #'initialize-release' }
LwsGenericFormalParameter >> initialize [
	<generatedByPlatypus>
	super initialize.
	base := nil
]
