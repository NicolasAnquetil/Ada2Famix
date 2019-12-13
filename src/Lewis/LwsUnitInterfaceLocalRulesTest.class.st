Class {
	#name : #LwsUnitInterfaceLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsUnitInterfaceLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsUnitInterface'
]

{ #category : #running }
LwsUnitInterfaceLocalRulesTest >> testUseClauses [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a useClauses notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnitInterface.useClauses is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a useClauses isNil
						or: [ (a useClauses isKindOf: OrderedCollection) and: [ a useClauses allSatisfy: [ :a5 | a5 isKindOf: LwsUseClause ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUnitInterface.useClauses should be a OrderedCollection and be instanciated according to ''List OF LwsUseClause''' ]
]

{ #category : #running }
LwsUnitInterfaceLocalRulesTest >> testWithClause [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a withClause notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnitInterface.withClause is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a withClause isNil or: [ a withClause isKindOf: LwsWithClause ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnitInterface.withClause should be a LwsWithClause' ]
]
