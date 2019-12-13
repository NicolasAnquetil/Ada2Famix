"
<express_specification>
ENTITY LwsQualifiedIdentifier SUBTYPE OF (LwsUnaryExpression);
	name : STRING;
	qualifiers : List OF LwsQualifier ::= OrderedCollection new;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsQualifiedIdentifier,
	#superclass : #LwsUnaryExpression,
	#instVars : [
		'name',
		'qualifiers'
	],
	#category : #'Lewis-LwsExpressionSchema'
}

{ #category : #'MSE annotation' }
LwsQualifiedIdentifier class >> annotation [
	<MSEClass: #LwsQualifiedIdentifier super: #LwsUnaryExpression>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsQualifiedIdentifier >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitQualifiedIdentifier: self
]

{ #category : #'initialize-release' }
LwsQualifiedIdentifier >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil
]

{ #category : #'explicit attributes' }
LwsQualifiedIdentifier >> name [
	<MSEProperty: #name type: #String>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsQualifiedIdentifier >> name: aString [
	<generatedByPlatypus>
	name := aString
]

{ #category : #'explicit attributes' }
LwsQualifiedIdentifier >> qualifiers [
	<MSEProperty: #qualifiers type: #LwsQualifier>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ qualifiers ifNil: [ qualifiers := self qualifiersDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsQualifiedIdentifier >> qualifiers: aListOfQualifier [
	<generatedByPlatypus>
	qualifiers := aListOfQualifier
]

{ #category : #'explicit attributes' }
LwsQualifiedIdentifier >> qualifiersDefaultValue [
	<MSEProperty: #qualifiers type: #LwsQualifier>
	<derived>
	<multivalued>
	<generatedByPlatypus>
	^ OrderedCollection new
]
