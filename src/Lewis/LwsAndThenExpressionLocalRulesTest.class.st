Class {
	#name : #LwsAndThenExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsAndThenExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAndThenExpression'
]

{ #category : #running }
LwsAndThenExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsAndThenExpression.opString should be a String' ]
]
