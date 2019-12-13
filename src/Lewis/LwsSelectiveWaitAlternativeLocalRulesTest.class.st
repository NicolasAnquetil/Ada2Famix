Class {
	#name : #LwsSelectiveWaitAlternativeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsSelectiveWaitAlternativeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSelectiveWaitAlternative'
]

{ #category : #running }
LwsSelectiveWaitAlternativeLocalRulesTest >> testWhen [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a when isNil or: [ a when isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsSelectiveWaitAlternative.when should be a LwsExpression' ]
]
