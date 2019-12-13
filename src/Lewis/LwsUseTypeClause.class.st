"
<express_specification>
ENTITY LwsUseTypeClause SUBTYPE OF (LwsUseClause);
DERIVE
	keywords : list OF String := [ 'use', 'type' ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUseTypeClause,
	#superclass : #LwsUseClause,
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsUseTypeClause class >> annotation [
	<MSEClass: #LwsUseTypeClause super: #LwsUseClause>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUseTypeClause >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUseTypeClause: self
]

{ #category : #'initialize-release' }
LwsUseTypeClause >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsUseTypeClause >> keywords [
	<MSEProperty: #keywords type: #String>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ #('use' 'type')
]
