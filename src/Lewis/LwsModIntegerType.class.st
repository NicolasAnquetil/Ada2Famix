"
<express_specification>
ENTITY LwsModIntegerType SUBTYPE OF (LwsIntegerType);
	modu : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsModIntegerType,
	#superclass : #LwsIntegerType,
	#instVars : [
		'modu'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsModIntegerType class >> annotation [
	<MSEClass: #LwsModIntegerType super: #LwsIntegerType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsModIntegerType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitModIntegerType: self
]

{ #category : #'initialize-release' }
LwsModIntegerType >> initialize [
	<generatedByPlatypus>
	super initialize.
	modu := nil
]

{ #category : #'explicit attributes' }
LwsModIntegerType >> modu [
	<MSEProperty: #modu type: #LwsExpression>
	<generatedByPlatypus>
	^ modu
]

{ #category : #'explicit attributes' }
LwsModIntegerType >> modu: anExpression [
	<generatedByPlatypus>
	modu := anExpression
]
