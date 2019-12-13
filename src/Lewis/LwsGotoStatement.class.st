"
<express_specification>
ENTITY LwsGotoStatement SUBTYPE OF (LwsSimpleStatement);
	targetLabel : String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGotoStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'targetLabel'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsGotoStatement class >> annotation [
	<MSEClass: #LwsGotoStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGotoStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGotoStatement: self
]

{ #category : #'initialize-release' }
LwsGotoStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	targetLabel := nil
]

{ #category : #'explicit attributes' }
LwsGotoStatement >> targetLabel [
	<MSEProperty: #targetLabel type: #String>
	<generatedByPlatypus>
	^ targetLabel
]

{ #category : #'explicit attributes' }
LwsGotoStatement >> targetLabel: aString [
	<generatedByPlatypus>
	targetLabel := aString
]
