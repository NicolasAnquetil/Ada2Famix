"
<express_specification>
ENTITY LwsGenericPackageInstanciation SUBTYPE OF (LwsGenericInstanciation);
	packageDeclaration : LwsCompoundName;
END_ENTITY;
</express_specification>

"
Class {
	#name : #LwsGenericPackageInstanciation,
	#superclass : #LwsGenericInstanciation,
	#instVars : [
		'packageDeclaration'
	],
	#category : #'Lewis-LwsDeclarationSchema'
}

{ #category : #'MSE annotation' }
LwsGenericPackageInstanciation class >> annotation [
	<MSEClass: #LwsGenericPackageInstanciation super: #LwsGenericInstanciation>
	<package: 'Lewis'>
	<generatedByPlatypus>
	^ self
]

{ #category : #visiting }
LwsGenericPackageInstanciation >> accept: aVisitor [
	<generatedByPlatypus>
	^ aVisitor visitGenericPackageInstanciation: self
]

{ #category : #'initialize-release' }
LwsGenericPackageInstanciation >> initialize [
	<generatedByPlatypus>
	super initialize.
	packageDeclaration := nil
]

{ #category : #'explicit attributes' }
LwsGenericPackageInstanciation >> packageDeclaration [
	<MSEProperty: #packageDeclaration type: #LwsCompoundName>
	<generatedByPlatypus>
	^ packageDeclaration
]

{ #category : #'explicit attributes' }
LwsGenericPackageInstanciation >> packageDeclaration: aCompoundName [
	<generatedByPlatypus>
	packageDeclaration := aCompoundName
]
