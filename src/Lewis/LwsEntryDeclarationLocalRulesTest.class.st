Class {
	#name : #LwsEntryDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsEntryDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryDeclaration'
]

{ #category : #running }
LwsEntryDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsEntryDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsEntryDeclaration.name should be a String' ]
]

{ #category : #running }
LwsEntryDeclarationLocalRulesTest >> testParameters [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parameters notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsEntryDeclaration.parameters is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a parameters isNil
						or: [ (a parameters isKindOf: OrderedCollection) and: [ a parameters allSatisfy: [ :a5 | a5 isKindOf: LwsFormalParameter ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsEntryDeclaration.parameters should be a OrderedCollection and be instanciated according to ''List OF LwsFormalParameter''' ]
]

{ #category : #running }
LwsEntryDeclarationLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsEntryDeclaration.range should be a LwsRange' ]
]
