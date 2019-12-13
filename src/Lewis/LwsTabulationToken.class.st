"
<express_specification>
ENTITY LwsTabulationToken SUBTYPE OF (LwsBlankToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsTabulationToken,
	#superclass : #LwsBlankToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsTabulationToken class >> annotation [
	<MSEClass: #LwsTabulationToken super: #LwsBlankToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsTabulationToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitTabulationToken: self
]

{ #category : #'initialize-release' }
LwsTabulationToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
