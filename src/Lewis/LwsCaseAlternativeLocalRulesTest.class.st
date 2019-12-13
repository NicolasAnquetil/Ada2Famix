Class {
	#name : #LwsCaseAlternativeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsCaseAlternativeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCaseAlternative'
]

{ #category : #running }
LwsCaseAlternativeLocalRulesTest >> testChoices [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a choices notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCaseAlternative.choices is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a choices isNil
						or: [ (a choices isKindOf: OrderedCollection) and: [ a choices allSatisfy: [ :a5 | a5 isKindOf: LwsChoice ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsCaseAlternative.choices should be a OrderedCollection and be instanciated according to ''list OF LwsChoice''' ]
]

{ #category : #running }
LwsCaseAlternativeLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCaseAlternative.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsCaseAlternative.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
