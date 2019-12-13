Class {
	#name : #LwsArgumentSelectorLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsArgumentSelectorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsArgumentSelector'
]

{ #category : #running }
LwsArgumentSelectorLocalRulesTest >> testArguments [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a arguments notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsArgumentSelector.arguments is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a arguments isNil or: [ a arguments isKindOf: LwsAggregate ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsArgumentSelector.arguments should be a LwsAggregate' ]
]
