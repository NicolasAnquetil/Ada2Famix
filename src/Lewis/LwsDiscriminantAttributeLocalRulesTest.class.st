Class {
	#name : #LwsDiscriminantAttributeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsDiscriminantAttributeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDiscriminantAttribute'
]

{ #category : #running }
LwsDiscriminantAttributeLocalRulesTest >> testDomainName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domainName notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.domainName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domainName isNil or: [ a domainName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.domainName should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsDiscriminantAttributeLocalRulesTest >> testInitialization [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization isNil or: [ a initialization isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.initialization should be a LwsExpression' ]
]

{ #category : #running }
LwsDiscriminantAttributeLocalRulesTest >> testIsAccess [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAccess notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.isAccess is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAccess isNil or: [ a isAccess isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.isAccess should be a Boolean' ]
]

{ #category : #running }
LwsDiscriminantAttributeLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsDiscriminantAttribute.names should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
