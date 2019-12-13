"
<express_specification>
ENTITY LwsCharacterEnumerationId SUBTYPE OF (LwsEnumerationId);
	element : Character;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCharacterEnumerationId,
	#superclass : #LwsEnumerationId,
	#instVars : [
		'element'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsCharacterEnumerationId class >> annotation [
	<MSEClass: #LwsCharacterEnumerationId super: #LwsEnumerationId>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCharacterEnumerationId >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCharacterEnumerationId: self
]

{ #category : #'explicit attributes' }
LwsCharacterEnumerationId >> element [
	<MSEProperty: #element type: #Character>
	<generatedByPlatypus>
	^ element
]

{ #category : #'explicit attributes' }
LwsCharacterEnumerationId >> element: aCharacter [
	<generatedByPlatypus>
	element := aCharacter
]

{ #category : #'initialize-release' }
LwsCharacterEnumerationId >> initialize [
	<generatedByPlatypus>
	super initialize.
	element := nil
]
