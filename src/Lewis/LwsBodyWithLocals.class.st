"
<express_specification>
ENTITY LwsBodyWithLocals ABSTRACT SUPERTYPE SUBTYPE OF (LwsBody);
	locals : List OF LwsDeclarationOrBody ::= OrderedCollection new;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBodyWithLocals,
	#superclass : #LwsBody,
	#instVars : [
		'locals'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsBodyWithLocals class >> annotation [
	<MSEClass: #LwsBodyWithLocals super: #LwsBody>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsBodyWithLocals >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBodyWithLocals: self
]

{ #category : #'initialize-release' }
LwsBodyWithLocals >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'explicit attributes' }
LwsBodyWithLocals >> locals [
	<MSEProperty: #locals type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ locals ifNil: [ locals := self localsDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsBodyWithLocals >> locals: aListOfDeclarationOrBody [
	<generatedByPlatypus>
	locals := aListOfDeclarationOrBody
]

{ #category : #'explicit attributes' }
LwsBodyWithLocals >> localsDefaultValue [
	<MSEProperty: #locals type: #Object>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]
