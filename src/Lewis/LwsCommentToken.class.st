"
<express_specification>
ENTITY LwsCommentToken SUBTYPE OF (LwsToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCommentToken,
	#superclass : #LwsToken,
	#instVars : [
		'haveSomethingBeforeOnTheSameLine'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsCommentToken class >> annotation [
	<MSEClass: #LwsCommentToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCommentToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCommentToken: self
]

{ #category : #'initialize-release' }
LwsCommentToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
