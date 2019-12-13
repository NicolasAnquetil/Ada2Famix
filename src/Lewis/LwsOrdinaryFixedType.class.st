"
<express_specification>
ENTITY LwsOrdinaryFixedType SUBTYPE OF (LwsFixedType);
	delta : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOrdinaryFixedType,
	#superclass : #LwsFixedType,
	#instVars : [
		'delta'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsOrdinaryFixedType class >> annotation [
	<MSEClass: #LwsOrdinaryFixedType super: #LwsFixedType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOrdinaryFixedType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOrdinaryFixedType: self
]

{ #category : #'explicit attributes' }
LwsOrdinaryFixedType >> delta [
	<MSEProperty: #delta type: #LwsExpression>
	<generatedByPlatypus>
	^ delta
]

{ #category : #'explicit attributes' }
LwsOrdinaryFixedType >> delta: anExpression [
	<generatedByPlatypus>
	delta := anExpression
]

{ #category : #'initialize-release' }
LwsOrdinaryFixedType >> initialize [
	<generatedByPlatypus>
	super initialize.
	delta := nil
]
