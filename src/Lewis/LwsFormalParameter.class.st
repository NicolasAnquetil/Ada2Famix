"
<express_specification>
ENTITY LwsFormalParameter SUBTYPE OF (LwsEntity);
	names : list OF String;
	mode : OPTIONAL LwsParameterMode;
	domainName : LwsQualifiedIdentifier;
	initialization : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFormalParameter,
	#superclass : #LwsEntity,
	#instVars : [
		'mode',
		'initialization',
		'names',
		'domainName'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsFormalParameter class >> annotation [
	<MSEClass: #LwsFormalParameter super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFormalParameter >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFormalParameter: self
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> domainName [
	<MSEProperty: #domainName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ domainName
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> domainName: aQualifiedIdentifier [
	<generatedByPlatypus>
	domainName := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> initialization [
	<MSEProperty: #initialization type: #LwsExpression>
	<generatedByPlatypus>
	^ initialization
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> initialization: anExpressionOrNil [
	<generatedByPlatypus>
	initialization := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsFormalParameter >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new.
	mode := nil.
	domainName := nil.
	initialization := nil
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> mode [
	<MSEProperty: #mode type: #Symbol>
	<generatedByPlatypus>
	^ mode
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> mode: aParameterModeOrNil [
	<generatedByPlatypus>
	mode := aParameterModeOrNil
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsFormalParameter >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
