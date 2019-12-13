"
<express_specification>
ENTITY LwsAccessType ABSTRACT SUPERTYPE SUBTYPE OF (LwsElementaryType);
	accessMode : OPTIONAL LwsAccessMode;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAccessType,
	#superclass : #LwsElementaryType,
	#instVars : [
		'accessMode'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAccessType class >> annotation [
	<MSEClass: #LwsAccessType super: #LwsElementaryType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsAccessType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAccessType: self
]

{ #category : #'explicit attributes' }
LwsAccessType >> accessMode [
	<MSEProperty: #accessMode type: #Symbol>
	<generatedByPlatypus>
	^ accessMode
]

{ #category : #'explicit attributes' }
LwsAccessType >> accessMode: anAccessModeOrNil [
	<generatedByPlatypus>
	accessMode := anAccessModeOrNil
]

{ #category : #'initialize-release' }
LwsAccessType >> initialize [
	<generatedByPlatypus>
	super initialize.
	accessMode := nil
]
