Class {
	#name : #LwsPackagePartLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPackagePartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackagePart'
]

{ #category : #running }
LwsPackagePartLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackagePart.elements is nil whereas it is mandatory.' ].
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
											{LwsRepresentation.
											LwsUseClause.
											LwsBasicDeclaration} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsPackagePart.elements should be a OrderedCollection and be instanciated according to ''List OF LwsPackageDeclarativeElement''' ]
]
