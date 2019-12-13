Class {
	#name : #LwsBinaryExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsBinaryExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsBinaryExpression'
]

{ #category : #running }
LwsBinaryExpressionLocalRulesTest >> testLeft [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a left notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsBinaryExpression.left is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a left isNil or: [ a left isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsBinaryExpression.left should be a LwsExpression' ]
]

{ #category : #running }
LwsBinaryExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsBinaryExpression.opString should be a String' ]
]

{ #category : #running }
LwsBinaryExpressionLocalRulesTest >> testRight [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a right notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsBinaryExpression.right is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a right isNil or: [ a right isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsBinaryExpression.right should be a LwsExpression' ]
]
