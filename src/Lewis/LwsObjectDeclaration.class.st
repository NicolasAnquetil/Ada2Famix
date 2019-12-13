"
<express_specification>
ENTITY LwsObjectDeclaration SUBTYPE OF (LwsBasicDeclaration);
	names : List OF String;
	isAliased : boolean := false;
	isConstant : boolean := false;
	definition : LwsObjectSubtypeIndication;
	initialization : OPTIONAL LwsExpression;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsObjectDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'initialization',
		'definition',
		'names',
		'isAliased',
		'isConstant'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsObjectDeclaration class >> annotation [
	<MSEClass: #LwsObjectDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsObjectDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitObjectDeclaration: self
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> definition [
	<MSEProperty: #definition type: #Object>
	<generatedByPlatypus>
	^ definition
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> definition: anObjectSubtypeIndication [
	<generatedByPlatypus>
	definition := anObjectSubtypeIndication
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> initialization [
	<MSEProperty: #initialization type: #LwsExpression>
	<generatedByPlatypus>
	^ initialization
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> initialization: anExpressionOrNil [
	<generatedByPlatypus>
	initialization := anExpressionOrNil
]

{ #category : #'initialize-release' }
LwsObjectDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	names := OrderedCollection new.
	isAliased := nil.
	isConstant := nil.
	definition := nil.
	initialization := nil
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isAliased [
	<MSEProperty: #isAliased type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAliased ifNil: [ isAliased := self isAliasedDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isAliased: aBoolean [
	<generatedByPlatypus>
	isAliased := aBoolean
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isAliasedDefaultValue [
	<MSEProperty: #isAliased type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isConstant [
	<MSEProperty: #isConstant type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isConstant ifNil: [ isConstant := self isConstantDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isConstant: aBoolean [
	<generatedByPlatypus>
	isConstant := aBoolean
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> isConstantDefaultValue [
	<MSEProperty: #isConstant type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> names [
	<MSEProperty: #names type: #String>
	<multivalued>
	<generatedByPlatypus>
	^ names
]

{ #category : #'explicit attributes' }
LwsObjectDeclaration >> names: aListOfString [
	<generatedByPlatypus>
	names := aListOfString
]
