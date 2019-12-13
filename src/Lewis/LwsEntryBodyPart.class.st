"
<express_specification>
ENTITY LwsEntryBodyPart SUBTYPE OF (LwsEntity);
	locals : List OF LwsDeclarationOrBody;
	blockBody : LwsBlockBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryBodyPart,
	#superclass : #LwsEntity,
	#instVars : [
		'locals',
		'blockBody'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsEntryBodyPart class >> annotation [
	<MSEClass: #LwsEntryBodyPart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryBodyPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryBodyPart: self
]

{ #category : #'explicit attributes' }
LwsEntryBodyPart >> blockBody [
	<MSEProperty: #blockBody type: #LwsBlockBody>
	<generatedByPlatypus>
	^ blockBody
]

{ #category : #'explicit attributes' }
LwsEntryBodyPart >> blockBody: aBlockBody [
	<generatedByPlatypus>
	blockBody := aBlockBody
]

{ #category : #'initialize-release' }
LwsEntryBodyPart >> initialize [
	<generatedByPlatypus>
	super initialize.
	locals := OrderedCollection new.
	blockBody := nil
]

{ #category : #'explicit attributes' }
LwsEntryBodyPart >> locals [
	<MSEProperty: #locals type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ locals
]

{ #category : #'explicit attributes' }
LwsEntryBodyPart >> locals: aListOfDeclarationOrBody [
	<generatedByPlatypus>
	locals := aListOfDeclarationOrBody
]
