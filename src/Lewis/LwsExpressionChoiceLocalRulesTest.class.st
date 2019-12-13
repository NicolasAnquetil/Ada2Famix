Class {
	#name : #LwsExpressionChoiceLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsExpressionChoiceLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExpressionChoice'
]

{ #category : #running }
LwsExpressionChoiceLocalRulesTest >> testExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExpressionChoice.expression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression isNil or: [ a expression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExpressionChoice.expression should be a LwsExpression' ]
]
