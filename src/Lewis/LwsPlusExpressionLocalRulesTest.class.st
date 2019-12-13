Class {
	#name : #LwsPlusExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsPlusExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPlusExpression'
]

{ #category : #running }
LwsPlusExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsPlusExpression.opString should be a String' ]
]
