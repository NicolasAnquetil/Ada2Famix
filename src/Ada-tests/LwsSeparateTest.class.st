"
Tests to remove since they are specific to Thales code ?
or add thales code into normal Ada test suite ?



Email from Nicolas Anquetil (20 octobre 2016)

Le resultat devrait etre:

une procedure MAINMLM qui contient une procedure INIT_STORES.

INIT_STORES contient eventuellement une variable locale a (je ne sais plus si on les cree) et a un acces a cette variable

MAINMLM invoque INIT_STORES



"
Class {
	#name : #LwsSeparateTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #running }
LwsSeparateTest >> parseAndTestSeparate: input [

	| sub main |
	self parseAndVisit: input.
	self assert: (model allWithType: ADASeparateDeclaration) isEmpty.
	self assert: model allAdaSubprograms size equals: 2.
	main := model findEntityNamed: 'MAINMLM' where: #isAdaSubprogram.
	sub := model findEntityNamed: 'INIT_STORES' where: #isAdaSubprogram.
	self assert: sub container == main.
	self assert: main outgoingInvocations size equals: 1.
	self assert: main outgoingInvocations first candidates first == sub.
	self assert: sub incomingInvocations size equals: 1.
	self assert: sub incomingInvocations first sender == main.
	self assert: sub localVariables size equals: 1.
	self assert: sub localVariables first name equals: #a.
	self assert: sub accesses size equals: 2.
	self assert: (sub accesses collect: #isWrite) asArray equals: #(true false)
]

{ #category : #tests }
LwsSeparateTest >> separateInput [
	^ ThalesBugs examplesInCategory: 'bugs - separate'
]

{ #category : #tests }
LwsSeparateTest >> testSeparate [

	self parseAndTestSeparate: (self separateInput sorted: [ :a :b | a size >= b size ])
]

{ #category : #tests }
LwsSeparateTest >> testSeparateOtherSequence [

	self parseAndTestSeparate: (self separateInput sorted: [ :a :b | b size >= a size ])
]

{ #category : #visitor }
LwsSeparateTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
