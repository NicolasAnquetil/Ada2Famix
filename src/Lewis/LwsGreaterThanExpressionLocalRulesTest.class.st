Class {
	#name : #LwsGreaterThanExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsGreaterThanExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGreaterThanExpression'
]

{ #category : #running }
LwsGreaterThanExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsGreaterThanExpression.opString should be a String' ]
]
