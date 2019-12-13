"
<express_specification>
ENTITY LwsNamedExceptionChoice SUBTYPE OF (LwsExceptionChoice);
	identifier : LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNamedExceptionChoice,
	#superclass : #LwsExceptionChoice,
	#instVars : [
		'identifier'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsNamedExceptionChoice class >> annotation [
	<MSEClass: #LwsNamedExceptionChoice super: #LwsExceptionChoice>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNamedExceptionChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNamedExceptionChoice: self
]

{ #category : #'explicit attributes' }
LwsNamedExceptionChoice >> identifier [
	<MSEProperty: #identifier type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ identifier
]

{ #category : #'explicit attributes' }
LwsNamedExceptionChoice >> identifier: aQualifiedIdentifier [
	<generatedByPlatypus>
	identifier := aQualifiedIdentifier
]

{ #category : #'initialize-release' }
LwsNamedExceptionChoice >> initialize [
	<generatedByPlatypus>
	super initialize.
	identifier := nil
]
