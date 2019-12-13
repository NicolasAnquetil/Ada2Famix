"
<express_specification>
ENTITY LwsSubprogramDeclaration ABSTRACT SUPERTYPE SUBTYPE OF (LwsBasicDeclaration);
	parameters : List OF LwsFormalParameter;
	isAbstract : Boolean := false;
DERIVE
	asString : String ::= self name asString;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsSubprogramDeclaration,
	#superclass : #LwsBasicDeclaration,
	#instVars : [
		'isAbstract',
		'parameters'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsSubprogramDeclaration class >> annotation [
	<MSEClass: #LwsSubprogramDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	<abstract>
	^ self
]

{ #category : #visiting }
LwsSubprogramDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitSubprogramDeclaration: self
]

{ #category : #'derived attributes' }
LwsSubprogramDeclaration >> asString [
	<MSEProperty: #asString type: #String>
	<derived>
	<generatedByPlatypus>
	^ self name asString
]

{ #category : #'initialize-release' }
LwsSubprogramDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	parameters := OrderedCollection new.
	isAbstract := nil
]

{ #category : #'explicit attributes' }
LwsSubprogramDeclaration >> isAbstract [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ isAbstract ifNil: [ isAbstract := self isAbstractDefaultValue ]
]

{ #category : #'explicit attributes' }
LwsSubprogramDeclaration >> isAbstract: aBoolean [
	<generatedByPlatypus>
	isAbstract := aBoolean
]

{ #category : #'explicit attributes' }
LwsSubprogramDeclaration >> isAbstractDefaultValue [
	<MSEProperty: #isAbstract type: #Boolean>
	<derived>
	<generatedByPlatypus>
	^ false
]

{ #category : #'explicit attributes' }
LwsSubprogramDeclaration >> parameters [
	<MSEProperty: #parameters type: #LwsFormalParameter>
	<multivalued>
	<generatedByPlatypus>
	^ parameters
]

{ #category : #'explicit attributes' }
LwsSubprogramDeclaration >> parameters: aListOfFormalParameter [
	<generatedByPlatypus>
	parameters := aListOfFormalParameter
]
