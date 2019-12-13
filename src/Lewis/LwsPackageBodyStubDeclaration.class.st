"
<express_specification>
ENTITY LwsPackageBodyStubDeclaration SUBTYPE OF (LwsBodyStubDeclaration);
	name : LwsCompoundName;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackageBodyStubDeclaration,
	#superclass : #LwsBodyStubDeclaration,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPackageBodyStubDeclaration class >> annotation [
	<MSEClass: #LwsPackageBodyStubDeclaration super: #LwsBodyStubDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackageBodyStubDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackageBodyStubDeclaration: self
]

{ #category : #'initialize-release' }
LwsPackageBodyStubDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsPackageBodyStubDeclaration >> name [
	<MSEProperty: #name type: #LwsCompoundName>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsPackageBodyStubDeclaration >> name: aCompoundName [
	<generatedByPlatypus>
	name := aCompoundName
]
