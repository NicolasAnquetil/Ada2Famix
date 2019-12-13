"
<express_specification>
ENTITY LwsComponentAttribute SUBTYPE OF (LwsEntity);
	names : List OF String;
	domain : LwsComponentSubtype;
	initialization : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsComponentAttribute,
	#superclass : #LwsEntity,
	#instVars : [
		'domain',
		'initialization',
		'names'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsComponentAttribute class >> annotation [
	<MSEClass: #LwsComponentAttribute super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsComponentAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitComponentAttribute: self
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> domain [
	<MSEProperty: #domain type: #LwsComponentSubtype>
	<generatedByPlatypus>
	^ domain
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> domain: aComponentSubtype [
	<generatedByPlatypus>
	domain := aComponentSubtype
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> initialization [
	<MSEProperty: #initialization type: #LwsExpression>
	<generatedByPlatypus>
	^ initialization
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> initialization: anExpressionOrNil [
	<generatedByPlatypus>
	initialization := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsComponentAttribute >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new.
	domain := nil.
	initialization := nil
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsComponentAttribute >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
