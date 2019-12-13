"
<express_specification>
ENTITY LwsDelimToken SUBTYPE OF (LwsToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDelimToken,
	#superclass : #LwsToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsDelimToken class >> annotation [
	<MSEClass: #LwsDelimToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDelimToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDelimToken: self
]

{ #category : #'initialize-release' }
LwsDelimToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
