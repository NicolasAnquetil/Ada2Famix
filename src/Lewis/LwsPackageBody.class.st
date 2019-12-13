"
<express_specification>
ENTITY LwsPackageBody SUBTYPE OF (LwsBodyWithLocals);
	name : LwsCompoundName;
	blockBody : OPTIONAL LwsBlockBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPackageBody,
	#superclass : #LwsBodyWithLocals,
	#instVars : [
		'name',
		'blockBody'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsPackageBody class >> annotation [
	<MSEClass: #LwsPackageBody super: #LwsBodyWithLocals>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPackageBody >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPackageBody: self
]

{ #category : #'derived attributes' }
LwsPackageBody >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self name asString
]

{ #category : #'explicit attributes' }
LwsPackageBody >> blockBody [
	<MSEProperty: #blockBody type: #LwsBlockBody>
	<generatedByPlatypus>
	^ blockBody
]

{ #category : #'explicit attributes' }
LwsPackageBody >> blockBody: aBlockBodyOrNil [
	<generatedByPlatypus>
	blockBody := aBlockBodyOrNil
]

{ #category : #'initialize-release' }
LwsPackageBody >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	blockBody := nil
]

{ #category : #'explicit attributes' }
LwsPackageBody >> name [
	<MSEProperty: #name type: #LwsCompoundName>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsPackageBody >> name: aCompoundName [
	<generatedByPlatypus>
	name := aCompoundName
]
