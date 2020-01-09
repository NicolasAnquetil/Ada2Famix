Class {
	#name : #ThalesAccessCreationErrorTest,
	#superclass : #ThalesExampleTest,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
ThalesAccessCreationErrorTest >> allSamples [
	^ #( desensibizedMessageCommonTypesAds desensibizedAicEngAttainabilityComputationRequestAdb )
]

{ #category : #'as yet unclassified' }
ThalesAccessCreationErrorTest >> testAicEngAttainabilityComputationRequest [

	self assert: (model allAccesses anySatisfy: [:acc | acc variable name = 'C_MSG_HEADER_SIZE'])
]
