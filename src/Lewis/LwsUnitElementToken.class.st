"
<express_specification>
ENTITY LwsUnitElementToken SUBTYPE OF (LwsKeywordToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsUnitElementToken,
	#superclass : #LwsKeywordToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsUnitElementToken class >> annotation [
	<MSEClass: #LwsUnitElementToken super: #LwsKeywordToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsUnitElementToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitUnitElementToken: self
]

{ #category : #'initialize-release' }
LwsUnitElementToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
