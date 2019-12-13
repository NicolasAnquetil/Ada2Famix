Class {
	#name : #LwsExitStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsExitStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExitStatement'
]

{ #category : #running }
LwsExitStatementLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsExitStatement.name should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsExitStatementLocalRulesTest >> testWhen [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a when isNil or: [ a when isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsExitStatement.when should be a LwsExpression' ]
]
