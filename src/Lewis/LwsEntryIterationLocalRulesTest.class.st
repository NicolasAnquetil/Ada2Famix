Class {
	#name : #LwsEntryIterationLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsEntryIterationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryIteration'
]

{ #category : #running }
LwsEntryIterationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryIteration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryIteration.name should be a String' ]
]

{ #category : #running }
LwsEntryIterationLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryIteration.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryIteration.range should be a LwsRange' ]
]
