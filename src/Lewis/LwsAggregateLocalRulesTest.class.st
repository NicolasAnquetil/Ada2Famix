Class {
	#name : #LwsAggregateLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsAggregateLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAggregate'
]

{ #category : #running }
LwsAggregateLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsAggregate.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ 
							(a elements isKindOf: OrderedCollection)
								and: [ 
									a elements
										allSatisfy: [ :a5 | 
											{LwsComponentAssociation.
											LwsExpression} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsExpressionSchema.LwsAggregate.elements should be a OrderedCollection and be instanciated according to ''list OF LwsAggregateElement''' ]
]
