"
<express_specification>
ENTITY LwsProtectedUnitDeclaration SUBTYPE OF (LwsBasicDeclaration);
	name : String;
	definition : LwsProtectedUnitDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'definition',
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitDeclaration class >> annotation [
	<MSEClass: #LwsProtectedUnitDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitDeclaration: self
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDeclaration >> definition [
	<MSEProperty: #definition type: #LwsProtectedUnitDefinition>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDeclaration >> definition: aProtectedUnitDefinition [
	<generatedByPlatypus>
	definition := aProtectedUnitDefinition
]

{ #category : #'initialize-release' }
LwsProtectedUnitDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	definition := nil
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]
