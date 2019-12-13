"
<express_specification>
ENTITY LwsRecordDefinition SUBTYPE OF (LwsEntity);
	elements : List OF LwsComponentAttribute;
	variantPart : OPTIONAL LwsVariantRecordPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRecordDefinition,
	#superclass : #LwsEntity,
	#instVars : [
		'variantPart',
		'elements'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRecordDefinition class >> annotation [
	<MSEClass: #LwsRecordDefinition super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRecordDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRecordDefinition: self
]

{ #category : #'explicit attributes' }
LwsRecordDefinition >> elements [
	<MSEProperty: #elements type: #LwsComponentAttribute>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsRecordDefinition >> elements: aListOfComponentAttribute [
	<generatedByPlatypus>
	elements := aListOfComponentAttribute
]

{ #category : #'initialize-release' }
LwsRecordDefinition >> initialize [
	<generatedByPlatypus>
	super initialize.
	elements := OrderedCollection new.
	variantPart := nil
]

{ #category : #'explicit attributes' }
LwsRecordDefinition >> variantPart [
	<MSEProperty: #variantPart type: #LwsVariantRecordPart>
	<generatedByPlatypus>
	^ variantPart
]

{ #category : #'explicit attributes' }
LwsRecordDefinition >> variantPart: aVariantRecordPartOrNil [
	<generatedByPlatypus>
	variantPart := aVariantRecordPartOrNil
]
