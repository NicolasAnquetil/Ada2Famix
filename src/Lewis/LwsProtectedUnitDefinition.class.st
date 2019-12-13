"
<express_specification>
ENTITY LwsProtectedUnitDefinition SUBTYPE OF (LwsEntity);
	publicPart : LwsProtectedUnitPublicPart;
	privatePart : OPTIONAL LwsProtectedUnitPrivatePart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitDefinition,
	#superclass : #LwsEntity,
	#instVars : [
		'publicPart',
		'privatePart'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitDefinition class >> annotation [
	<MSEClass: #LwsProtectedUnitDefinition super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitDefinition: self
]

{ #category : #'initialize-release' }
LwsProtectedUnitDefinition >> initialize [
	<generatedByPlatypus>
	super initialize.
	publicPart := nil.
	privatePart := nil
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDefinition >> privatePart [
	<MSEProperty: #privatePart type: #LwsProtectedUnitPrivatePart>
	<generatedByPlatypus>
	^ privatePart
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDefinition >> privatePart: aProtectedUnitPrivatePartOrNil [
	<generatedByPlatypus>
	privatePart := aProtectedUnitPrivatePartOrNil
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDefinition >> publicPart [
	<MSEProperty: #publicPart type: #LwsProtectedUnitPublicPart>
	<generatedByPlatypus>
	^ publicPart
]

{ #category : #'explicit attributes' }
LwsProtectedUnitDefinition >> publicPart: aProtectedUnitPublicPart [
	<generatedByPlatypus>
	publicPart := aProtectedUnitPublicPart
]
