"
<express_specification>
ENTITY LwsFunctionDeclaration SUBTYPE OF (LwsSubprogramDeclaration);
	name : LwsFunctionName;
	returnType : OPTIONAL LwsQualifiedIdentifier;
WHERE
	nameRule :: (self isKindOf: LwsOperatorOverloadDeclaration) not or: [ self name isKindOf: LwsStringDesignator ];
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsFunctionDeclaration,
	#superclass : #LwsSubprogramDeclaration,
	#instVars : [
		'returnType',
		'name'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsFunctionDeclaration class >> annotation [
	<MSEClass: #LwsFunctionDeclaration super: #LwsSubprogramDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsFunctionDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitFunctionDeclaration: self
]

{ #category : #'initialize-release' }
LwsFunctionDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize.
	name := nil.
	returnType := nil
]

{ #category : #'explicit attributes' }
LwsFunctionDeclaration >> name [
	<MSEProperty: #name type: #Object>
	<generatedByPlatypus>
	^ name
]

{ #category : #'explicit attributes' }
LwsFunctionDeclaration >> name: aFunctionName [
	<generatedByPlatypus>
	name := aFunctionName
]

{ #category : #'where rules' }
LwsFunctionDeclaration >> nameRule [
	<generatedByPlatypus>
	^ (self isKindOf: LwsOperatorOverloadDeclaration) not or: [ self name isKindOf: LwsStringDesignator ]
]

{ #category : #'explicit attributes' }
LwsFunctionDeclaration >> returnType [
	<MSEProperty: #returnType type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ returnType
]

{ #category : #'explicit attributes' }
LwsFunctionDeclaration >> returnType: aQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	returnType := aQualifiedIdentifierOrNil
]
