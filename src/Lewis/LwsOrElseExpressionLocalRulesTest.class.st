Class {
	#name : #LwsOrElseExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsOrElseExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsOrElseExpression'
]

{ #category : #running }
LwsOrElseExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsOrElseExpression.opString should be a String' ]
]
