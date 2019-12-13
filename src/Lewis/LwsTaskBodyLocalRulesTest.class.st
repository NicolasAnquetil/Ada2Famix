Class {
	#name : #LwsTaskBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsTaskBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskBody'
]

{ #category : #running }
LwsTaskBodyLocalRulesTest >> testBlockBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsTaskBody.blockBody is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody isNil or: [ a blockBody isKindOf: LwsBlockBody ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsTaskBody.blockBody should be a LwsBlockBody' ]
]

{ #category : #running }
LwsTaskBodyLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsTaskBody.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsTaskBody.name should be a String' ]
]
