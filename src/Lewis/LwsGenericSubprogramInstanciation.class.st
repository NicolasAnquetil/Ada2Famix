"
<express_specification>
ENTITY LwsGenericSubprogramInstanciation SUBTYPE OF (LwsGenericInstanciation);
	subprogramDeclaration : LwsSubprogramDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericSubprogramInstanciation,
	#superclass : #LwsGenericInstanciation,
	#instVars : [
		'subprogramDeclaration'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericSubprogramInstanciation class >> annotation [
	<MSEClass: #LwsGenericSubprogramInstanciation super: #LwsGenericInstanciation>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericSubprogramInstanciation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericSubprogramInstanciation: self
]

{ #category : #'initialize-release' }
LwsGenericSubprogramInstanciation >> initialize [
	<generatedByPlatypus>
	super initialize.
	subprogramDeclaration := nil
]

{ #category : #'explicit attributes' }
LwsGenericSubprogramInstanciation >> subprogramDeclaration [
	<MSEProperty: #subprogramDeclaration type: #LwsSubprogramDeclaration>
	<generatedByPlatypus>
	^ subprogramDeclaration
]

{ #category : #'explicit attributes' }
LwsGenericSubprogramInstanciation >> subprogramDeclaration: aSubprogramDeclaration [
	<generatedByPlatypus>
	subprogramDeclaration := aSubprogramDeclaration
]
