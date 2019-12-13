Class {
	#name : #LwsEntryBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsEntryBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryBody'
]

{ #category : #running }
LwsEntryBodyLocalRulesTest >> testBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a body isNil or: [ a body isKindOf: LwsEntryBodyPart ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.body should be a LwsEntryBodyPart' ]
]

{ #category : #running }
LwsEntryBodyLocalRulesTest >> testIteration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a iteration isNil or: [ a iteration isKindOf: LwsEntryIteration ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.iteration should be a LwsEntryIteration' ]
]

{ #category : #running }
LwsEntryBodyLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.name should be a String' ]
]

{ #category : #running }
LwsEntryBodyLocalRulesTest >> testParameters [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parameters notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.parameters is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a parameters isNil
						or: [ (a parameters isKindOf: OrderedCollection) and: [ a parameters allSatisfy: [ :a5 | a5 isKindOf: LwsFormalParameter ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsEntryBody.parameters should be a OrderedCollection and be instanciated according to ''List OF LwsFormalParameter''' ]
]

{ #category : #running }
LwsEntryBodyLocalRulesTest >> testWhenCondition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a whenCondition notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.whenCondition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a whenCondition isNil or: [ a whenCondition isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsEntryBody.whenCondition should be a LwsExpression' ]
]
