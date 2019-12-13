Class {
	#name : #LwsNotExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsNotExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNotExpression'
]

{ #category : #running }
LwsNotExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNotExpression.opString should be a String' ]
]
