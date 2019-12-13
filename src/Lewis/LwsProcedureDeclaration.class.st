"
<express_specification>
ENTITY LwsProcedureDeclaration SUBTYPE OF (LwsSubprogramDeclaration);
	name : LwsCompoundName;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProcedureDeclaration,
	#superclass : #LwsSubprogramDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProcedureDeclaration class >> annotation [
	<MSEClass: #LwsProcedureDeclaration super: #LwsSubprogramDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProcedureDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProcedureDeclaration: self
]

{ #category : #'initialize-release' }
LwsProcedureDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsProcedureDeclaration >> name [
	<MSEProperty: #name type: #LwsCompoundName>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsProcedureDeclaration >> name: aCompoundName [
	<generatedByPlatypus>
	name := aCompoundName
]
