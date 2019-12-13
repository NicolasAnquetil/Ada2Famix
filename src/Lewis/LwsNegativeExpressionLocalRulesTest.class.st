Class {
	#name : #LwsNegativeExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsNegativeExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNegativeExpression'
]

{ #category : #running }
LwsNegativeExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNegativeExpression.opString should be a String' ]
]
