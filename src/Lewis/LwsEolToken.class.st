"
<express_specification>
ENTITY LwsEolToken SUBTYPE OF (LwsBlankToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEolToken,
	#superclass : #LwsBlankToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsEolToken class >> annotation [
	<MSEClass: #LwsEolToken super: #LwsBlankToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEolToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEolToken: self
]

{ #category : #'initialize-release' }
LwsEolToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
