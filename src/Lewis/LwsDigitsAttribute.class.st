"
<express_specification>
ENTITY LwsDigitsAttribute SUBTYPE OF (LwsQualifier);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDigitsAttribute,
	#superclass : #LwsQualifier,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDigitsAttribute class >> annotation [
	<MSEClass: #LwsDigitsAttribute super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDigitsAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDigitsAttribute: self
]

{ #category : #'initialize-release' }
LwsDigitsAttribute >> initialize [
	<generatedByPlatypus>
	super initialize
]
