"
<express_specification>
ENTITY LwsProtectedUnitPublicPart SUBTYPE OF (LwsProtectedUnitPart);
	entries : List OF LwsProtectedUnitPublicElement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitPublicPart,
	#superclass : #LwsProtectedUnitPart,
	#instVars : [
		'entries'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitPublicPart class >> annotation [
	<MSEClass: #LwsProtectedUnitPublicPart super: #LwsProtectedUnitPart>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitPublicPart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitPublicPart: self
]

{ #category : #'explicit attributes' }
LwsProtectedUnitPublicPart >> entries [
	<MSEProperty: #entries type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ entries
]

{ #category : #'explicit attributes' }
LwsProtectedUnitPublicPart >> entries: aListOfProtectedUnitPublicElement [
	<generatedByPlatypus>
	entries := aListOfProtectedUnitPublicElement
]

{ #category : #'initialize-release' }
LwsProtectedUnitPublicPart >> initialize [
	<generatedByPlatypus>
	super initialize.
	entries := OrderedCollection new
]
