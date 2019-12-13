"
<express_specification>
ENTITY LwsDeltaAttribute SUBTYPE OF (LwsQualifier);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDeltaAttribute,
	#superclass : #LwsQualifier,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsDeltaAttribute class >> annotation [
	<MSEClass: #LwsDeltaAttribute super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDeltaAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDeltaAttribute: self
]

{ #category : #'initialize-release' }
LwsDeltaAttribute >> initialize [
	<generatedByPlatypus>
	super initialize
]
