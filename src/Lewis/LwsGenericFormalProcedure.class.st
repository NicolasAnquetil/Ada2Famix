"
<express_specification>
ENTITY LwsGenericFormalProcedure SUBTYPE OF (LwsGenericFormalSubprogram);
	SELF\LwsGenericFormalSubprogram.base : LwsProcedureDeclaration;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalProcedure,
	#superclass : #LwsGenericFormalSubprogram,
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalProcedure class >> annotation [
	<MSEClass: #LwsGenericFormalProcedure super: #LwsGenericFormalSubprogram>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalProcedure >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalProcedure: self
]

{ #category : #'initialize-release' }
LwsGenericFormalProcedure >> initialize [
	<generatedByPlatypus>
	super initialize
]
