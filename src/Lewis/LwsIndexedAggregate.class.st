"
<express_specification>
ENTITY LwsIndexedAggregate SUBTYPE OF (LwsAbstractAggregate);
	base : OPTIONAL LwsExpression;
	indexes : list OF LwsAggregateElement ::= OrderedCollection new;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsIndexedAggregate,
	#superclass : #LwsAbstractAggregate,
	#instVars : [
		'base',
		'indexes'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsIndexedAggregate class >> annotation [
	<MSEClass: #LwsIndexedAggregate super: #LwsAbstractAggregate>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsIndexedAggregate >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitIndexedAggregate: self
]

{ #category : #'explicit attributes' }
LwsIndexedAggregate >> base [
	<MSEProperty: #base type: #LwsExpression>
	<generatedByPlatypus>
	^ base
]

{ #category : #'explicit attributes' }
LwsIndexedAggregate >> base: anExpressionOrNil [
	<generatedByPlatypus>
	base := anExpressionOrNil
]

{ #category : #'explicit attributes' }
LwsIndexedAggregate >> indexes [
	<MSEProperty: #indexes type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ indexes ifNil: [ indexes := self indexesDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsIndexedAggregate >> indexes: aListOfAggregateElement [
	<generatedByPlatypus>
	indexes := aListOfAggregateElement
]

{ #category : #'explicit attributes' }
LwsIndexedAggregate >> indexesDefaultValue [
	<MSEProperty: #indexes type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]

{ #category : #'initialize-release' }
LwsIndexedAggregate >> initialize [
	<generatedByPlatypus>
	super initialize.
	base := nil
]
