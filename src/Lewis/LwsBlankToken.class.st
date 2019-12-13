"
<express_specification>
ENTITY LwsBlankToken SUBTYPE OF (LwsDelimToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBlankToken,
	#superclass : #LwsDelimToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsBlankToken class >> annotation [
	<MSEClass: #LwsBlankToken super: #LwsDelimToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBlankToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBlankToken: self
]

{ #category : #'initialize-release' }
LwsBlankToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
