"
<express_specification>
ENTITY LwsPackageDefinition SUBTYPE OF (LwsEntity);
	publicPart : LwsPackagePart;
	privatePart : OPTIONAL LwsPackagePart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackageDefinition,
	#superclass : #LwsEntity,
	#instVars : [
		'publicPart',
		'privatePart'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPackageDefinition class >> annotation [
	<MSEClass: #LwsPackageDefinition super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackageDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackageDefinition: self
]

{ #category : #'initialize-release' }
LwsPackageDefinition >> initialize [
	<generatedByPlatypus>
	super initialize.
	publicPart := nil.
	privatePart := nil
]

{ #category : #'explicit attributes' }
LwsPackageDefinition >> privatePart [
	<MSEProperty: #privatePart type: #LwsPackagePart>
	<generatedByPlatypus>
	^ privatePart
]

{ #category : #'explicit attributes' }
LwsPackageDefinition >> privatePart: aPackagePartOrNil [
	<generatedByPlatypus>
	privatePart := aPackagePartOrNil
]

{ #category : #'explicit attributes' }
LwsPackageDefinition >> publicPart [
	<MSEProperty: #publicPart type: #LwsPackagePart>
	<generatedByPlatypus>
	^ publicPart
]

{ #category : #'explicit attributes' }
LwsPackageDefinition >> publicPart: aPackagePart [
	<generatedByPlatypus>
	publicPart := aPackagePart
]
