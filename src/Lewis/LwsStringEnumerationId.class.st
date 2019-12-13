"
<express_specification>
ENTITY LwsStringEnumerationId SUBTYPE OF (LwsEnumerationId);
	element : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStringEnumerationId,
	#superclass : #LwsEnumerationId,
	#instVars : [
		'element'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsStringEnumerationId class >> annotation [
	<MSEClass: #LwsStringEnumerationId super: #LwsEnumerationId>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsStringEnumerationId >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStringEnumerationId: self
]

{ #category : #'explicit attributes' }
LwsStringEnumerationId >> element [
	<MSEProperty: #element type: #String>
	<generatedByPlatypus>
	^ element
]

{ #category : #'explicit attributes' }
LwsStringEnumerationId >> element: aString [
	<generatedByPlatypus>
	element := aString
]

{ #category : #'initialize-release' }
LwsStringEnumerationId >> initialize [
	<generatedByPlatypus>
	super initialize.
	element := nil
]
