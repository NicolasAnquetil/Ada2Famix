"
<express_specification>
ENTITY LwsRangeChoice SUBTYPE OF (LwsChoice);
	range : LwsRange;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsRangeChoice,
	#superclass : #LwsChoice,
	#instVars : [
		'range'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsRangeChoice class >> annotation [
	<MSEClass: #LwsRangeChoice super: #LwsChoice>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsRangeChoice >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitRangeChoice: self
]

{ #category : #'initialize-release' }
LwsRangeChoice >> initialize [
	<generatedByPlatypus>
	super initialize.
	range := nil
]

{ #category : #'explicit attributes' }
LwsRangeChoice >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsRangeChoice >> range: aRange [
	<generatedByPlatypus>
	range := aRange
]
