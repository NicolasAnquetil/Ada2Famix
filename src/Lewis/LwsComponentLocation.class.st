"
<express_specification>
ENTITY LwsComponentLocation SUBTYPE OF (LwsEntity);
	name : LwsQualifiedIdentifier;
	at : LwsExpression;
	range : LwsRange;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsComponentLocation,
	#superclass : #LwsEntity,
	#instVars : [
		'range',
		'name',
		'at'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsComponentLocation class >> annotation [
	<MSEClass: #LwsComponentLocation super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsComponentLocation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitComponentLocation: self
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> at [
	<MSEProperty: #at type: #LwsExpression>
	<generatedByPlatypus>
	^ at
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> at: anExpression [
	<generatedByPlatypus>
	at := anExpression
]

{ #category : #'initialize-release' }
LwsComponentLocation >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	at := nil.
	range := nil
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsComponentLocation >> range: aRange [
	<generatedByPlatypus>
	range := aRange
]
