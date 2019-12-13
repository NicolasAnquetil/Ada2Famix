Class {
	#name : #LwsDelayAlternativeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsDelayAlternativeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDelayAlternative'
]

{ #category : #running }
LwsDelayAlternativeLocalRulesTest >> testFirstStatementIsDelay [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstStatementIsDelay ]
]

{ #category : #running }
LwsDelayAlternativeLocalRulesTest >> testHaveAtLeastOneStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneStatement ]
]

{ #category : #running }
LwsDelayAlternativeLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsDelayAlternative.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsDelayAlternative.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
