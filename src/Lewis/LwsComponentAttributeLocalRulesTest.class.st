Class {
	#name : #LwsComponentAttributeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsComponentAttributeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsComponentAttribute'
]

{ #category : #running }
LwsComponentAttributeLocalRulesTest >> testDomain [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domain notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentAttribute.domain is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domain isNil or: [ a domain isKindOf: LwsComponentSubtype ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentAttribute.domain should be a LwsComponentSubtype' ]
]

{ #category : #running }
LwsComponentAttributeLocalRulesTest >> testInitialization [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization isNil or: [ a initialization isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentAttribute.initialization should be a LwsExpression' ]
]

{ #category : #running }
LwsComponentAttributeLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentAttribute.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsComponentAttribute.names should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
