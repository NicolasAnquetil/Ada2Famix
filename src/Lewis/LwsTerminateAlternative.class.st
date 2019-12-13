"
<express_specification>
ENTITY LwsTerminateAlternative SUBTYPE OF (LwsSelectiveWaitAlternative);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTerminateAlternative,
	#superclass : #LwsSelectiveWaitAlternative,
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsTerminateAlternative class >> annotation [
	<MSEClass: #LwsTerminateAlternative super: #LwsSelectiveWaitAlternative>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTerminateAlternative >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTerminateAlternative: self
]

{ #category : #'initialize-release' }
LwsTerminateAlternative >> initialize [
	<generatedByPlatypus>
	super initialize
]
