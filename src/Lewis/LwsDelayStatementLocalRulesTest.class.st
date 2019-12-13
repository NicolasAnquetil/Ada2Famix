Class {
	#name : #LwsDelayStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsDelayStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDelayStatement'
]

{ #category : #running }
LwsDelayStatementLocalRulesTest >> testDelay [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a delay notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsDelayStatement.delay is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a delay isNil or: [ a delay isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsDelayStatement.delay should be a LwsExpression' ]
]
