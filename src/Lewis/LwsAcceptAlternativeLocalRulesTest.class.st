Class {
	#name : #LwsAcceptAlternativeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsAcceptAlternativeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAcceptAlternative'
]

{ #category : #running }
LwsAcceptAlternativeLocalRulesTest >> testFirstStatementIsAccept [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a firstStatementIsAccept ]
]

{ #category : #running }
LwsAcceptAlternativeLocalRulesTest >> testHaveAtLeastOneStatement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneStatement ]
]

{ #category : #running }
LwsAcceptAlternativeLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptAlternative.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAcceptAlternative.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
