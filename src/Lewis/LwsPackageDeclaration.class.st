"
<express_specification>
ENTITY LwsPackageDeclaration SUBTYPE OF (LwsBasicDeclaration);
	name : LwsCompoundName;
	definition : LwsPackageDefinition;
DERIVE
	asString : String ::= self name asString;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackageDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'definition',
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPackageDeclaration class >> annotation [
	<MSEClass: #LwsPackageDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackageDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackageDeclaration: self
]

{ #category : #'derived attributes' }
LwsPackageDeclaration >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self name asString
]

{ #category : #'explicit attributes' }
LwsPackageDeclaration >> definition [
	<MSEProperty: #definition type: #LwsPackageDefinition>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsPackageDeclaration >> definition: aPackageDefinition [
	<generatedByPlatypus>
	definition := aPackageDefinition
]

{ #category : #'initialize-release' }
LwsPackageDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	definition := nil
]

{ #category : #'explicit attributes' }
LwsPackageDeclaration >> name [
	<MSEProperty: #name type: #LwsCompoundName>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsPackageDeclaration >> name: aCompoundName [
	<generatedByPlatypus>
	name := aCompoundName
]
