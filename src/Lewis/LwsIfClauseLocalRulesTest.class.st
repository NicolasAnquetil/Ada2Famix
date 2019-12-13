Class {
	#name : #LwsIfClauseLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsIfClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsIfClause'
]

{ #category : #running }
LwsIfClauseLocalRulesTest >> testCondition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a condition notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsIfClause.condition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a condition isNil or: [ a condition isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsIfClause.condition should be a LwsExpression' ]
]

{ #category : #running }
LwsIfClauseLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsIfClause.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsIfClause.statements should be a OrderedCollection and be instanciated according to ''list OF LwsStatement''' ]
]
