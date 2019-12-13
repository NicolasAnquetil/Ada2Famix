Class {
	#name : #LwsMembershipExpressionLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsMembershipExpressionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsMembershipExpression'
]

{ #category : #running }
LwsMembershipExpressionLocalRulesTest >> testIncluded [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a included notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsMembershipExpression.included is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a included isNil or: [ a included isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsMembershipExpression.included should be a Boolean' ]
]

{ #category : #running }
LwsMembershipExpressionLocalRulesTest >> testOpString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a opString isNil or: [ a opString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsMembershipExpression.opString should be a String' ]
]
