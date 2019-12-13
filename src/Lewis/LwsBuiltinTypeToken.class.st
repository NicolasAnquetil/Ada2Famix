"
<express_specification>
ENTITY LwsBuiltinTypeToken SUBTYPE OF (LwsKeywordToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBuiltinTypeToken,
	#superclass : #LwsKeywordToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsBuiltinTypeToken class >> annotation [
	<MSEClass: #LwsBuiltinTypeToken super: #LwsKeywordToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBuiltinTypeToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBuiltinTypeToken: self
]

{ #category : #'initialize-release' }
LwsBuiltinTypeToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
