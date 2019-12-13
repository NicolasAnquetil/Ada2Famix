"
<express_specification>
ENTITY LwsCaseStatement SUBTYPE OF (LwsCompoundStatement);
	selector : LwsExpression;
	alternatives : List OF LwsCaseAlternative;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCaseStatement,
	#superclass : #LwsCompoundStatement,
	#instVars : [
		'selector',
		'alternatives'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsCaseStatement class >> annotation [
	<MSEClass: #LwsCaseStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCaseStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCaseStatement: self
]

{ #category : #'explicit attributes' }
LwsCaseStatement >> alternatives [
	<MSEProperty: #alternatives type: #LwsCaseAlternative>
	<multivalued>
	<generatedByPlatypus>
	^ alternatives
]

{ #category : #'explicit attributes' }
LwsCaseStatement >> alternatives: aListOfCaseAlternative [
	<generatedByPlatypus>
	alternatives := aListOfCaseAlternative
]

{ #category : #'initialize-release' }
LwsCaseStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	selector := nil.
	alternatives := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsCaseStatement >> selector [
	<MSEProperty: #selector type: #LwsExpression>
	<generatedByPlatypus>
	^ selector
]

{ #category : #'explicit attributes' }
LwsCaseStatement >> selector: anExpression [
	<generatedByPlatypus>
	selector := anExpression
]
