"
<express_specification>
ENTITY LwsEntryIteration SUBTYPE OF (LwsEntity);
	name : String;
	range : LwsRange;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsEntryIteration,
	#superclass : #LwsEntity,
	#instVars : [
		'range',
		'name'
	],
	#category : #'Lewis-LwsDeclarationBodySchema'
}

{ #category : #'MSE annotation' }
LwsEntryIteration class >> annotation [
	<MSEClass: #LwsEntryIteration super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsEntryIteration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitEntryIteration: self
]

{ #category : #'initialize-release' }
LwsEntryIteration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	range := nil
]

{ #category : #'explicit attributes' }
LwsEntryIteration >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsEntryIteration >> name: aString [
	<generatedByPlatypus>
	name := aString
]

{ #category : #'explicit attributes' }
LwsEntryIteration >> range [
	<MSEProperty: #range type: #LwsRange>
	<generatedByPlatypus>
	^ range
]

{ #category : #'explicit attributes' }
LwsEntryIteration >> range: aRange [
	<generatedByPlatypus>
	range := aRange
]
