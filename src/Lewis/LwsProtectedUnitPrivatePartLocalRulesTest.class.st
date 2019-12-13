Class {
	#name : #LwsProtectedUnitPrivatePartLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitPrivatePartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitPrivatePart'
]

{ #category : #running }
LwsProtectedUnitPrivatePartLocalRulesTest >> testEntries [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entries notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitPrivatePart.entries is nil whereas it is mandatory.' ].
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
											LwsRepresentation.
											LwsComponentAttribute} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitPrivatePart.entries should be a OrderedCollection and be instanciated according to ''List OF LwsProtectedUnitPrivateElement''' ]
]
