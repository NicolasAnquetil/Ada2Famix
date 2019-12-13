"
<express_specification>
ENTITY LwsBasicDeclaration SUBTYPE OF (LwsEntity);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBasicDeclaration,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsBasicDeclaration class >> annotation [
	<MSEClass: #LwsBasicDeclaration super: #LwsEntity>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBasicDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBasicDeclaration: self
]

{ #category : #'initialize-release' }
LwsBasicDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
