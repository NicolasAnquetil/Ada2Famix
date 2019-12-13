Class {
	#name : #LwsCaseStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsCaseStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCaseStatement'
]

{ #category : #running }
LwsCaseStatementLocalRulesTest >> testAlternatives [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a alternatives notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCaseStatement.alternatives is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a alternatives isNil
						or: [ 
							(a alternatives isKindOf: OrderedCollection)
								and: [ a alternatives allSatisfy: [ :a5 | a5 isKindOf: LwsCaseAlternative ] ] ] ] value: data)
				description:
					'Lewis.LwsStatementSchema.LwsCaseStatement.alternatives should be a OrderedCollection and be instanciated according to ''List OF LwsCaseAlternative''' ]
]

{ #category : #running }
LwsCaseStatementLocalRulesTest >> testSelector [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a selector notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCaseStatement.selector is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a selector isNil or: [ a selector isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCaseStatement.selector should be a LwsExpression' ]
]
