Class {
	#name : #LwsUseTypeClauseLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsUseTypeClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsUseTypeClause'
]

{ #category : #running }
LwsUseTypeClauseLocalRulesTest >> testKeywords [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a keywords isNil
						or: [ (a keywords isKindOf: OrderedCollection) and: [ a keywords allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUseTypeClause.keywords should be a OrderedCollection and be instanciated according to ''list OF String''' ]
]
