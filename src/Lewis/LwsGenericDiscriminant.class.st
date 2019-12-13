"
<express_specification>
ENTITY LwsGenericDiscriminant SUBTYPE OF (LwsDiscriminantPart);
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericDiscriminant,
	#superclass : #LwsDiscriminantPart,
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericDiscriminant class >> annotation [
	<MSEClass: #LwsGenericDiscriminant super: #LwsDiscriminantPart>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericDiscriminant >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericDiscriminant: self
]

{ #category : #'initialize-release' }
LwsGenericDiscriminant >> initialize [
	<generatedByPlatypus>
	super initialize
]
