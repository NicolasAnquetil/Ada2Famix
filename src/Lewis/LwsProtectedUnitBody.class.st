"
<express_specification>
ENTITY LwsProtectedUnitBody SUBTYPE OF (LwsBody);
	name : String;
	elements : List OF LwsProtectedUnitBodyElement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitBody,
	#superclass : #LwsBody,
	#instVars : [
		'name',
		'elements'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitBody class >> annotation [
	<MSEClass: #LwsProtectedUnitBody super: #LwsBody>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitBody: self
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBody >> elements [
	<MSEProperty: #elements type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBody >> elements: aListOfProtectedUnitBodyElement [
	<generatedByPlatypus>
	elements := aListOfProtectedUnitBodyElement
]

{ #category : #'initialize-release' }
LwsProtectedUnitBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	elements := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBody >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsProtectedUnitBody >> name: aString [
	<generatedByPlatypus>
	name := aString
]
