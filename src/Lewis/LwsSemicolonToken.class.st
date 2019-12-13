"
<express_specification>
ENTITY LwsSemicolonToken SUBTYPE OF (LwsDelimToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSemicolonToken,
	#superclass : #LwsDelimToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsSemicolonToken class >> annotation [
	<MSEClass: #LwsSemicolonToken super: #LwsDelimToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsSemicolonToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSemicolonToken: self
]

{ #category : #'initialize-release' }
LwsSemicolonToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
