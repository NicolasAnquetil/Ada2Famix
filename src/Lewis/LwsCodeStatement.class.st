"
<express_specification>
ENTITY LwsCodeStatement SUBTYPE OF (LwsSimpleStatement);
	code : LwsPrimaryQualifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCodeStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'code'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsCodeStatement class >> annotation [
	<MSEClass: #LwsCodeStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCodeStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCodeStatement: self
]

{ #category : #'explicit attributes' }
LwsCodeStatement >> code [
	<MSEProperty: #code type: #LwsPrimaryQualifier>
	<generatedByPlatypus>
	^ code
]

{ #category : #'explicit attributes' }
LwsCodeStatement >> code: aPrimaryQualifier [
	<generatedByPlatypus>
	code := aPrimaryQualifier
]

{ #category : #'initialize-release' }
LwsCodeStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	code := nil
]
