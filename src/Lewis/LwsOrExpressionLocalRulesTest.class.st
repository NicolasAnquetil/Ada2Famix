Class {
	#name : #LwsOrExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsOrExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsOrExpression'
]

{ #category : #running }
LwsOrExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsOrExpression.opString should be a String' ]
]
