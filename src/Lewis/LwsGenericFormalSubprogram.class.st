"
<express_specification>
ENTITY LwsGenericFormalSubprogram SUBTYPE OF (LwsGenericFormalElement);
	base : LwsSubprogramDeclaration;
	subpDefault : OPTIONAL LwsGenericSubprogramDefault;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericFormalSubprogram,
	#superclass : #LwsGenericFormalElement,
	#instVars : [
		'base',
		'subpDefault'
	],
	#category : #'Lewis-LwsGenericDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericFormalSubprogram class >> annotation [
	<MSEClass: #LwsGenericFormalSubprogram super: #LwsGenericFormalElement>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericFormalSubprogram >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericFormalSubprogram: self
]

{ #category : #'explicit attributes' }
LwsGenericFormalSubprogram >> base [
	<MSEProperty: #base type: #LwsSubprogramDeclaration>
	<generatedByPlatypus>
	^ base
]

{ #category : #'explicit attributes' }
LwsGenericFormalSubprogram >> base: aSubprogramDeclaration [
	<generatedByPlatypus>
	base := aSubprogramDeclaration
]

{ #category : #'initialize-release' }
LwsGenericFormalSubprogram >> initialize [
	<generatedByPlatypus>
	super initialize.
	base := nil.
	subpDefault := nil
]

{ #category : #'explicit attributes' }
LwsGenericFormalSubprogram >> subpDefault [
	<MSEProperty: #subpDefault type: #LwsGenericSubprogramDefault>
	<generatedByPlatypus>
	^ subpDefault
]

{ #category : #'explicit attributes' }
LwsGenericFormalSubprogram >> subpDefault: aGenericSubprogramDefaultOrNil [
	<generatedByPlatypus>
	subpDefault := aGenericSubprogramDefaultOrNil
]
