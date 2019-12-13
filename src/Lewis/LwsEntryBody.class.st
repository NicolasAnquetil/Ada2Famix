"
<express_specification>
ENTITY LwsEntryBody SUBTYPE OF (LwsBody);
	name : String;
	iteration : OPTIONAL LwsEntryIteration;
	parameters : List OF LwsFormalParameter;
	whenCondition : LwsExpression;
	body : OPTIONAL LwsEntryBodyPart;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryBody,
	#superclass : #LwsBody,
	#instVars : [
		'whenCondition',
		'body',
		'name',
		'parameters',
		'iteration'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsEntryBody class >> annotation [
	<MSEClass: #LwsEntryBody super: #LwsBody>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryBody: self
]

{ #category : #'explicit attributes' }
LwsEntryBody >> body [
	<MSEProperty: #body type: #LwsEntryBodyPart>
	<generatedByPlatypus>
	^ body
]

{ #category : #'explicit attributes' }
LwsEntryBody >> body: anEntryBodyPartOrNil [
	<generatedByPlatypus>
	body := anEntryBodyPartOrNil
]

{ #category : #'initialize-release' }
LwsEntryBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	iteration := nil.
	parameters := OrderedCollection new.
	whenCondition := nil.
	body := nil
]

{ #category : #'explicit attributes' }
LwsEntryBody >> iteration [
	<MSEProperty: #iteration type: #LwsEntryIteration>
	<generatedByPlatypus>
	^ iteration
]

{ #category : #'explicit attributes' }
LwsEntryBody >> iteration: anEntryIterationOrNil [
	<generatedByPlatypus>
	iteration := anEntryIterationOrNil
]

{ #category : #'explicit attributes' }
LwsEntryBody >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsEntryBody >> name: aString [
	<generatedByPlatypus>
	name := aString
]

{ #category : #'explicit attributes' }
LwsEntryBody >> parameters [
	<MSEProperty: #parameters type: #LwsFormalParameter>
	<multivalued>
	<generatedByPlatypus>
	^ parameters
]

{ #category : #'explicit attributes' }
LwsEntryBody >> parameters: aListOfFormalParameter [
	<generatedByPlatypus>
	parameters := aListOfFormalParameter
]

{ #category : #'explicit attributes' }
LwsEntryBody >> whenCondition [
	<MSEProperty: #whenCondition type: #LwsExpression>
	<generatedByPlatypus>
	^ whenCondition
]

{ #category : #'explicit attributes' }
LwsEntryBody >> whenCondition: anExpression [
	<generatedByPlatypus>
	whenCondition := anExpression
]
