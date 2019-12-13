Class {
	#name : #LwsDiscriminantSpecificationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsDiscriminantSpecificationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDiscriminantSpecification'
]

{ #category : #running }
LwsDiscriminantSpecificationLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantSpecification.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ (a elements isKindOf: OrderedCollection) and: [ a elements allSatisfy: [ :a5 | a5 isKindOf: LwsDiscriminantAttribute ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsDiscriminantSpecification.elements should be a OrderedCollection and be instanciated according to ''List OF LwsDiscriminantAttribute''' ]
]
