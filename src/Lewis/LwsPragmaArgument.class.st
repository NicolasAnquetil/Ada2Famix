"
<express_specification>
ENTITY LwsPragmaArgument SUBTYPE OF (LwsEntity);
	name : OPTIONAL String;
	argumentValue : LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsPragmaArgument,
	#superclass : #LwsEntity,
	#instVars : [
		'name',
		'argumentValue'
	],
	#category : #'Lewis-LwsParsingResultSchema'
}

{ #category : #'MSE annotation' }
LwsPragmaArgument class >> annotation [
	<MSEClass: #LwsPragmaArgument super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsPragmaArgument >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitPragmaArgument: self
]

{ #category : #'explicit attributes' }
LwsPragmaArgument >> argumentValue [
	<MSEProperty: #argumentValue type: #LwsExpression>
	<generatedByPlatypus>
	^ argumentValue
]

{ #category : #'explicit attributes' }
LwsPragmaArgument >> argumentValue: anExpression [
	<generatedByPlatypus>
	argumentValue := anExpression
]

{ #category : #'initialize-release' }
LwsPragmaArgument >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	argumentValue := nil
]

{ #category : #'explicit attributes' }
LwsPragmaArgument >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsPragmaArgument >> name: aStringOrNil [
	<generatedByPlatypus>
	name := aStringOrNil
]
