"
<express_specification>
ENTITY LwsUseClause SUBTYPE OF (LwsImportClause);
	SELF\LwsImportClause.names : list OF LwsQualifiedIdentifier;
DERIVE
	keywords : list OF String := [ 'use' ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUseClause,
	#superclass : #LwsImportClause,
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsUseClause class >> annotation [
	<MSEClass: #LwsUseClause super: #LwsImportClause>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUseClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUseClause: self
]

{ #category : #'initialize-release' }
LwsUseClause >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsUseClause >> keywords [
	<MSEProperty: #keywords type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ #('use')
]
