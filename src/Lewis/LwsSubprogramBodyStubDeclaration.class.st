"
<express_specification>
ENTITY LwsSubprogramBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
	declaration : LwsSubprogramDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubprogramBodyStubDeclaration,
	#superclass : #LwsBodyStubDeclaration,
	#instVars : [
		'declaration'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSubprogramBodyStubDeclaration class >> annotation [
	<MSEClass: #LwsSubprogramBodyStubDeclaration super: #LwsBodyStubDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSubprogramBodyStubDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubprogramBodyStubDeclaration: self
]

{ #category : #'explicit attributes' }
LwsSubprogramBodyStubDeclaration >> declaration [
	<MSEProperty: #declaration type: #LwsSubprogramDeclaration>
	<generatedByPlatypus>
	^ declaration
]

{ #category : #'explicit attributes' }
LwsSubprogramBodyStubDeclaration >> declaration: aSubprogramDeclaration [
	<generatedByPlatypus>
	declaration := aSubprogramDeclaration
]

{ #category : #'initialize-release' }
LwsSubprogramBodyStubDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	declaration := nil
]
