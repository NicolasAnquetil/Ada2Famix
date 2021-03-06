Class {
	#name : #LwsMultExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsMultExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsMultExpression'
]

{ #category : #running }
LwsMultExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsMultExpression.opString should be a String' ]
]
