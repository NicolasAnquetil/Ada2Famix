"
<express_specification>
ENTITY LwsEnumerationType SUBTYPE OF (LwsDiscreteType);
	elements : List OF LwsEnumerationId;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEnumerationType,
	#superclass : #LwsDiscreteType,
	#instVars : [
		'elements'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsEnumerationType class >> annotation [
	<MSEClass: #LwsEnumerationType super: #LwsDiscreteType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEnumerationType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEnumerationType: self
]

{ #category : #'explicit attributes' }
LwsEnumerationType >> elements [
	<MSEProperty: #elements type: #LwsEnumerationId>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsEnumerationType >> elements: aListOfEnumerationId [
	<generatedByPlatypus>
	elements := aListOfEnumerationId
]

{ #category : #'initialize-release' }
LwsEnumerationType >> initialize [
	<generatedByPlatypus>
	super initialize.
	elements := OrderedCollection new
]
