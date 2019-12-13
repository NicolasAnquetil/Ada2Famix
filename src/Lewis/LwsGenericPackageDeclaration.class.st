"
<express_specification>
ENTITY LwsGenericPackageDeclaration SUBTYPE OF (LwsGenericDeclaration);
	SELF\LwsGenericDeclaration.declaration : LwsPackageDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericPackageDeclaration,
	#superclass : #LwsGenericDeclaration,
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericPackageDeclaration class >> annotation [
	<MSEClass: #LwsGenericPackageDeclaration super: #LwsGenericDeclaration>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericPackageDeclaration >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericPackageDeclaration: self
]

{ #category : #'initialize-release' }
LwsGenericPackageDeclaration >> initialize [
	<generatedByPlatypus>
	super initialize
]
