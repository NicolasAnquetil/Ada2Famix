"
<express_specification>
ENTITY LwsGenericFormalFunction SUBTYPE OF (LwsGenericFormalSubprogram);
	SELF\LwsGenericFormalSubprogram.base : LwsProcedureDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalFunction,
	#superclass : #LwsGenericFormalSubprogram,
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalFunction class >> annotation [
	<MSEClass: #LwsGenericFormalFunction super: #LwsGenericFormalSubprogram>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalFunction >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalFunction: self
]

{ #category : #'initialize-release' }
LwsGenericFormalFunction >> initialize [
	<generatedByPlatypus>
	super initialize
]
