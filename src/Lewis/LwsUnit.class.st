"
<express_specification>
ENTITY LwsUnit SUBTYPE OF (LwsEntity);
	isPrivate : Boolean := false;
	interfaces : List OF LwsUnitInterface;
	element : LwsUnitElement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUnit,
	#superclass : #LwsEntity,
	#instVars : [
		'interfaces',
		'element',
		'isPrivate'
	],
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsUnit class >> annotation [
	<MSEClass: #LwsUnit super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUnit >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUnit: self
]

{ #category : #'explicit attributes' }
LwsUnit >> element [
	<MSEProperty: #element type: #Object>
	<generatedByPlatypus>
	^ element
]

{ #category : #'explicit attributes' }
LwsUnit >> element: anUnitElement [
	<generatedByPlatypus>
	element := anUnitElement
]

{ #category : #'initialize-release' }
LwsUnit >> initialize [
	<generatedByPlatypus>
	super initialize.
	isPrivate := nil.
	interfaces := OrderedCollection new.
	element := nil
]

{ #category : #'explicit attributes' }
LwsUnit >> interfaces [
	<MSEProperty: #interfaces type: #LwsUnitInterface>
	<multivalued>
	<generatedByPlatypus>
	^ interfaces
]

{ #category : #'explicit attributes' }
LwsUnit >> interfaces: aListOfUnitInterface [
	<generatedByPlatypus>
	interfaces := aListOfUnitInterface
]

{ #category : #'explicit attributes' }
LwsUnit >> isPrivate [
	<MSEProperty: #isPrivate type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isPrivate ifNil: [ isPrivate := self isPrivateDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsUnit >> isPrivate: aBoolean [
	<generatedByPlatypus>
	isPrivate := aBoolean
]

{ #category : #'explicit attributes' }
LwsUnit >> isPrivateDefaultValue [
	<MSEProperty: #isPrivate type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
