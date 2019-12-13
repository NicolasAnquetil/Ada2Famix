Class {
	#name : #LwsModExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsModExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsModExpression'
]

{ #category : #running }
LwsModExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsModExpression.opString should be a String' ]
]
