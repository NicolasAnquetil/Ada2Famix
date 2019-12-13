Class {
	#name : #LwsRangeChoiceLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsRangeChoiceLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRangeChoice'
]

{ #category : #running }
LwsRangeChoiceLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsRangeChoice.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsRangeChoice.range should be a LwsRange' ]
]
