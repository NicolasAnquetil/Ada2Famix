Class {
	#name : #LwsCatenationExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsCatenationExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCatenationExpression'
]

{ #category : #running }
LwsCatenationExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsCatenationExpression.opString should be a String' ]
]
