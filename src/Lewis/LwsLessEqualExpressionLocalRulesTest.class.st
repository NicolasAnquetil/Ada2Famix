Class {
	#name : #LwsLessEqualExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsLessEqualExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsLessEqualExpression'
]

{ #category : #running }
LwsLessEqualExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsLessEqualExpression.opString should be a String' ]
]
