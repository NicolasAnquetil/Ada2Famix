"
<express_specification>
ENTITY LwsTaskDefinition SUBTYPE OF (LwsEntity);
	publicPart : LwsTaskPart;
	privatePart : OPTIONAL LwsTaskPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskDefinition,
	#superclass : #LwsEntity,
	#instVars : [
		'publicPart',
		'privatePart'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsTaskDefinition class >> annotation [
	<MSEClass: #LwsTaskDefinition super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskDefinition: self
]

{ #category : #'initialize-release' }
LwsTaskDefinition >> initialize [
	<generatedByPlatypus>
	super initialize.
	publicPart := nil.
	privatePart := nil
]

{ #category : #'explicit attributes' }
LwsTaskDefinition >> privatePart [
	<MSEProperty: #privatePart type: #LwsTaskPart>
	<generatedByPlatypus>
	^ privatePart
]

{ #category : #'explicit attributes' }
LwsTaskDefinition >> privatePart: aTaskPartOrNil [
	<generatedByPlatypus>
	privatePart := aTaskPartOrNil
]

{ #category : #'explicit attributes' }
LwsTaskDefinition >> publicPart [
	<MSEProperty: #publicPart type: #LwsTaskPart>
	<generatedByPlatypus>
	^ publicPart
]

{ #category : #'explicit attributes' }
LwsTaskDefinition >> publicPart: aTaskPart [
	<generatedByPlatypus>
	publicPart := aTaskPart
]
