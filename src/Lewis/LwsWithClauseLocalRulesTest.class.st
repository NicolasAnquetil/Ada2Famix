Class {
	#name : #LwsWithClauseLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsWithClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsWithClause'
]

{ #category : #running }
LwsWithClauseLocalRulesTest >> testKeyword [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a keyword isNil or: [ a keyword isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsWithClause.keyword should be a String' ]
]

{ #category : #running }
LwsWithClauseLocalRulesTest >> testKeywords [
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
					'Lewis.LwsStructureSchema.LwsWithClause.keywords should be a OrderedCollection and be instanciated according to ''list OF String''' ]
]

{ #category : #running }
LwsWithClauseLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsWithClause.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a names isNil
						or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: LwsCompoundName ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsWithClause.names should be a OrderedCollection and be instanciated according to ''list OF LwsCompoundName''' ]
]
