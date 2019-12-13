"
<express_specification>
ENTITY LwsDiscriminantSpecification SUBTYPE OF (LwsDiscriminantPart);
	elements : List OF LwsDiscriminantAttribute;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDiscriminantSpecification,
	#superclass : #LwsDiscriminantPart,
	#instVars : [
		'elements'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDiscriminantSpecification class >> annotation [
	<MSEClass: #LwsDiscriminantSpecification super: #LwsDiscriminantPart>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDiscriminantSpecification >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDiscriminantSpecification: self
]

{ #category : #'explicit attributes' }
LwsDiscriminantSpecification >> elements [
	<MSEProperty: #elements type: #LwsDiscriminantAttribute>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsDiscriminantSpecification >> elements: aListOfDiscriminantAttribute [
	<generatedByPlatypus>
	elements := aListOfDiscriminantAttribute
]

{ #category : #'initialize-release' }
LwsDiscriminantSpecification >> initialize [
	<generatedByPlatypus>
	super initialize.
	elements := OrderedCollection new
]
