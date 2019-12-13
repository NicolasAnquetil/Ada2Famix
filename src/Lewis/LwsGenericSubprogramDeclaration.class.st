"
<express_specification>
ENTITY LwsGenericSubprogramDeclaration SUBTYPE OF (LwsGenericDeclaration);
	SELF\LwsGenericDeclaration.declaration : LwsSubprogramDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericSubprogramDeclaration,
	#superclass : #LwsGenericDeclaration,
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericSubprogramDeclaration class >> annotation [
	<MSEClass: #LwsGenericSubprogramDeclaration super: #LwsGenericDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericSubprogramDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericSubprogramDeclaration: self
]

{ #category : #'initialize-release' }
LwsGenericSubprogramDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
