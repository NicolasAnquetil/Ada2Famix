"
<express_specification>
ENTITY LwsImportClause ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	names : list OF LwsImportClauseName;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsImportClause,
	#superclass : #LwsEntity,
	#instVars : [
		'names'
	],
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsImportClause class >> annotation [
	<MSEClass: #LwsImportClause super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsImportClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitImportClause: self
]

{ #category : #'initialize-release' }
LwsImportClause >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsImportClause >> names [
	<MSEProperty: #names type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsImportClause >> names: aListOfImportClauseName [
	<generatedByPlatypus>
	names := aListOfImportClauseName
]
