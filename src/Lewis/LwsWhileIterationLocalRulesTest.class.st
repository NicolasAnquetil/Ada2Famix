Class {
	#name : #LwsWhileIterationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsWhileIterationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsWhileIteration'
]

{ #category : #running }
LwsWhileIterationLocalRulesTest >> testCondition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a condition notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsWhileIteration.condition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a condition isNil or: [ a condition isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsWhileIteration.condition should be a LwsExpression' ]
]
