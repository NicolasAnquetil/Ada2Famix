Class {
	#name : #LwsUsedIdentifiersTests,
	#superclass : #TestCase,
	#instVars : [
		'model',
		'visitor'
	],
	#category : #'Ada-tests'
}

{ #category : #running }
LwsUsedIdentifiersTests >> setUp [
	model := THALESModel new.
	visitor := LwsAdaVisitorRef new model: model ; yourself.

]

{ #category : #tests }
LwsUsedIdentifiersTests >> testExistingQualifiedIdentifier [
	| qualified entity found |
	visitor pushContext: (visitor createEntity: ADAPackage named: 'PCKG1').
	visitor pushContext: (visitor createEntity: ADAPackage named: 'PCKG2').
	entity := visitor createSubprogram: 'PCDR' withSignature: 'PCDR()'.
	visitor popContext.
	
	qualified := (FASTAdaQualifiedIdentifier withAll: { 'PCKG2' . 'PCDR'}) asSubprogramIdentifier.
	found := visitor findQualifiedIdentifier: qualified.

	self assert: found equals: entity
]

{ #category : #tests }
LwsUsedIdentifiersTests >> testExistingSimpleIdentifier [
	| qualified entity found |
	visitor pushContext: (visitor createEntity: ADAPackage named: 'PCKG').
	entity := visitor createSubprogram: 'PCDR' withSignature: 'PCDR()'.
	
	qualified := (FASTAdaQualifiedIdentifier with: 'PCDR') asSubprogramIdentifier.
	found := visitor findQualifiedIdentifier: qualified.

	self assert: found equals: entity
]
