"
<express_specification>
ENTITY LwsEntryNameArgument SUBTYPE OF (LwsQualifier);
	argument : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryNameArgument,
	#superclass : #LwsQualifier,
	#instVars : [
		'argument'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsEntryNameArgument class >> annotation [
	<MSEClass: #LwsEntryNameArgument super: #LwsQualifier>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryNameArgument >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryNameArgument: self
]

{ #category : #'explicit attributes' }
LwsEntryNameArgument >> argument [
	<MSEProperty: #argument type: #LwsExpression>
	<generatedByPlatypus>
	^ argument
]

{ #category : #'explicit attributes' }
LwsEntryNameArgument >> argument: anExpression [
	<generatedByPlatypus>
	argument := anExpression
]

{ #category : #'initialize-release' }
LwsEntryNameArgument >> initialize [
	<generatedByPlatypus>
	super initialize.
	argument := nil
]
