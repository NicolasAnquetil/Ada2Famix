"
<express_specification>
ENTITY LwsDiscreteRange SUBTYPE OF (LwsRange);
	identifier : OPTIONAL LwsQualifiedIdentifier;
	rangeConstraint : OPTIONAL LwsRangeConstraint;
WHERE
	wr1 :: self identifier notNil or: [ self range notNil ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDiscreteRange,
	#superclass : #LwsRange,
	#instVars : [
		'identifier',
		'rangeConstraint'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDiscreteRange class >> annotation [
	<MSEClass: #LwsDiscreteRange super: #LwsRange>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDiscreteRange >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDiscreteRange: self
]

{ #category : #'explicit attributes' }
LwsDiscreteRange >> identifier [
	<MSEProperty: #identifier type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ identifier
]

{ #category : #'explicit attributes' }
LwsDiscreteRange >> identifier: aQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	identifier := aQualifiedIdentifierOrNil
]

{ #category : #'initialize-release' }
LwsDiscreteRange >> initialize [
	<generatedByPlatypus>
	super initialize.
	identifier := nil.
	rangeConstraint := nil
]

{ #category : #'explicit attributes' }
LwsDiscreteRange >> rangeConstraint [
	<MSEProperty: #rangeConstraint type: #LwsRangeConstraint>
	<generatedByPlatypus>
	^ rangeConstraint
]

{ #category : #'explicit attributes' }
LwsDiscreteRange >> rangeConstraint: aRangeConstraintOrNil [
	<generatedByPlatypus>
	rangeConstraint := aRangeConstraintOrNil
]

{ #category : #'where rules' }
LwsDiscreteRange >> wr1 [
	<generatedByPlatypus>
	^ self identifier notNil or: [ self range notNil ]
]
