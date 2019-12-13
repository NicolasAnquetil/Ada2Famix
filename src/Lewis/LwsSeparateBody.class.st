"
<express_specification>
ENTITY LwsSeparateBody SUBTYPE OF (LwsBody);
	name : LwsCompoundName;
	subunitBody : LwsSubunitBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSeparateBody,
	#superclass : #LwsBody,
	#instVars : [
		'name',
		'subunitBody'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsSeparateBody class >> annotation [
	<MSEClass: #LwsSeparateBody super: #LwsBody>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSeparateBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSeparateBody: self
]

{ #category : #'initialize-release' }
LwsSeparateBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	subunitBody := nil
]

{ #category : #'explicit attributes' }
LwsSeparateBody >> name [
	<MSEProperty: #name type: #LwsCompoundName>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsSeparateBody >> name: aCompoundName [
	<generatedByPlatypus>
	name := aCompoundName
]

{ #category : #'explicit attributes' }
LwsSeparateBody >> subunitBody [
	<MSEProperty: #subunitBody type: #Object>
	<generatedByPlatypus>
	^ subunitBody
]

{ #category : #'explicit attributes' }
LwsSeparateBody >> subunitBody: aSubunitBody [
	<generatedByPlatypus>
	subunitBody := aSubunitBody
]
