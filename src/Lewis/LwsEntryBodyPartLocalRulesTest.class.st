Class {
	#name : #LwsEntryBodyPartLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsEntryBodyPartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryBodyPart'
]

{ #category : #running }
LwsEntryBodyPartLocalRulesTest >> testBlockBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBodyPart.blockBody is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody isNil or: [ a blockBody isKindOf: LwsBlockBody ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBodyPart.blockBody should be a LwsBlockBody' ]
]

{ #category : #running }
LwsEntryBodyPartLocalRulesTest >> testLocals [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a locals notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBodyPart.locals is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a locals isNil
						or: [ 
							(a locals isKindOf: OrderedCollection)
								and: [ 
									a locals
										allSatisfy: [ :a5 | 
											{LwsBasicDeclaration.
											LwsSubprogramBody.
											LwsPackageBody.
											LwsTaskBody.
											LwsProtectedUnitBody.
											LwsUseClause.
											LwsRepresentation} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsEntryBodyPart.locals should be a OrderedCollection and be instanciated according to ''List OF LwsDeclarationOrBody''' ]
]
