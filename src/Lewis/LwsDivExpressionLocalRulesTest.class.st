Class {
	#name : #LwsDivExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsDivExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDivExpression'
]

{ #category : #running }
LwsDivExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDivExpression.opString should be a String' ]
]
