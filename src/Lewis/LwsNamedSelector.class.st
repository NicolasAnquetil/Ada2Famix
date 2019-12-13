"
<express_specification>
ENTITY LwsNamedSelector SUBTYPE OF (LwsQualifier);
	parsedString : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNamedSelector,
	#superclass : #LwsQualifier,
	#instVars : [
		'parsedString'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNamedSelector class >> annotation [
	<MSEClass: #LwsNamedSelector super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNamedSelector >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNamedSelector: self
]

{ #category : #'initialize-release' }
LwsNamedSelector >> initialize [
	<generatedByPlatypus>
	super initialize.
	parsedString := nil
]

{ #category : #'explicit attributes' }
LwsNamedSelector >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<generatedByPlatypus>
	^ parsedString
]

{ #category : #'explicit attributes' }
LwsNamedSelector >> parsedString: aString [
	<generatedByPlatypus>
	parsedString := aString
]
