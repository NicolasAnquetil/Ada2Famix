"
<express_specification>
ENTITY LwsRequeueStatement SUBTYPE OF (LwsSimpleStatement);
	taskName : LwsQualifiedIdentifier;
	withAbort : Boolean := false;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRequeueStatement,
	#superclass : #LwsSimpleStatement,
	#instVars : [
		'withAbort',
		'taskName'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsRequeueStatement class >> annotation [
	<MSEClass: #LwsRequeueStatement super: #LwsSimpleStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRequeueStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRequeueStatement: self
]

{ #category : #'initialize-release' }
LwsRequeueStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	taskName := nil.
	withAbort := nil
]

{ #category : #'explicit attributes' }
LwsRequeueStatement >> taskName [
	<MSEProperty: #taskName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ taskName
]

{ #category : #'explicit attributes' }
LwsRequeueStatement >> taskName: aQualifiedIdentifier [
	<generatedByPlatypus>
	taskName := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsRequeueStatement >> withAbort [
	<MSEProperty: #withAbort type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ withAbort ifNil: [ withAbort := self withAbortDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsRequeueStatement >> withAbort: aBoolean [
	<generatedByPlatypus>
	withAbort := aBoolean
]

{ #category : #'explicit attributes' }
LwsRequeueStatement >> withAbortDefaultValue [
	<MSEProperty: #withAbort type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]
