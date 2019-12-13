Class {
	#name : #LwsRaiseStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsRaiseStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRaiseStatement'
]

{ #category : #running }
LwsRaiseStatementLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsRaiseStatement.name should be a LwsQualifiedIdentifier' ]
]
