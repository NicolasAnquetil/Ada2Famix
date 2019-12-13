Class {
	#name : #LwsGreaterEqualExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsGreaterEqualExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGreaterEqualExpression'
]

{ #category : #running }
LwsGreaterEqualExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsGreaterEqualExpression.opString should be a String' ]
]
