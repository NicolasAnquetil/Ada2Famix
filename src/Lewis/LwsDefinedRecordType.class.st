"
<express_specification>
ENTITY LwsDefinedRecordType SUBTYPE OF (LwsRecordType);
	definition : LwsRecordDefinition;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDefinedRecordType,
	#superclass : #LwsRecordType,
	#instVars : [
		'definition'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDefinedRecordType class >> annotation [
	<MSEClass: #LwsDefinedRecordType super: #LwsRecordType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDefinedRecordType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDefinedRecordType: self
]

{ #category : #'explicit attributes' }
LwsDefinedRecordType >> definition [
	<MSEProperty: #definition type: #LwsRecordDefinition>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsDefinedRecordType >> definition: aRecordDefinition [
	<generatedByPlatypus>
	definition := aRecordDefinition
]

{ #category : #'initialize-release' }
LwsDefinedRecordType >> initialize [
	<generatedByPlatypus>
	super initialize.
	definition := nil
]
