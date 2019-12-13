Class {
	#name : #LwsBodyWithLocalsLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsBodyWithLocalsLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsBodyWithLocals'
]

{ #category : #running }
LwsBodyWithLocalsLocalRulesTest >> testLocals [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a locals notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsBodyWithLocals.locals is nil whereas it is mandatory.' ].
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
					'Lewis.LwsDeclarationBodySchema.LwsBodyWithLocals.locals should be a OrderedCollection and be instanciated according to ''List OF LwsDeclarationOrBody''' ]
]
