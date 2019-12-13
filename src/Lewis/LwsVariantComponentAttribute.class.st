"
<express_specification>
ENTITY LwsVariantComponentAttribute SUBTYPE OF (LwsEntity);
	choices : List OF LwsChoice;
	record : LwsRecordDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsVariantComponentAttribute,
	#superclass : #LwsEntity,
	#instVars : [
		'choices',
		'record'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsVariantComponentAttribute class >> annotation [
	<MSEClass: #LwsVariantComponentAttribute super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsVariantComponentAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitVariantComponentAttribute: self
]

{ #category : #'explicit attributes' }
LwsVariantComponentAttribute >> choices [
	<MSEProperty: #choices type: #LwsChoice>
	<multivalued>
	<generatedByPlatypus>
	^ choices
]

{ #category : #'explicit attributes' }
LwsVariantComponentAttribute >> choices: aListOfChoice [
	<generatedByPlatypus>
	choices := aListOfChoice
]

{ #category : #'initialize-release' }
LwsVariantComponentAttribute >> initialize [
	<generatedByPlatypus>
	super initialize.
	choices := OrderedCollection new.
	record := nil
]

{ #category : #'explicit attributes' }
LwsVariantComponentAttribute >> record [
	<MSEProperty: #record type: #LwsRecordDefinition>
	<generatedByPlatypus>
	^ record
]

{ #category : #'explicit attributes' }
LwsVariantComponentAttribute >> record: aRecordDefinition [
	<generatedByPlatypus>
	record := aRecordDefinition
]
