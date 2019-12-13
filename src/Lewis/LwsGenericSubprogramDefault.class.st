"
<express_specification>
ENTITY LwsGenericSubprogramDefault SUBTYPE OF (LwsEntity);
	default : LwsSubprogramDefaultValue;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericSubprogramDefault,
	#superclass : #LwsEntity,
	#instVars : [
		'default'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericSubprogramDefault class >> annotation [
	<MSEClass: #LwsGenericSubprogramDefault super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericSubprogramDefault >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericSubprogramDefault: self
]

{ #category : #'explicit attributes' }
LwsGenericSubprogramDefault >> default [
	<MSEProperty: #default type: #Object>
	<generatedByPlatypus>
	^ default
]

{ #category : #'explicit attributes' }
LwsGenericSubprogramDefault >> default: aSubprogramDefaultValue [
	<generatedByPlatypus>
	default := aSubprogramDefaultValue
]

{ #category : #'initialize-release' }
LwsGenericSubprogramDefault >> initialize [
	<generatedByPlatypus>
	super initialize.
	default := nil
]
