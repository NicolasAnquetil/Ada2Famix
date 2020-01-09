Class {
	#name : #ThalesExampleTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
ThalesExampleTest >> allSamples [
	^ self subclassResponsibility
]

{ #category : #running }
ThalesExampleTest >> allSamplesForCategory: cat [
	^ (ThalesExamples class organization protocolNamed: cat) methods
]

{ #category : #running }
ThalesExampleTest >> applyVisitor: aVisitor on: sourceSamples withModel: aModel [
	aVisitor model: aModel.
	sourceSamples do: [ :samp |
		(LwsParser parse: (self getSample: samp)) accept: aVisitor.
	]

]

{ #category : #running }
ThalesExampleTest >> getSample: selector [
	^ ThalesExamples perform: selector
]

{ #category : #running }
ThalesExampleTest >> makeVisitor: aClass [
	^	aClass  new
			programPath: '.' ; 
			yourself.
]

{ #category : #running }
ThalesExampleTest >> setUp [
	model := ADAModel new name: 'Ada model'.
	self applyVisitor: (self makeVisitor: LwsAdaVisitorDef) on: self allSamples withModel: model.
	self applyVisitor: (self makeVisitor: LwsAdaVisitorRef) on: self allSamples withModel: model.
	
]
