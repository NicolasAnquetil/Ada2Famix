"
<express_specification>
ENTITY LwsPrimaryQualifier SUBTYPE OF (LwsQualifier);
	primary : LwsUnaryExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPrimaryQualifier,
	#superclass : #LwsQualifier,
	#instVars : [
		'primary'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsPrimaryQualifier class >> annotation [
	<MSEClass: #LwsPrimaryQualifier super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPrimaryQualifier >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPrimaryQualifier: self
]

{ #category : #'initialize-release' }
LwsPrimaryQualifier >> initialize [
	<generatedByPlatypus>
	super initialize.
	primary := nil
]

{ #category : #'explicit attributes' }
LwsPrimaryQualifier >> primary [
	<MSEProperty: #primary type: #LwsUnaryExpression>
	<generatedByPlatypus>
	^ primary
]

{ #category : #'explicit attributes' }
LwsPrimaryQualifier >> primary: anUnaryExpression [
	<generatedByPlatypus>
	primary := anUnaryExpression
]
