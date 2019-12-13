"
<express_specification>
ENTITY LwsAggregate SUBTYPE OF (LwsAbstractAggregate);
	elements : list OF LwsAggregateElement ::= OrderedCollection new;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAggregate,
	#superclass : #LwsAbstractAggregate,
	#instVars : [
		'elements'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAggregate class >> annotation [
	<MSEClass: #LwsAggregate super: #LwsAbstractAggregate>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAggregate >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAggregate: self
]

{ #category : #'explicit attributes' }
LwsAggregate >> elements [
	<MSEProperty: #elements type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ elements ifNil: [ elements := self elementsDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsAggregate >> elements: aListOfAggregateElement [
	<generatedByPlatypus>
	elements := aListOfAggregateElement
]

{ #category : #'explicit attributes' }
LwsAggregate >> elementsDefaultValue [
	<MSEProperty: #elements type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]

{ #category : #'initialize-release' }
LwsAggregate >> initialize [
	<generatedByPlatypus>
	super initialize
]
