"
<express_specification>
ENTITY LwsAllSelector SUBTYPE OF (LwsQualifier);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAllSelector,
	#superclass : #LwsQualifier,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsAllSelector class >> annotation [
	<MSEClass: #LwsAllSelector super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAllSelector >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAllSelector: self
]

{ #category : #'initialize-release' }
LwsAllSelector >> initialize [
	<generatedByPlatypus>
	super initialize
]
