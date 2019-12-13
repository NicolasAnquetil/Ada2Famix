"
<express_specification>
ENTITY LwsFloatingType SUBTYPE OF (LwsRealType);
	digits : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFloatingType,
	#superclass : #LwsRealType,
	#instVars : [
		'digits'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsFloatingType class >> annotation [
	<MSEClass: #LwsFloatingType super: #LwsRealType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFloatingType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFloatingType: self
]

{ #category : #'explicit attributes' }
LwsFloatingType >> digits [
	<MSEProperty: #digits type: #LwsExpression>
	<generatedByPlatypus>
	^ digits
]

{ #category : #'explicit attributes' }
LwsFloatingType >> digits: anExpression [
	<generatedByPlatypus>
	digits := anExpression
]

{ #category : #'initialize-release' }
LwsFloatingType >> initialize [
	<generatedByPlatypus>
	super initialize.
	digits := nil
]
