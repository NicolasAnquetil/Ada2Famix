Class {
	#name : #LwsXorExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsXorExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsXorExpression'
]

{ #category : #running }
LwsXorExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsXorExpression.opString should be a String' ]
]
