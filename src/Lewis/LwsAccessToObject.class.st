"
<express_specification>
ENTITY LwsAccessToObject SUBTYPE OF (LwsAccessType);
	subtypeIndication : LwsSubtypeIndication;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAccessToObject,
	#superclass : #LwsAccessType,
	#instVars : [
		'subtypeIndication'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAccessToObject class >> annotation [
	<MSEClass: #LwsAccessToObject super: #LwsAccessType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAccessToObject >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAccessToObject: self
]

{ #category : #'initialize-release' }
LwsAccessToObject >> initialize [
	<generatedByPlatypus>
	super initialize.
	subtypeIndication := nil
]

{ #category : #'explicit attributes' }
LwsAccessToObject >> subtypeIndication [
	<MSEProperty: #subtypeIndication type: #LwsSubtypeIndication>
	<generatedByPlatypus>
	^ subtypeIndication
]

{ #category : #'explicit attributes' }
LwsAccessToObject >> subtypeIndication: aSubtypeIndication [
	<generatedByPlatypus>
	subtypeIndication := aSubtypeIndication
]
