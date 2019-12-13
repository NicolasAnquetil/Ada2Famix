Class {
	#name : #LwsAndExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsAndExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAndExpression'
]

{ #category : #running }
LwsAndExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsAndExpression.opString should be a String' ]
]
