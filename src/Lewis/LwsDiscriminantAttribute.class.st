"
<express_specification>
ENTITY LwsDiscriminantAttribute SUBTYPE OF (LwsEntity);
	names : List OF String;
	isAccess : Boolean := false;
	domainName : LwsQualifiedIdentifier;
	initialization : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsDiscriminantAttribute,
	#superclass : #LwsEntity,
	#instVars : [
		'initialization',
		'names',
		'isAccess',
		'domainName'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsDiscriminantAttribute class >> annotation [
	<MSEClass: #LwsDiscriminantAttribute super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsDiscriminantAttribute >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitDiscriminantAttribute: self
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> domainName [
	<MSEProperty: #domainName type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ domainName
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> domainName: aQualifiedIdentifier [
	<generatedByPlatypus>
	domainName := aQualifiedIdentifier
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> initialization [
	<MSEProperty: #initialization type: #LwsExpression>
	<generatedByPlatypus>
	^ initialization
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> initialization: anExpressionOrNil [
	<generatedByPlatypus>
	initialization := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsDiscriminantAttribute >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new.
	isAccess := nil.
	domainName := nil.
	initialization := nil
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> isAccess [
	<MSEProperty: #isAccess type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAccess ifNil: [ isAccess := self isAccessDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> isAccess: aBoolean [
	<generatedByPlatypus>
	isAccess := aBoolean
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> isAccessDefaultValue [
	<MSEProperty: #isAccess type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsDiscriminantAttribute >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
