"
<express_specification>
ENTITY LwsDecimalFixedType SUBTYPE OF (LwsOrdinaryFixedType);
	digits : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDecimalFixedType,
	#superclass : #LwsOrdinaryFixedType,
	#instVars : [
		'digits'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDecimalFixedType class >> annotation [
	<MSEClass: #LwsDecimalFixedType super: #LwsOrdinaryFixedType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDecimalFixedType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDecimalFixedType: self
]

{ #category : #'explicit attributes' }
LwsDecimalFixedType >> digits [
	<MSEProperty: #digits type: #LwsExpression>
	<generatedByPlatypus>
	^ digits
]

{ #category : #'explicit attributes' }
LwsDecimalFixedType >> digits: anExpression [
	<generatedByPlatypus>
	digits := anExpression
]

{ #category : #'initialize-release' }
LwsDecimalFixedType >> initialize [
	<generatedByPlatypus>
	super initialize.
	digits := nil
]
