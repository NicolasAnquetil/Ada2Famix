"
<express_specification>
ENTITY LwsStatement ABSTRACT SUPERTYPE SUBTYPE OF (LwsEntity);
	labels : List OF String;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsStatement,
	#superclass : #LwsEntity,
	#instVars : [
		'labels'
	],
	#category : #'Lewis-LwsStatementSchema'
}

{ #category : #'MSE annotation' }
LwsStatement class >> annotation [
	<MSEClass: #LwsStatement super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsStatement >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitStatement: self
]

{ #category : #'initialize-release' }
LwsStatement >> initialize [
	<generatedByPlatypus>
	super initialize.
	labels := OrderedCollection new
]

{ #category : #'explicit attributes' }
LwsStatement >> labels [
	<MSEProperty: #labels type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ labels
]

{ #category : #'explicit attributes' }
LwsStatement >> labels: aListOfString [
	<generatedByPlatypus>
	labels := aListOfString
]
