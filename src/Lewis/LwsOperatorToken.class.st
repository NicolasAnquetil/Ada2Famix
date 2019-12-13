"
<express_specification>
ENTITY LwsOperatorToken SUBTYPE OF (LwsKeywordToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOperatorToken,
	#superclass : #LwsKeywordToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsOperatorToken class >> annotation [
	<MSEClass: #LwsOperatorToken super: #LwsKeywordToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOperatorToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOperatorToken: self
]

{ #category : #'initialize-release' }
LwsOperatorToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
