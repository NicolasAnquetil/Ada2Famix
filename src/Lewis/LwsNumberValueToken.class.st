"
<express_specification>
ENTITY LwsNumberValueToken SUBTYPE OF (LwsValueToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsNumberValueToken,
	#superclass : #LwsValueToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsNumberValueToken class >> annotation [
	<MSEClass: #LwsNumberValueToken super: #LwsValueToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsNumberValueToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitNumberValueToken: self
]

{ #category : #'initialize-release' }
LwsNumberValueToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
