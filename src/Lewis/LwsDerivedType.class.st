"
<express_specification>
ENTITY LwsDerivedType SUBTYPE OF (LwsElementaryType);
	subtypeIndication : LwsSubtypeIndication;
	isAbstract : Boolean := false;
	withRecord : OPTIONAL LwsRecordType;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDerivedType,
	#superclass : #LwsElementaryType,
	#instVars : [
		'withRecord',
		'isAbstract',
		'subtypeIndication'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDerivedType class >> annotation [
	<MSEClass: #LwsDerivedType super: #LwsElementaryType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDerivedType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDerivedType: self
]

{ #category : #'initialize-release' }
LwsDerivedType >> initialize [
	<generatedByPlatypus>
	super initialize.
	subtypeIndication := nil.
	isAbstract := nil.
	withRecord := nil
]

{ #category : #'explicit attributes' }
LwsDerivedType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAbstract ifNil: [ isAbstract := self isAbstractDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsDerivedType >> isAbstract: aBoolean [
	<generatedByPlatypus>
	isAbstract := aBoolean
]

{ #category : #'explicit attributes' }
LwsDerivedType >> isAbstractDefaultValue [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsDerivedType >> subtypeIndication [
	<MSEProperty: #subtypeIndication type: #LwsSubtypeIndication>
	<generatedByPlatypus>
	^ subtypeIndication
]

{ #category : #'explicit attributes' }
LwsDerivedType >> subtypeIndication: aSubtypeIndication [
	<generatedByPlatypus>
	subtypeIndication := aSubtypeIndication
]

{ #category : #'explicit attributes' }
LwsDerivedType >> withRecord [
	<MSEProperty: #withRecord type: #LwsRecordType>
	<generatedByPlatypus>
	^ withRecord
]

{ #category : #'explicit attributes' }
LwsDerivedType >> withRecord: aRecordTypeOrNil [
	<generatedByPlatypus>
	withRecord := aRecordTypeOrNil
]
