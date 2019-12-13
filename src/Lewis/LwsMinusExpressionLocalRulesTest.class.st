Class {
	#name : #LwsMinusExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsMinusExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsMinusExpression'
]

{ #category : #running }
LwsMinusExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsMinusExpression.opString should be a String' ]
]
