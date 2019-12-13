"
<express_specification>
ENTITY LwsOperatorOverloadDeclaration SUBTYPE OF (LwsFunctionDeclaration);
	SELF\LwsFunctionDeclaration.name : LwsStringDesignator;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsOperatorOverloadDeclaration,
	#superclass : #LwsFunctionDeclaration,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsOperatorOverloadDeclaration class >> annotation [
	<MSEClass: #LwsOperatorOverloadDeclaration super: #LwsFunctionDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsOperatorOverloadDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitOperatorOverloadDeclaration: self
]

{ #category : #'initialize-release' }
LwsOperatorOverloadDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
