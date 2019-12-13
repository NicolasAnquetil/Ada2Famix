"
<express_specification>
ENTITY LwsExceptionRenamingDeclaration SUBTYPE OF (LwsElementRenamingDeclaration);
	SELF\LwsElementRenamingDeclaration.newDeclaration : LwsExceptionDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsExceptionRenamingDeclaration,
	#superclass : #LwsElementRenamingDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsExceptionRenamingDeclaration class >> annotation [
	<MSEClass: #LwsExceptionRenamingDeclaration super: #LwsElementRenamingDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsExceptionRenamingDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitExceptionRenamingDeclaration: self
]

{ #category : #'initialize-release' }
LwsExceptionRenamingDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
