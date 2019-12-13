Class {
	#name : #LwsSelectiveWaitStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsSelectiveWaitStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSelectiveWaitStatement'
]

{ #category : #running }
LwsSelectiveWaitStatementLocalRulesTest >> testAlternatives [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a alternatives notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsSelectiveWaitStatement.alternatives is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a alternatives isNil
						or: [ 
							(a alternatives isKindOf: OrderedCollection)
								and: [ a alternatives allSatisfy: [ :a5 | a5 isKindOf: LwsSelectiveWaitAlternative ] ] ] ] value: data)
				description:
					'Lewis.LwsStatementSchema.LwsSelectiveWaitStatement.alternatives should be a OrderedCollection and be instanciated according to ''List OF LwsSelectiveWaitAlternative''' ]
]

{ #category : #running }
LwsSelectiveWaitStatementLocalRulesTest >> testElseAlternative [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elseAlternative notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsSelectiveWaitStatement.elseAlternative is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elseAlternative isNil
						or: [ 
							(a elseAlternative isKindOf: OrderedCollection)
								and: [ a elseAlternative allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ] value: data)
				description:
					'Lewis.LwsStatementSchema.LwsSelectiveWaitStatement.elseAlternative should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]

{ #category : #running }
LwsSelectiveWaitStatementLocalRulesTest >> testHaveAtLeastOneAlternative [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a haveAtLeastOneAlternative ]
]
