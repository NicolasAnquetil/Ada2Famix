Class {
	#name : #AdaImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'importer'
	],
	#category : #'Ada-tests'
}

{ #category : #running }
AdaImporterTest >> setUp [
	importer := AdaImporter new.
	importer model: MooseModel new.
	
]

{ #category : #tests }
AdaImporterTest >> test2SubstituteInModelTo [
	| sep pckg inner1 inner2 |
	sep := importer ensureSeparateDeclaration: (FASTAdaQualifiedIdentifier with: 'P_MAIN').

	importer pushContext: sep.
	inner1 := importer ensurePackage: (FASTAdaQualifiedIdentifier with: 'P_INNER1').
	inner2 := importer ensurePackage: (FASTAdaQualifiedIdentifier with: 'P_INNER2').
	importer popContext.

	pckg := importer createEntity: ADAPackage named: 'P_MAIN'.

	importer subsituteInModel: pckg to: sep.
	
	self deny: (importer model includes: sep).
	self assert: inner1 container equals: pckg.
	self assert: inner2 container equals: pckg.
	self assert: (importer model allWithType: ADASeparateDeclaration) isEmpty
]

{ #category : #tests }
AdaImporterTest >> testEnsureSeparateWhenExist [
	| sep pckg inner |
	pckg := importer ensurePackage: (FASTAdaQualifiedIdentifier with: 'P_MAIN').
	importer pushContext: pckg.
	inner := importer ensurePackage: (FASTAdaQualifiedIdentifier with: 'P_INNER').
	importer popContext.

	sep := importer ensureSeparateDeclaration: (FASTAdaQualifiedIdentifier with: 'P_MAIN').
	
	self assert: sep equals: pckg
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation1 [
	| ent |
	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: nil.
	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1. 
	self assert: ent class equals: ADAGenericSubprogramInstanciation.
	self assert: ent name equals: 'fct'.
	self assert: ent signature equals: 'fct(??)'.
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation2 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(??)'.

	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: nil.
	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1.
	self assert: ent signature equals: 'fct(??)'.
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation3 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: nil.
	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1.
	self assert: ent signature equals: 'fct(Stack,And,More)'.
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation4 [
	| ent |
	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1.
	self assert: ent signature equals: 'fct(Stack,And,More)'.
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation5 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(??)'.

	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1.
	self assert: ent signature equals: 'fct(Stack,And,More)'.
]

{ #category : #tests }
AdaImporterTest >> testEnsureSubprogramInstanciation6 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	ent := importer ensureSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	self assert: ent notNil.
	self assert: importer model allAdaSubprograms size equals: 1.
	self assert: ent signature equals: 'fct(Stack,And,More)'.
]

{ #category : #tests }
AdaImporterTest >> testSubstituteInModelTo [
	| sep pckg inner |
	sep := importer ensureSeparateDeclaration: (FASTAdaQualifiedIdentifier with: 'P_MAIN').
	importer pushContext: sep.
	inner := importer ensurePackage: (FASTAdaQualifiedIdentifier with: 'P_INNER').

	importer popContext.
	pckg := importer createEntity: ADAPackage named: 'P_MAIN'.
	importer subsituteInModel: pckg to: sep.
	
	self deny: (importer model includes: sep).
	self assert: inner container equals: pckg.
	self assert: (importer model allWithType: ADASeparateDeclaration) isEmpty
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation1 [
	| ent |
	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: nil.
	self assert: ent isNil
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation2 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(??)'.

	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: nil.

	self assert: ent notNil.
	self assert: ent signature equals: 'fct(??)'
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation3 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: nil.

	self assert: ent notNil.
	self assert: ent signature equals: 'fct(Stack,And,More)'
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation4 [
	| ent |
	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: 'fct(Stack,And,More)'.
	self assert: ent isNil
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation5 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(??)'.

	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: 'fct(Stack,And,More)'.

	self assert: ent notNil.
	self assert: ent signature equals: 'fct(??)'
]

{ #category : #tests }
AdaImporterTest >> testfindMatchingInstanciation6 [
	| ent |
	ent := importer createSubprogramInstanciation: 'fct' withSignature: 'fct(Stack,And,More)'.

	ent := importer findMatchingInstanciationNamed: 'fct' withSignature: 'fct(Stack,And,More)'.

	self assert: ent notNil.
	self assert: ent signature equals: 'fct(Stack,And,More)'
]
