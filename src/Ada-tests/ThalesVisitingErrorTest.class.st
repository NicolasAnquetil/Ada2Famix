Class {
	#name : #ThalesVisitingErrorTest,
	#superclass : #ThalesExampleTest,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
ThalesVisitingErrorTest >> allSamples [
	^ self allSamplesForCategory: 'model-building-errors'
]

{ #category : #tests }
ThalesVisitingErrorTest >> testErrorEntryStartInSeparate [
	"The main test is that we can parse all examples in ThalesExamples:model-building-errors
	 And this is done in the SetUp"

	self assert: (model findEntityNamed: 'MACHIN1') notNil.
	self assert: (model findEntityNamed: 'TOTO1') notNil.

]

{ #category : #tests }
ThalesVisitingErrorTest >> testErrorTopLevelFunction [
	self deny: (model findEntityNamed: 'ATAN_2') declaredType isNil.
	self 
		assert: (model findEntityNamed: 'ATAN_2') declaredType 
		equals: (model findEntityNamed: 'Toto2')

]

{ #category : #tests }
ThalesVisitingErrorTest >> testErrorTypeAccessProcedure [
	"The main test is that we can parse all examples in ThalesExamples:model-building-errors
	 And this is done in the SetUp"

	self assert: (model findEntityNamed: 'MACHIN2') notNil.
	self assert: (model findEntityNamed: 'Toto2') notNil.

]
