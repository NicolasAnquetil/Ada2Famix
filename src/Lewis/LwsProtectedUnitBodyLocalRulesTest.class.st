Class {
	#name : #LwsProtectedUnitBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitBody'
]

{ #category : #running }
LwsProtectedUnitBodyLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsProtectedUnitBody.elements is nil whereas it is mandatory.' ].
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
											{LwsEntryBody.
											LwsSubprogramBody.
											LwsSubprogramDeclaration} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsProtectedUnitBody.elements should be a OrderedCollection and be instanciated according to ''List OF LwsProtectedUnitBodyElement''' ]
]

{ #category : #running }
LwsProtectedUnitBodyLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsProtectedUnitBody.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsProtectedUnitBody.name should be a String' ]
]
