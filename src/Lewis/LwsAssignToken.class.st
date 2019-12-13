"
<express_specification>
ENTITY LwsAssignToken SUBTYPE OF (LwsOperatorToken);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAssignToken,
	#superclass : #LwsOperatorToken,
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsAssignToken class >> annotation [
	<MSEClass: #LwsAssignToken super: #LwsOperatorToken>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAssignToken >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAssignToken: self
]

{ #category : #'initialize-release' }
LwsAssignToken >> initialize [
	<generatedByPlatypus>
	super initialize
]
