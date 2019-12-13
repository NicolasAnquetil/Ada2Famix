"
<express_specification>
ENTITY LwsPackagePart SUBTYPE OF (LwsEntity);
	elements : List OF LwsPackageDeclarativeElement;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackagePart,
	#superclass : #LwsEntity,
	#instVars : [
		'elements'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPackagePart class >> annotation [
	<MSEClass: #LwsPackagePart super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackagePart >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackagePart: self
]

{ #category : #'explicit attributes' }
LwsPackagePart >> elements [
	<MSEProperty: #elements type: #Object>
	<multivalued>
	<generatedByPlatypus>
	^ elements
]

{ #category : #'explicit attributes' }
LwsPackagePart >> elements: aListOfPackageDeclarativeElement [
	<generatedByPlatypus>
	elements := aListOfPackageDeclarativeElement
]

{ #category : #'initialize-release' }
LwsPackagePart >> initialize [
	<generatedByPlatypus>
	super initialize.
	elements := OrderedCollection new
]
