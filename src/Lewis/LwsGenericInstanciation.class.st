"
<express_specification>
ENTITY LwsGenericInstanciation SUBTYPE OF (LwsBasicDeclaration);
	name : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericInstanciation,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericInstanciation class >> annotation [
	<MSEClass: #LwsGenericInstanciation super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericInstanciation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericInstanciation: self
]

{ #category : #'initialize-release' }
LwsGenericInstanciation >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsGenericInstanciation >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsGenericInstanciation >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
