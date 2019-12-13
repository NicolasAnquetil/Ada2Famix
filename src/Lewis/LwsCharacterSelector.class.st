"
<express_specification>
ENTITY LwsCharacterSelector SUBTYPE OF (LwsQualifier);
	parsedString : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCharacterSelector,
	#superclass : #LwsQualifier,
	#instVars : [
		'parsedString'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsCharacterSelector class >> annotation [
	<MSEClass: #LwsCharacterSelector super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCharacterSelector >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCharacterSelector: self
]

{ #category : #'initialize-release' }
LwsCharacterSelector >> initialize [
	<generatedByPlatypus>
	super initialize.
	parsedString := nil
]

{ #category : #'explicit attributes' }
LwsCharacterSelector >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<generatedByPlatypus>
	^ parsedString
]

{ #category : #'explicit attributes' }
LwsCharacterSelector >> parsedString: aString [
	<generatedByPlatypus>
	parsedString := aString
]
