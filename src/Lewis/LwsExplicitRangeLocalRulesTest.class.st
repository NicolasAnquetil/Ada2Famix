Class {
	#name : #LwsExplicitRangeLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsExplicitRangeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExplicitRange'
]

{ #category : #running }
LwsExplicitRangeLocalRulesTest >> testStart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a start notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExplicitRange.start is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a start isNil or: [ a start isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExplicitRange.start should be a LwsExpression' ]
]

{ #category : #running }
LwsExplicitRangeLocalRulesTest >> testStop [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a stop notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExplicitRange.stop is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a stop isNil or: [ a stop isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsExplicitRange.stop should be a LwsExpression' ]
]
