"
<express_specification>
ENTITY LwsOtherChoice SUBTYPE OF (LwsChoice);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOtherChoice,
	#superclass : #LwsChoice,
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsOtherChoice class >> annotation [
	<MSEClass: #LwsOtherChoice super: #LwsChoice>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOtherChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOtherChoice: self
]

{ #category : #'initialize-release' }
LwsOtherChoice >> initialize [
	<generatedByPlatypus>
	super initialize
]
