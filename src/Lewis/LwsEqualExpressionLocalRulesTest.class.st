Class {
	#name : #LwsEqualExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsEqualExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEqualExpression'
]

{ #category : #running }
LwsEqualExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsEqualExpression.opString should be a String' ]
]
