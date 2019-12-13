"
<express_specification>
ENTITY LwsPrivateTypeDefinition SUBTYPE OF (LwsTypeDefinition);
	isTagged : Boolean := false;
	isLimited : Boolean := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPrivateTypeDefinition,
	#superclass : #LwsTypeDefinition,
	#instVars : [
		'isTagged',
		'isLimited'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsPrivateTypeDefinition class >> annotation [
	<MSEClass: #LwsPrivateTypeDefinition super: #LwsTypeDefinition>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPrivateTypeDefinition >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPrivateTypeDefinition: self
]

{ #category : #'initialize-release' }
LwsPrivateTypeDefinition >> initialize [
	<generatedByPlatypus>
	super initialize.
	isTagged := nil.
	isLimited := nil
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isLimited [
	<MSEProperty: #isLimited type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isLimited ifNil: [ isLimited := self isLimitedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isLimited: aBoolean [
	<generatedByPlatypus>
	isLimited := aBoolean
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isLimitedDefaultValue [
	<MSEProperty: #isLimited type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isTagged [
	<MSEProperty: #isTagged type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isTagged ifNil: [ isTagged := self isTaggedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isTagged: aBoolean [
	<generatedByPlatypus>
	isTagged := aBoolean
]

{ #category : #'explicit attributes' }
LwsPrivateTypeDefinition >> isTaggedDefaultValue [
	<MSEProperty: #isTagged type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
