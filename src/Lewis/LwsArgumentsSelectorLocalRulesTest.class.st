Class {
	#name : #LwsArgumentsSelectorLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsArgumentsSelectorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsArgumentsSelector'
]

{ #category : #running }
LwsArgumentsSelectorLocalRulesTest >> testArguments [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a arguments notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsArgumentsSelector.arguments is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a arguments isNil or: [ a arguments isKindOf: LwsAggregate ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsArgumentsSelector.arguments should be a LwsAggregate' ]
]
