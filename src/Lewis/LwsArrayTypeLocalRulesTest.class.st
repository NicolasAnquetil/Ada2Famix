Class {
	#name : #LwsArrayTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsArrayTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsArrayType'
]

{ #category : #running }
LwsArrayTypeLocalRulesTest >> testComponentType [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a componentType notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsArrayType.componentType is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a componentType isNil or: [ a componentType isKindOf: LwsComponentSubtype ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsArrayType.componentType should be a LwsComponentSubtype' ]
]

{ #category : #running }
LwsArrayTypeLocalRulesTest >> testIndexes [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a indexes notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsArrayType.indexes is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a indexes isNil
						or: [ 
							(a indexes isKindOf: OrderedCollection)
								and: [ 
									a indexes
										allSatisfy: [ :a5 | 
											{LwsIndex.
											LwsRange} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsArrayType.indexes should be a OrderedCollection and be instanciated according to ''List OF LwsArrayTypeIndexSpec''' ]
]
