Class {
	#name : #LwsUseClauseLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsUseClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsUseClause'
]

{ #category : #running }
LwsUseClauseLocalRulesTest >> testKeyword [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a keyword isNil or: [ a keyword isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUseClause.keyword should be a String' ]
]

{ #category : #running }
LwsUseClauseLocalRulesTest >> testKeywords [
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
					'Lewis.LwsStructureSchema.LwsUseClause.keywords should be a OrderedCollection and be instanciated according to ''list OF String''' ]
]

{ #category : #running }
LwsUseClauseLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUseClause.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a names isNil
						or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: LwsQualifiedIdentifier ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUseClause.names should be a OrderedCollection and be instanciated according to ''list OF LwsQualifiedIdentifier''' ]
]
