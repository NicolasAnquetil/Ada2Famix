"
<express_specification>
ENTITY LwsProtectedUnitPrivatePart SUBTYPE OF (LwsProtectedUnitPart);
	entries : List OF LwsProtectedUnitPrivateElement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsProtectedUnitPrivatePart,
	#superclass : #LwsProtectedUnitPart,
	#instVars : [
		'entries'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsProtectedUnitPrivatePart class >> annotation [
	<MSEClass: #LwsProtectedUnitPrivatePart super: #LwsProtectedUnitPart>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsProtectedUnitPrivatePart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitProtectedUnitPrivatePart: self
]

{ #category : #'explicit attributes' }
LwsProtectedUnitPrivatePart >> entries [
	<MSEProperty: #entries type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ entries
]

{ #category : #'explicit attributes' }
LwsProtectedUnitPrivatePart >> entries: aListOfProtectedUnitPrivateElement [
	<generatedByPlatypus>
	entries := aListOfProtectedUnitPrivateElement
]

{ #category : #'initialize-release' }
LwsProtectedUnitPrivatePart >> initialize [
	<generatedByPlatypus>
	super initialize.
	entries := OrderedCollection new
]
