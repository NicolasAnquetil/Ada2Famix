"
<express_specification>
ENTITY LwsRecordTypeRepresentation SUBTYPE OF (LwsRepresentation);
	name : LwsQualifiedIdentifier;
	align : OPTIONAL LwsExpression;
	locations : List OF LwsComponentLocation;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRecordTypeRepresentation,
	#superclass : #LwsRepresentation,
	#instVars : [
		'locations',
		'name',
		'align'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRecordTypeRepresentation class >> annotation [
	<MSEClass: #LwsRecordTypeRepresentation super: #LwsRepresentation>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRecordTypeRepresentation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRecordTypeRepresentation: self
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> align [
	<MSEProperty: #align type: #LwsExpression>
	<generatedByPlatypus>
	^ align
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> align: anExpressionOrNil [
	<generatedByPlatypus>
	align := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsRecordTypeRepresentation >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	align := nil.
	locations := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> locations [
	<MSEProperty: #locations type: #LwsComponentLocation>
	<multivalued>
	<generatedByPlatypus>
	^ locations
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> locations: aListOfComponentLocation [
	<generatedByPlatypus>
	locations := aListOfComponentLocation
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsRecordTypeRepresentation >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
