"
<express_specification>
ENTITY LwsSimpleIdentifier SUBTYPE OF (LwsUnaryExpression);
	name : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSimpleIdentifier,
	#superclass : #LwsUnaryExpression,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsSimpleIdentifier class >> annotation [
	<MSEClass: #LwsSimpleIdentifier super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSimpleIdentifier >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSimpleIdentifier: self
]

{ #category : #'initialize-release' }
LwsSimpleIdentifier >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsSimpleIdentifier >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsSimpleIdentifier >> name: aString [
	<generatedByPlatypus>
	name := aString
]
