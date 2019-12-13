Class {
	#name : #LwsReturnStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsReturnStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsReturnStatement'
]

{ #category : #running }
LwsReturnStatementLocalRulesTest >> testResult [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a result isNil or: [ a result isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsReturnStatement.result should be a LwsExpression' ]
]
