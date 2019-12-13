Class {
	#name : #LwsPositiveExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsPositiveExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPositiveExpression'
]

{ #category : #running }
LwsPositiveExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsPositiveExpression.opString should be a String' ]
]
