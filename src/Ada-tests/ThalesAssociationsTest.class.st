"
A LwsAdaDefTest is xxxxxxxxx.

"
Class {
	#name : #ThalesAssociationsTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Ada-tests-ThalesAssocs'
}

{ #category : #running }
ThalesAssociationsTest >> allSamples [
	^ (ThalesExamples class organization protocolNamed: 'large-samples') methods
]

{ #category : #running }
ThalesAssociationsTest >> getSample: selector [
	^ ThalesExamples perform: selector
]

{ #category : #running }
ThalesAssociationsTest >> parse: aSource [
	| parser |
	parser := LwsParser on: (ReadStream on: aSource).
	^ parser parse
]

{ #category : #running }
ThalesAssociationsTest >> parseAndVisit: input [
	| importer res |
	res := (input first isCharacter "one stream or several?"
				ifTrue: [(self parse: input) entities]
				ifFalse: [input flatCollect: [:i | (self parse: i) entities]]).

	importer := LwsAdaVisitorRef new model: model ; programPath: 'some-file' ; yourself.
	res do: [ :e | importer visit: e]
]

{ #category : #running }
ThalesAssociationsTest >> setUp [
	"runs LwsAdaVisitorDef on all 'files' then each test can run LwsAdaVisitorRef on what it needs"
	model := ADAModel new.
	self allSamples do: [ :s || res importer |
		res := (self parse: (self getSample: s)) entities.
		importer := LwsAdaVisitorDef new model: model ; programPath: 'testPath'; yourself.
		res do: [ :e | importer visit: e]
	]
]
