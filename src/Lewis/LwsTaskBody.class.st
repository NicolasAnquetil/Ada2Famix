"
<express_specification>
ENTITY LwsTaskBody SUBTYPE OF (LwsBodyWithLocals);
	name : String;
	blockBody : LwsBlockBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTaskBody,
	#superclass : #LwsBodyWithLocals,
	#instVars : [
		'name',
		'blockBody'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsTaskBody class >> annotation [
	<MSEClass: #LwsTaskBody super: #LwsBodyWithLocals>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTaskBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTaskBody: self
]

{ #category : #'explicit attributes' }
LwsTaskBody >> blockBody [
	<MSEProperty: #blockBody type: #LwsBlockBody>
	<generatedByPlatypus>
	^ blockBody
]

{ #category : #'explicit attributes' }
LwsTaskBody >> blockBody: aBlockBody [
	<generatedByPlatypus>
	blockBody := aBlockBody
]

{ #category : #'initialize-release' }
LwsTaskBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	blockBody := nil
]

{ #category : #'explicit attributes' }
LwsTaskBody >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsTaskBody >> name: aString [
	<generatedByPlatypus>
	name := aString
]
