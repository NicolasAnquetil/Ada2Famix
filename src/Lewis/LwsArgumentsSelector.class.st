"
<express_specification>
ENTITY LwsArgumentsSelector SUBTYPE OF (LwsQualifier);
	arguments : LwsAggregate;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsArgumentsSelector,
	#superclass : #LwsQualifier,
	#instVars : [
		'arguments'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsArgumentsSelector class >> annotation [
	<MSEClass: #LwsArgumentsSelector super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsArgumentsSelector >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitArgumentsSelector: self
]

{ #category : #'explicit attributes' }
LwsArgumentsSelector >> arguments [
	<MSEProperty: #arguments type: #LwsAggregate>
	<generatedByPlatypus>
	^ arguments
]

{ #category : #'explicit attributes' }
LwsArgumentsSelector >> arguments: anAggregate [
	<generatedByPlatypus>
	arguments := anAggregate
]

{ #category : #'initialize-release' }
LwsArgumentsSelector >> initialize [
	<generatedByPlatypus>
	super initialize.
	arguments := nil
]
