Class {
	#name : #LwsExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExpression'
]

{ #category : #running }
LwsExpressionLocalRulesTest >> testParenthesis [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parenthesis notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExpression.parenthesis is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parenthesis isNil or: [ a parenthesis isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExpression.parenthesis should be a Boolean' ]
]
