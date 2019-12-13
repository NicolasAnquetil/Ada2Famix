"
<express_specification>
ENTITY LwsCompositeType SUBTYPE OF (LwsTypeDefinition);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsCompositeType,
	#superclass : #LwsTypeDefinition,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsCompositeType class >> annotation [
	<MSEClass: #LwsCompositeType super: #LwsTypeDefinition>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsCompositeType >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitCompositeType: self
]

{ #category : #'initialize-release' }
LwsCompositeType >> initialize [
	<generatedByPlatypus>
	super initialize
]
