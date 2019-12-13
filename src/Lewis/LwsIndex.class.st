"
<express_specification>
ENTITY LwsIndex SUBTYPE OF (LwsEntity);
	typeMark : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIndex,
	#superclass : #LwsEntity,
	#instVars : [
		'typeMark'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsIndex class >> annotation [
	<MSEClass: #LwsIndex super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIndex >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIndex: self
]

{ #category : #'initialize-release' }
LwsIndex >> initialize [
	<generatedByPlatypus>
	super initialize.
	typeMark := nil
]

{ #category : #'explicit attributes' }
LwsIndex >> typeMark [
	<MSEProperty: #typeMark type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ typeMark
]

{ #category : #'explicit attributes' }
LwsIndex >> typeMark: aQualifiedIdentifier [
	<generatedByPlatypus>
	typeMark := aQualifiedIdentifier
]
