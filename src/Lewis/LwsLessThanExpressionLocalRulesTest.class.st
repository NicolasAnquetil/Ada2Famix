Class {
	#name : #LwsLessThanExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsLessThanExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsLessThanExpression'
]

{ #category : #running }
LwsLessThanExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsLessThanExpression.opString should be a String' ]
]
