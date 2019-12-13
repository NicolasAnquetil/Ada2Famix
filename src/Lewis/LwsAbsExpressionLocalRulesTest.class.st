Class {
	#name : #LwsAbsExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsAbsExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAbsExpression'
]

{ #category : #running }
LwsAbsExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsAbsExpression.opString should be a String' ]
]
