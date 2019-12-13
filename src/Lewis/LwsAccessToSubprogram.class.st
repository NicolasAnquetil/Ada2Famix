"
<express_specification>
ENTITY LwsAccessToSubprogram SUBTYPE OF (LwsAccessType);
	parameters : List OF LwsFormalParameter;
	returnType : OPTIONAL LwsQualifiedIdentifier;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsAccessToSubprogram,
	#superclass : #LwsAccessType,
	#instVars : [
		'returnType',
		'parameters'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsAccessToSubprogram class >> annotation [
	<MSEClass: #LwsAccessToSubprogram super: #LwsAccessType>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsAccessToSubprogram >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitAccessToSubprogram: self
]

{ #category : #'initialize-release' }
LwsAccessToSubprogram >> initialize [
	<generatedByPlatypus>
	super initialize.
	parameters := OrderedCollection new.
	returnType := nil
]

{ #category : #'explicit attributes' }
LwsAccessToSubprogram >> parameters [
	<MSEProperty: #parameters type: #LwsFormalParameter>
	<multivalued>
	<generatedByPlatypus>
	^ parameters
]

{ #category : #'explicit attributes' }
LwsAccessToSubprogram >> parameters: aListOfFormalParameter [
	<generatedByPlatypus>
	parameters := aListOfFormalParameter
]

{ #category : #'explicit attributes' }
LwsAccessToSubprogram >> returnType [
	<MSEProperty: #returnType type: #LwsQualifiedIdentifier>
	<generatedByPlatypus>
	^ returnType
]

{ #category : #'explicit attributes' }
LwsAccessToSubprogram >> returnType: aQualifiedIdentifierOrNil [
	<generatedByPlatypus>
	returnType := aQualifiedIdentifierOrNil
]
