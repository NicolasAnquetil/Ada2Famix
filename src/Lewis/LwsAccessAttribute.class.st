"
<express_specification>
ENTITY LwsAccessAttribute SUBTYPE OF (LwsQualifier);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAccessAttribute,
	#superclass : #LwsQualifier,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAccessAttribute class >> annotation [
	<MSEClass: #LwsAccessAttribute super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAccessAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAccessAttribute: self
]

{ #category : #'initialize-release' }
LwsAccessAttribute >> initialize [
	<generatedByPlatypus>
	super initialize
]
