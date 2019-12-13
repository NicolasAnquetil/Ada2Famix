Class {
	#name : #LwsLoopStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsLoopStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsLoopStatement'
]

{ #category : #running }
LwsLoopStatementLocalRulesTest >> testPolicy [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a policy isNil or: [ a policy isKindOf: LwsIterationPolicy ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsLoopStatement.policy should be a LwsIterationPolicy' ]
]

{ #category : #running }
LwsLoopStatementLocalRulesTest >> testStamp [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a stamp isNil or: [ a stamp isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsLoopStatement.stamp should be a String' ]
]

{ #category : #running }
LwsLoopStatementLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsLoopStatement.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsLoopStatement.statements should be a OrderedCollection and be instanciated according to ''list OF LwsStatement''' ]
]
