Class {
	#name : #LwsTaskPartLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTaskPartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskPart'
]

{ #category : #running }
LwsTaskPartLocalRulesTest >> testEntries [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entries notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskPart.entries is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a entries isNil
						or: [ (a entries isKindOf: OrderedCollection) and: [ a entries allSatisfy: [ :a5 | a5 isKindOf: LwsEntryDeclaration ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsTaskPart.entries should be a OrderedCollection and be instanciated according to ''list OF LwsEntryDeclaration''' ]
]

{ #category : #running }
LwsTaskPartLocalRulesTest >> testRepresentations [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a representations notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskPart.representations is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a representations isNil
						or: [ 
							(a representations isKindOf: OrderedCollection)
								and: [ a representations allSatisfy: [ :a5 | a5 isKindOf: LwsRepresentation ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsTaskPart.representations should be a OrderedCollection and be instanciated according to ''List OF LwsRepresentation''' ]
]
