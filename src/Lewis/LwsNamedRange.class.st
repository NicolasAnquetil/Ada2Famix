"
<express_specification>
ENTITY LwsNamedRange SUBTYPE OF (LwsRange);
	name : LwsQualifiedIdentifier;
	argument : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNamedRange,
	#superclass : #LwsRange,
	#instVars : [
		'argument',
		'name'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNamedRange class >> annotation [
	<MSEClass: #LwsNamedRange super: #LwsRange>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNamedRange >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNamedRange: self
]

{ #category : #'explicit attributes' }
LwsNamedRange >> argument [
	<MSEProperty: #argument type: #LwsExpression>
	<generatedByPlatypus>
	^ argument
]

{ #category : #'explicit attributes' }
LwsNamedRange >> argument: anExpressionOrNil [
	<generatedByPlatypus>
	argument := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsNamedRange >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	argument := nil
]

{ #category : #'explicit attributes' }
LwsNamedRange >> name [
	<MSEProperty: #name type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsNamedRange >> name: aQualifiedIdentifier [
	<generatedByPlatypus>
	name := aQualifiedIdentifier
]
