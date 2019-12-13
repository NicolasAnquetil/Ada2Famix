Class {
	#name : #LwsSubprogramDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsSubprogramDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubprogramDeclaration'
]

{ #category : #running }
LwsSubprogramDeclarationLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubprogramDeclaration.asString should be a String' ]
]

{ #category : #running }
LwsSubprogramDeclarationLocalRulesTest >> testIsAbstract [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubprogramDeclaration.isAbstract is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract isNil or: [ a isAbstract isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubprogramDeclaration.isAbstract should be a Boolean' ]
]

{ #category : #running }
LwsSubprogramDeclarationLocalRulesTest >> testParameters [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parameters notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubprogramDeclaration.parameters is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a parameters isNil
						or: [ (a parameters isKindOf: OrderedCollection) and: [ a parameters allSatisfy: [ :a5 | a5 isKindOf: LwsFormalParameter ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsSubprogramDeclaration.parameters should be a OrderedCollection and be instanciated according to ''List OF LwsFormalParameter''' ]
]
