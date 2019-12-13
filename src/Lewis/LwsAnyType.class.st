"
<express_specification>
ENTITY LwsAnyType SUBTYPE OF (LwsTypeDefinition);
	parenthesis : Boolean := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAnyType,
	#superclass : #LwsTypeDefinition,
	#instVars : [
		'parenthesis'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAnyType class >> annotation [
	<MSEClass: #LwsAnyType super: #LwsTypeDefinition>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAnyType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAnyType: self
]

{ #category : #'initialize-release' }
LwsAnyType >> initialize [
	<generatedByPlatypus>
	super initialize.
	parenthesis := nil
]

{ #category : #'explicit attributes' }
LwsAnyType >> parenthesis [
	<MSEProperty: #parenthesis type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ parenthesis ifNil: [ parenthesis := self parenthesisDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsAnyType >> parenthesis: aBoolean [
	<generatedByPlatypus>
	parenthesis := aBoolean
]

{ #category : #'explicit attributes' }
LwsAnyType >> parenthesisDefaultValue [
	<MSEProperty: #parenthesis type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
