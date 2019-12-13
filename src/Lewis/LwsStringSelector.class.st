"
<express_specification>
ENTITY LwsStringSelector SUBTYPE OF (LwsQualifier);
	parsedString : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStringSelector,
	#superclass : #LwsQualifier,
	#instVars : [
		'parsedString'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsStringSelector class >> annotation [
	<MSEClass: #LwsStringSelector super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsStringSelector >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStringSelector: self
]

{ #category : #'initialize-release' }
LwsStringSelector >> initialize [
	<generatedByPlatypus>
	super initialize.
	parsedString := nil
]

{ #category : #'explicit attributes' }
LwsStringSelector >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<generatedByPlatypus>
	^ parsedString
]

{ #category : #'explicit attributes' }
LwsStringSelector >> parsedString: aString [
	<generatedByPlatypus>
	parsedString := aString
]
