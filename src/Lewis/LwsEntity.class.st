"
<express_specification>
ENTITY LwsEntity;
	context : OPTIONAL LwsEntity;
INVERSE
	contents : List OF LwsEntity FOR context;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntity,
	#superclass : #PtsObject,
	#instVars : [
		'contents',
		'context',
		'startPos',
		'endPos'
	],
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #'MSE annotation' }
LwsEntity class >> annotation [
	<MSEClass: #LwsEntity super: #PtsObject>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #platypus }
LwsEntity class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #visiting }
LwsEntity >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntity: self
]

{ #category : #'inverse attributes' }
LwsEntity >> contents [
	<MSEProperty: #contents type: #LwsEntity opposite: #context>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ contents
]

{ #category : #'inverse attributes' }
LwsEntity >> contents: aListOfEntity [
	<generatedByPlatypus>
	contents value: aListOfEntity
]

{ #category : #'explicit attributes' }
LwsEntity >> context [
	<MSEProperty: #context type: #LwsEntity opposite: #contents>
	<generatedByPlatypus>
	^ context
]

{ #category : #'explicit attributes' }
LwsEntity >> context: anEntityOrNil [
	<generatedByPlatypus>
	context := FMMultivalueLink
		on: self
		update: #contents
		from: self context
		to: anEntityOrNil
]

{ #category : #'system primitive' }
LwsEntity >> doesNotUnderstand: aMessage [
	<generatedByPlatypus>
	(self class namespace receiverOfMessage: aMessage) ifNotNil: [ :rcvr | ^ aMessage sendTo: rcvr ].
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
LwsEntity >> endPosition [
	
	^ endPos
]

{ #category : #accessing }
LwsEntity >> endPosition: anInteger [
	
	endPos := anInteger
]

{ #category : #'initialize-release' }
LwsEntity >> initialize [
	<generatedByPlatypus>
	super initialize.
	context := nil.
	contents := FMMultivalueLink on: self opposite: #context:
]

{ #category : #accessing }
LwsEntity >> startPosition [
	
	^ startPos
]

{ #category : #accessing }
LwsEntity >> startPosition: anInteger [
	
	startPos := anInteger
]
