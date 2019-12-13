"
<express_specification>
ENTITY LwsStringDesignator SUBTYPE OF (LwsEntity);
	name : String;
DERIVE
	asString : String ::= self name;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStringDesignator,
	#superclass : #LwsEntity,
	#instVars : [
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsStringDesignator class >> annotation [
	<MSEClass: #LwsStringDesignator super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsStringDesignator >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStringDesignator: self
]

{ #category : #'derived attributes' }
LwsStringDesignator >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self name
]

{ #category : #'initialize-release' }
LwsStringDesignator >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsStringDesignator >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsStringDesignator >> name: aString [
	<generatedByPlatypus>
	name := aString
]
