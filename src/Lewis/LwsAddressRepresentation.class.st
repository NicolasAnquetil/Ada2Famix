"
<express_specification>
ENTITY LwsAddressRepresentation SUBTYPE OF (LwsRepresentation);
	name : LwsQualifiedIdentifier;
	useAt : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAddressRepresentation,
	#superclass : #LwsRepresentation,
	#instVars : [
		'useAt',
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAddressRepresentation class >> annotation [
	<MSEClass: #LwsAddressRepresentation super: #LwsRepresentation>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAddressRepresentation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAddressRepresentation: self
]

{ #category : #'initialize-release' }
LwsAddressRepresentation >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	useAt := nil
]

{ #category : #'explicit attributes' }
LwsAddressRepresentation >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsAddressRepresentation >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsAddressRepresentation >> useAt [
	<MSEProperty: #useAt type: #LwsExpression>
	<generatedByPlatypus>
	^ useAt
]

{ #category : #'explicit attributes' }
LwsAddressRepresentation >> useAt: anExpression [
	<generatedByPlatypus>
	useAt := anExpression
]
