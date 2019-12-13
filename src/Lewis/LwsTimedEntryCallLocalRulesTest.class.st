Class {
	#name : #LwsTimedEntryCallLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsTimedEntryCallLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTimedEntryCall'
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testFirstOrStatementIsDelay [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstOrStatementIsDelay ]
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testFirstStatementIsEntryCall [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstStatementIsEntryCall ]
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testHaveAtLeastOneOrStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneOrStatement ]
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testHaveAtLeastOneStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneStatement ]
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testOrStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a orStatements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsTimedEntryCall.orStatements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a orStatements isNil
						or: [ (a orStatements isKindOf: OrderedCollection) and: [ a orStatements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsTimedEntryCall.orStatements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]

{ #category : #running }
LwsTimedEntryCallLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsTimedEntryCall.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsTimedEntryCall.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
