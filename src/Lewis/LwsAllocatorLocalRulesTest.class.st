Class {
	#name : #LwsAllocatorLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsAllocatorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAllocator'
]

{ #category : #running }
LwsAllocatorLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsAllocator.opString should be a String' ]
]
