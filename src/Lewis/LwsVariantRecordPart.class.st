"
<express_specification>
ENTITY LwsVariantRecordPart SUBTYPE OF (LwsEntity);
	caseIdentifier : LwsSimpleIdentifier;
	elements : List OF LwsVariantComponentAttribute;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsVariantRecordPart,
	#superclass : #LwsEntity,
	#instVars : [
		'caseIdentifier',
		'elements'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsVariantRecordPart class >> annotation [
	<MSEClass: #LwsVariantRecordPart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsVariantRecordPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitVariantRecordPart: self
]

{ #category : #'explicit attributes' }
LwsVariantRecordPart >> caseIdentifier [
	<MSEProperty: #caseIdentifier type: #LwsSimpleIdentifier>
	<generatedByPlatypus>
	^ caseIdentifier
]

{ #category : #'explicit attributes' }
LwsVariantRecordPart >> caseIdentifier: aSimpleIdentifier [
	<generatedByPlatypus>
	caseIdentifier := aSimpleIdentifier
]

{ #category : #'explicit attributes' }
LwsVariantRecordPart >> elements [
	<MSEProperty: #elements type: #LwsVariantComponentAttribute>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsVariantRecordPart >> elements: aListOfVariantComponentAttribute [
	<generatedByPlatypus>
	elements := aListOfVariantComponentAttribute
]

{ #category : #'initialize-release' }
LwsVariantRecordPart >> initialize [
	<generatedByPlatypus>
	super initialize.
	caseIdentifier := nil.
	elements := OrderedCollection new
]
