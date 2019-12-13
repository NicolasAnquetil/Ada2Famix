"
<express_specification>
ENTITY LwsSubtypeDeclaration SUBTYPE OF (LwsBasicDeclaration);
	name : String;
	subtypeIndication : LwsSubtypeIndication;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubtypeDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'name',
		'subtypeIndication'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSubtypeDeclaration class >> annotation [
	<MSEClass: #LwsSubtypeDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSubtypeDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubtypeDeclaration: self
]

{ #category : #'initialize-release' }
LwsSubtypeDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	subtypeIndication := nil
]

{ #category : #'explicit attributes' }
LwsSubtypeDeclaration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsSubtypeDeclaration >> name: aString [
	<generatedByPlatypus>
	name := aString
]

{ #category : #'explicit attributes' }
LwsSubtypeDeclaration >> subtypeIndication [
	<MSEProperty: #subtypeIndication type: #LwsSubtypeIndication>
	<generatedByPlatypus>
	^ subtypeIndication
]

{ #category : #'explicit attributes' }
LwsSubtypeDeclaration >> subtypeIndication: aSubtypeIndication [
	<generatedByPlatypus>
	subtypeIndication := aSubtypeIndication
]
