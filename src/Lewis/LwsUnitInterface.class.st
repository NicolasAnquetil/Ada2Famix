"
<express_specification>
ENTITY LwsUnitInterface SUBTYPE OF (LwsEntity);
	withClause : LwsWithClause;
	useClauses : List OF LwsUseClause;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUnitInterface,
	#superclass : #LwsEntity,
	#instVars : [
		'useClauses',
		'withClause'
	],
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsUnitInterface class >> annotation [
	<MSEClass: #LwsUnitInterface super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUnitInterface >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUnitInterface: self
]

{ #category : #'initialize-release' }
LwsUnitInterface >> initialize [
	<generatedByPlatypus>
	super initialize.
	withClause := nil.
	useClauses := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsUnitInterface >> useClauses [
	<MSEProperty: #useClauses type: #LwsUseClause>
	<multivalued>
	<generatedByPlatypus>
	^ useClauses
]

{ #category : #'explicit attributes' }
LwsUnitInterface >> useClauses: aListOfUseClause [
	<generatedByPlatypus>
	useClauses := aListOfUseClause
]

{ #category : #'explicit attributes' }
LwsUnitInterface >> withClause [
	<MSEProperty: #withClause type: #LwsWithClause>
	<generatedByPlatypus>
	^ withClause
]

{ #category : #'explicit attributes' }
LwsUnitInterface >> withClause: aWithClause [
	<generatedByPlatypus>
	withClause := aWithClause
]
