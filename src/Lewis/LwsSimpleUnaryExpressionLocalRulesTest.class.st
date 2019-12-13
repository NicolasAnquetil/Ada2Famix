Class {
	#name : #LwsSimpleUnaryExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsSimpleUnaryExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSimpleUnaryExpression'
]

{ #category : #running }
LwsSimpleUnaryExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleUnaryExpression.opString should be a String' ]
]

{ #category : #running }
LwsSimpleUnaryExpressionLocalRulesTest >> testRight [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a right notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleUnaryExpression.right is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a right isNil or: [ a right isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleUnaryExpression.right should be a LwsExpression' ]
]
