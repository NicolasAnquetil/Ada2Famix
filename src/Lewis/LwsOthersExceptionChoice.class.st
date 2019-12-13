"
<express_specification>
ENTITY LwsOthersExceptionChoice SUBTYPE OF (LwsExceptionChoice);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOthersExceptionChoice,
	#superclass : #LwsExceptionChoice,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsOthersExceptionChoice class >> annotation [
	<MSEClass: #LwsOthersExceptionChoice super: #LwsExceptionChoice>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOthersExceptionChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOthersExceptionChoice: self
]

{ #category : #'initialize-release' }
LwsOthersExceptionChoice >> initialize [
	<generatedByPlatypus>
	super initialize
]
