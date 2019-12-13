"
<express_specification>
ENTITY LwsKeywordToken SUBTYPE OF (LwsToken);
DERIVE
	SELF\LwsToken.parsedString : String ::= self blankString , self value asUppercase;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsKeywordToken,
	#superclass : #LwsToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsKeywordToken class >> annotation [
	<MSEClass: #LwsKeywordToken super: #LwsToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsKeywordToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitKeywordToken: self
]

{ #category : #'initialize-release' }
LwsKeywordToken >> initialize [
	<generatedByPlatypus>
	super initialize
]

{ #category : #'derived attributes' }
LwsKeywordToken >> parsedString [
	<MSEProperty: #parsedString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self blankString , self value asUppercase
]
