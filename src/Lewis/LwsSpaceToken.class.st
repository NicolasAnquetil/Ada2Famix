"
<express_specification>
ENTITY LwsSpaceToken SUBTYPE OF (LwsBlankToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSpaceToken,
	#superclass : #LwsBlankToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsSpaceToken class >> annotation [
	<MSEClass: #LwsSpaceToken super: #LwsBlankToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSpaceToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSpaceToken: self
]

{ #category : #'initialize-release' }
LwsSpaceToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
