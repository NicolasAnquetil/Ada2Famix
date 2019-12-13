Class {
	#name : #LwsExpoExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsExpoExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExpoExpression'
]

{ #category : #running }
LwsExpoExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExpoExpression.opString should be a String' ]
]
