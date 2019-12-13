"
<express_specification>
ENTITY LwsSubtypeIndication SUBTYPE OF (LwsEntity);
	name : LwsQualifiedIdentifier;
	constraint : OPTIONAL LwsConstraint;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubtypeIndication,
	#superclass : #LwsEntity,
	#instVars : [
		'name',
		'constraint'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSubtypeIndication class >> annotation [
	<MSEClass: #LwsSubtypeIndication super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSubtypeIndication >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubtypeIndication: self
]

{ #category : #'explicit attributes' }
LwsSubtypeIndication >> constraint [
	<MSEProperty: #constraint type: #LwsConstraint>
	<generatedByPlatypus>
	^ constraint
]

{ #category : #'explicit attributes' }
LwsSubtypeIndication >> constraint: aConstraintOrNil [
	<generatedByPlatypus>
	constraint := aConstraintOrNil
]

{ #category : #'initialize-release' }
LwsSubtypeIndication >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	constraint := nil
]

{ #category : #'explicit attributes' }
LwsSubtypeIndication >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsSubtypeIndication >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
