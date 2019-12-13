Class {
	#name : #LwsRemExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsRemExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRemExpression'
]

{ #category : #running }
LwsRemExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsRemExpression.opString should be a String' ]
]
