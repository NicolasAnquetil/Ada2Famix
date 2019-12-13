"
<express_specification>
ENTITY LwsArrayType SUBTYPE OF (LwsCompositeType);
	indexes : List OF LwsArrayTypeIndexSpec;
	componentType : LwsComponentSubtype;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsArrayType,
	#superclass : #LwsCompositeType,
	#instVars : [
		'componentType',
		'indexes'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsArrayType class >> annotation [
	<MSEClass: #LwsArrayType super: #LwsCompositeType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsArrayType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitArrayType: self
]

{ #category : #'explicit attributes' }
LwsArrayType >> componentType [
	<MSEProperty: #componentType type: #LwsComponentSubtype>
	<generatedByPlatypus>
	^ componentType
]

{ #category : #'explicit attributes' }
LwsArrayType >> componentType: aComponentSubtype [
	<generatedByPlatypus>
	componentType := aComponentSubtype
]

{ #category : #'explicit attributes' }
LwsArrayType >> indexes [
	<MSEProperty: #indexes type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ indexes
]

{ #category : #'explicit attributes' }
LwsArrayType >> indexes: aListOfArrayTypeIndexSpec [
	<generatedByPlatypus>
	indexes := aListOfArrayTypeIndexSpec
]

{ #category : #'initialize-release' }
LwsArrayType >> initialize [
	<generatedByPlatypus>
	super initialize.
	indexes := OrderedCollection new.
	componentType := nil
]
