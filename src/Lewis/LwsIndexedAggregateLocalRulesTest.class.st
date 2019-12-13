Class {
	#name : #LwsIndexedAggregateLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsIndexedAggregateLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsIndexedAggregate'
]

{ #category : #running }
LwsIndexedAggregateLocalRulesTest >> testBase [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base isNil or: [ a base isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsIndexedAggregate.base should be a LwsExpression' ]
]

{ #category : #running }
LwsIndexedAggregateLocalRulesTest >> testIndexes [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a indexes notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsIndexedAggregate.indexes is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a indexes isNil
						or: [ 
							(a indexes isKindOf: OrderedCollection)
								and: [ 
									a indexes
										allSatisfy: [ :a5 | 
											{LwsComponentAssociation.
											LwsExpression} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsExpressionSchema.LwsIndexedAggregate.indexes should be a OrderedCollection and be instanciated according to ''list OF LwsAggregateElement''' ]
]
