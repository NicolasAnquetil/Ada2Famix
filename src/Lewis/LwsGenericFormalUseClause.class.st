"
<express_specification>
ENTITY LwsGenericFormalUseClause SUBTYPE OF (LwsGenericFormalElement);
	base : LwsUseClause;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalUseClause,
	#superclass : #LwsGenericFormalElement,
	#instVars : [
		'base'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalUseClause class >> annotation [
	<MSEClass: #LwsGenericFormalUseClause super: #LwsGenericFormalElement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalUseClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalUseClause: self
]

{ #category : #'explicit attributes' }
LwsGenericFormalUseClause >> base [
	<MSEProperty: #base type: #LwsUseClause>
	<generatedByPlatypus>
	^ base
]

{ #category : #'explicit attributes' }
LwsGenericFormalUseClause >> base: anUseClause [
	<generatedByPlatypus>
	base := anUseClause
]

{ #category : #'initialize-release' }
LwsGenericFormalUseClause >> initialize [
	<generatedByPlatypus>
	super initialize.
	base := nil
]
