Class {
	#name : #LwsProtectedUnitPublicPartLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitPublicPartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitPublicPart'
]

{ #category : #running }
LwsProtectedUnitPublicPartLocalRulesTest >> testEntries [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entries notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitPublicPart.entries is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a entries isNil
						or: [ 
							(a entries isKindOf: OrderedCollection)
								and: [ 
									a entries
										allSatisfy: [ :a5 | 
											{LwsEntryDeclaration.
											LwsSubprogramDeclaration.
											LwsRepresentation} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitPublicPart.entries should be a OrderedCollection and be instanciated according to ''List OF LwsProtectedUnitPublicElement''' ]
]
