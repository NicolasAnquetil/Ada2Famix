"
<express_specification>
ENTITY LwsAttributeRepresentation SUBTYPE OF (LwsRepresentation);
	name : LwsQualifiedIdentifier;
	useExpression : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAttributeRepresentation,
	#superclass : #LwsRepresentation,
	#instVars : [
		'name',
		'useExpression'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAttributeRepresentation class >> annotation [
	<MSEClass: #LwsAttributeRepresentation super: #LwsRepresentation>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAttributeRepresentation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAttributeRepresentation: self
]

{ #category : #'initialize-release' }
LwsAttributeRepresentation >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	useExpression := nil
]

{ #category : #'explicit attributes' }
LwsAttributeRepresentation >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsAttributeRepresentation >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsAttributeRepresentation >> useExpression [
	<MSEProperty: #useExpression type: #LwsExpression>
	<generatedByPlatypus>
	^ useExpression
]

{ #category : #'explicit attributes' }
LwsAttributeRepresentation >> useExpression: anExpression [
	<generatedByPlatypus>
	useExpression := anExpression
]
