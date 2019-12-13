"
<express_specification>
ENTITY LwsNamedAttribute SUBTYPE OF (LwsQualifier);
	parsedString : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNamedAttribute,
	#superclass : #LwsQualifier,
	#instVars : [
		'parsedString'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsNamedAttribute class >> annotation [
	<MSEClass: #LwsNamedAttribute super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNamedAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNamedAttribute: self
]

{ #category : #'initialize-release' }
LwsNamedAttribute >> initialize [
	<generatedByPlatypus>
	super initialize.
	parsedString := nil
]

{ #category : #'explicit attributes' }
LwsNamedAttribute >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<generatedByPlatypus>
	^ parsedString
]

{ #category : #'explicit attributes' }
LwsNamedAttribute >> parsedString: aString [
	<generatedByPlatypus>
	parsedString := aString
]
