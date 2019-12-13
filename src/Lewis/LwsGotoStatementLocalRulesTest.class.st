Class {
	#name : #LwsGotoStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsGotoStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGotoStatement'
]

{ #category : #running }
LwsGotoStatementLocalRulesTest >> testTargetLabel [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a targetLabel notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsGotoStatement.targetLabel is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a targetLabel isNil or: [ a targetLabel isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsGotoStatement.targetLabel should be a String' ]
]
