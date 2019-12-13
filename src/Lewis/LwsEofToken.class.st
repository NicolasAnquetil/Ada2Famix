"
<express_specification>
ENTITY LwsEofToken SUBTYPE OF (LwsToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEofToken,
	#superclass : #LwsToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsEofToken class >> annotation [
	<MSEClass: #LwsEofToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEofToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEofToken: self
]

{ #category : #'initialize-release' }
LwsEofToken >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'as yet unclassified' }
LwsEofToken >> isEof [
	^ true
]
