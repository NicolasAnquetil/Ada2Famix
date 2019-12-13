Class {
	#name : #LwsConditionalEntryCallLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsConditionalEntryCallLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsConditionalEntryCall'
]

{ #category : #running }
LwsConditionalEntryCallLocalRulesTest >> testElseStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elseStatements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsConditionalEntryCall.elseStatements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elseStatements isNil
						or: [ (a elseStatements isKindOf: OrderedCollection) and: [ a elseStatements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsConditionalEntryCall.elseStatements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]

{ #category : #running }
LwsConditionalEntryCallLocalRulesTest >> testFirstStatementIsEntryCall [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstStatementIsEntryCall ]
]

{ #category : #running }
LwsConditionalEntryCallLocalRulesTest >> testHaveAtLeastOneStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneStatement ]
]

{ #category : #running }
LwsConditionalEntryCallLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsConditionalEntryCall.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsConditionalEntryCall.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
