"
<express_specification>
ENTITY LwsDelayUntilStatement SUBTYPE OF (LwsDelayStatement);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDelayUntilStatement,
	#superclass : #LwsDelayStatement,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsDelayUntilStatement class >> annotation [
	<MSEClass: #LwsDelayUntilStatement super: #LwsDelayStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDelayUntilStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDelayUntilStatement: self
]

{ #category : #'initialize-release' }
LwsDelayUntilStatement >> initialize [
	<generatedByPlatypus>
	super initialize
]
