"
<express_specification>
ENTITY LwsBodyStubDeclaration SUBTYPE OF (LwsBasicDeclaration);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsBodyStubDeclaration,
	#superclass : #LwsBasicDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsBodyStubDeclaration class >> annotation [
	<MSEClass: #LwsBodyStubDeclaration super: #LwsBasicDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsBodyStubDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitBodyStubDeclaration: self
]

{ #category : #'initialize-release' }
LwsBodyStubDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
