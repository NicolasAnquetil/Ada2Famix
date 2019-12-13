Class {
	#name : #LwsStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsStatement'
]

{ #category : #running }
LwsStatementLocalRulesTest >> testLabels [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a labels notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsStatement.labels is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a labels isNil
						or: [ (a labels isKindOf: OrderedCollection) and: [ a labels allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsStatement.labels should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
