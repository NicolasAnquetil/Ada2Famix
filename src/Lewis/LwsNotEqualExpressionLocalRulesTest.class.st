Class {
	#name : #LwsNotEqualExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsNotEqualExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNotEqualExpression'
]

{ #category : #running }
LwsNotEqualExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNotEqualExpression.opString should be a String' ]
]
