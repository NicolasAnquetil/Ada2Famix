"
<express_specification>
ENTITY LwsWithClause SUBTYPE OF (LwsImportClause);
	SELF\LwsImportClause.names : list OF LwsCompoundName;
DERIVE
	keywords : list OF String := [ 'with' ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsWithClause,
	#superclass : #LwsImportClause,
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsWithClause class >> annotation [
	<MSEClass: #LwsWithClause super: #LwsImportClause>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsWithClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitWithClause: self
]

{ #category : #'initialize-release' }
LwsWithClause >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsWithClause >> keywords [
	<MSEProperty: #keywords type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ #('with')
]
