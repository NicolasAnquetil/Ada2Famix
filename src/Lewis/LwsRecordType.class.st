"
<express_specification>
ENTITY LwsRecordType ABSTRACT SUPERTYPE SUBTYPE OF (LwsCompositeType);
	isTagged : Boolean := false;
	isLimited : Boolean := false;
	isAbstract : Boolean := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRecordType,
	#superclass : #LwsCompositeType,
	#instVars : [
		'isTagged',
		'isLimited',
		'isAbstract'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsRecordType class >> annotation [
	<MSEClass: #LwsRecordType super: #LwsCompositeType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsRecordType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRecordType: self
]

{ #category : #'initialize-release' }
LwsRecordType >> initialize [
	<generatedByPlatypus>
	super initialize.
	isTagged := nil.
	isLimited := nil.
	isAbstract := nil
]

{ #category : #'explicit attributes' }
LwsRecordType >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAbstract ifNil: [ isAbstract := self isAbstractDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsRecordType >> isAbstract: aBoolean [
	<generatedByPlatypus>
	isAbstract := aBoolean
]

{ #category : #'explicit attributes' }
LwsRecordType >> isAbstractDefaultValue [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsRecordType >> isLimited [
	<MSEProperty: #isLimited type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isLimited ifNil: [ isLimited := self isLimitedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsRecordType >> isLimited: aBoolean [
	<generatedByPlatypus>
	isLimited := aBoolean
]

{ #category : #'explicit attributes' }
LwsRecordType >> isLimitedDefaultValue [
	<MSEProperty: #isLimited type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsRecordType >> isTagged [
	<MSEProperty: #isTagged type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isTagged ifNil: [ isTagged := self isTaggedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsRecordType >> isTagged: aBoolean [
	<generatedByPlatypus>
	isTagged := aBoolean
]

{ #category : #'explicit attributes' }
LwsRecordType >> isTaggedDefaultValue [
	<MSEProperty: #isTagged type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
