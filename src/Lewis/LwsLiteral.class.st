"
<express_specification>
ENTITY LwsLiteral ABSTRACT SUPERTYPE SUBTYPE OF (LwsUnaryExpression);
	parsedString : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsLiteral,
	#superclass : #LwsUnaryExpression,
	#instVars : [
		'parsedString'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsLiteral class >> annotation [
	<MSEClass: #LwsLiteral super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsLiteral >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitLiteral: self
]

{ #category : #'initialize-release' }
LwsLiteral >> initialize [
	<generatedByPlatypus>
	super initialize.
	parsedString := nil
]

{ #category : #'explicit attributes' }
LwsLiteral >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<generatedByPlatypus>
	^ parsedString
]

{ #category : #'explicit attributes' }
LwsLiteral >> parsedString: aString [
	<generatedByPlatypus>
	parsedString := aString
]
