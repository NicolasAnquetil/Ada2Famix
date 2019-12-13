"
<express_specification>
ENTITY LwsSubprogramBody SUBTYPE OF (LwsBodyWithLocals);
	declaration : LwsSubprogramDeclaration;
	blockBody : LwsBlockBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubprogramBody,
	#superclass : #LwsBodyWithLocals,
	#instVars : [
		'declaration',
		'blockBody'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsSubprogramBody class >> annotation [
	<MSEClass: #LwsSubprogramBody super: #LwsBodyWithLocals>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSubprogramBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubprogramBody: self
]

{ #category : #'explicit attributes' }
LwsSubprogramBody >> blockBody [
	<MSEProperty: #blockBody type: #LwsBlockBody>
	<generatedByPlatypus>
	^ blockBody
]

{ #category : #'explicit attributes' }
LwsSubprogramBody >> blockBody: aBlockBody [
	<generatedByPlatypus>
	blockBody := aBlockBody
]

{ #category : #'explicit attributes' }
LwsSubprogramBody >> declaration [
	<MSEProperty: #declaration type: #LwsSubprogramDeclaration>
	<generatedByPlatypus>
	^ declaration
]

{ #category : #'explicit attributes' }
LwsSubprogramBody >> declaration: aSubprogramDeclaration [
	<generatedByPlatypus>
	declaration := aSubprogramDeclaration
]

{ #category : #'initialize-release' }
LwsSubprogramBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	declaration := nil.
	blockBody := nil
]
