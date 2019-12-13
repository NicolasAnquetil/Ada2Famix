"
<express_specification>
ENTITY LwsTaskBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
	name : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskBodyStubDeclaration,
	#superclass : #LwsBodyStubDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTaskBodyStubDeclaration class >> annotation [
	<MSEClass: #LwsTaskBodyStubDeclaration super: #LwsBodyStubDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskBodyStubDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskBodyStubDeclaration: self
]

{ #category : #'initialize-release' }
LwsTaskBodyStubDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsTaskBodyStubDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsTaskBodyStubDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]
