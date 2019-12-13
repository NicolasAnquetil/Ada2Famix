Class {
	#name : #LwsEnumerationTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsEnumerationTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEnumerationType'
]

{ #category : #running }
LwsEnumerationTypeLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsEnumerationType.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ (a elements isKindOf: OrderedCollection) and: [ a elements allSatisfy: [ :a5 | a5 isKindOf: LwsEnumerationId ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsEnumerationType.elements should be a OrderedCollection and be instanciated according to ''List OF LwsEnumerationId''' ]
]
