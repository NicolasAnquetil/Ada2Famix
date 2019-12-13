Class {
	#name : #LwsIfStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsIfStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsIfStatement'
]

{ #category : #running }
LwsIfStatementLocalRulesTest >> testElseClause [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elseClause isNil
						or: [ (a elseClause isKindOf: OrderedCollection) and: [ a elseClause allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsIfStatement.elseClause should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]

{ #category : #running }
LwsIfStatementLocalRulesTest >> testIfClauses [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a ifClauses notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsIfStatement.ifClauses is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a ifClauses isNil
						or: [ (a ifClauses isKindOf: OrderedCollection) and: [ a ifClauses allSatisfy: [ :a5 | a5 isKindOf: LwsIfClause ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsIfStatement.ifClauses should be a OrderedCollection and be instanciated according to ''List OF LwsIfClause''' ]
]
