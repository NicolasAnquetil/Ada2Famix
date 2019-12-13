Class {
	#name : #LwsAsynchronousSelectLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsAsynchronousSelectLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAsynchronousSelect'
]

{ #category : #running }
LwsAsynchronousSelectLocalRulesTest >> testAbortStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a abortStatements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAsynchronousSelect.abortStatements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a abortStatements isNil
						or: [ 
							(a abortStatements isKindOf: OrderedCollection)
								and: [ a abortStatements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ] value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAsynchronousSelect.abortStatements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]

{ #category : #running }
LwsAsynchronousSelectLocalRulesTest >> testFirstStatementIsEntryCall [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstStatementIsEntryCall ]
]

{ #category : #running }
LwsAsynchronousSelectLocalRulesTest >> testHaveAtLeastOneAbordStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneAbordStatement ]
]

{ #category : #running }
LwsAsynchronousSelectLocalRulesTest >> testHaveAtLeastOneStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneStatement ]
]

{ #category : #running }
LwsAsynchronousSelectLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAsynchronousSelect.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAsynchronousSelect.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
