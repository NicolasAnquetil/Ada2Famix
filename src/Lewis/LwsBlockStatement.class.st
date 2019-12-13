"
<express_specification>
ENTITY LwsBlockStatement SUBTYPE OF (LwsCompoundStatement);
	stamp : OPTIONAL String;
	locals : list OF LwsEntity;
	body : LwsBlockBody;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBlockStatement,
	#superclass : #LwsCompoundStatement,
	#instVars : [
		'body',
		'locals',
		'stamp'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsBlockStatement class >> annotation [
	<MSEClass: #LwsBlockStatement super: #LwsCompoundStatement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBlockStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBlockStatement: self
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> body [
	<MSEProperty: #body type: #LwsBlockBody>
	<generatedByPlatypus>
	^ body
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> body: aBlockBody [
	<generatedByPlatypus>
	body := aBlockBody
]

{ #category : #'initialize-release' }
LwsBlockStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	stamp := nil.
	locals := OrderedCollection new.
	body := nil
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> locals [
	<MSEProperty: #locals type: #LwsEntity>
	<multivalued>
	<generatedByPlatypus>
	^ locals
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> locals: aListOfEntity [
	<generatedByPlatypus>
	locals := aListOfEntity
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> stamp [
	<MSEProperty: #stamp type: #String>
	<generatedByPlatypus>
	^ stamp
]

{ #category : #'explicit attributes' }
LwsBlockStatement >> stamp: aStringOrNil [
	<generatedByPlatypus>
	stamp := aStringOrNil
]
