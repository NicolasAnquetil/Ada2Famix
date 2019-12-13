"
<express_specification>
ENTITY LwsComponentAssociation SUBTYPE OF (LwsEntity);
	expression : LwsExpression;
	choices : list OF LwsChoice;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsComponentAssociation,
	#superclass : #LwsEntity,
	#instVars : [
		'choices',
		'expression'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsComponentAssociation class >> annotation [
	<MSEClass: #LwsComponentAssociation super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsComponentAssociation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitComponentAssociation: self
]

{ #category : #'explicit attributes' }
LwsComponentAssociation >> choices [
	<MSEProperty: #choices type: #LwsChoice>
	<multivalued>
	<generatedByPlatypus>
	^ choices
]

{ #category : #'explicit attributes' }
LwsComponentAssociation >> choices: aListOfChoice [
	<generatedByPlatypus>
	choices := aListOfChoice
]

{ #category : #'explicit attributes' }
LwsComponentAssociation >> expression [
	<MSEProperty: #expression type: #LwsExpression>
	<generatedByPlatypus>
	^ expression
]

{ #category : #'explicit attributes' }
LwsComponentAssociation >> expression: anExpression [
	<generatedByPlatypus>
	expression := anExpression
]

{ #category : #'initialize-release' }
LwsComponentAssociation >> initialize [
	<generatedByPlatypus>
	super initialize.
	expression := nil.
	choices := OrderedCollection new
]
