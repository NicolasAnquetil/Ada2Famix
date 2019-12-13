"
<express_specification>
ENTITY LwsElementaryType SUBTYPE OF (LwsTypeDefinition);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsElementaryType,
	#superclass : #LwsTypeDefinition,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsElementaryType class >> annotation [
	<MSEClass: #LwsElementaryType super: #LwsTypeDefinition>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsElementaryType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitElementaryType: self
]

{ #category : #'initialize-release' }
LwsElementaryType >> initialize [
	<generatedByPlatypus>
	super initialize
]
