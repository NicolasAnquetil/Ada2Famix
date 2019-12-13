Class {
	#name : #LwsSubprogramBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsSubprogramBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubprogramBody'
]

{ #category : #running }
LwsSubprogramBodyLocalRulesTest >> testBlockBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSubprogramBody.blockBody is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody isNil or: [ a blockBody isKindOf: LwsBlockBody ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSubprogramBody.blockBody should be a LwsBlockBody' ]
]

{ #category : #running }
LwsSubprogramBodyLocalRulesTest >> testDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a declaration notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSubprogramBody.declaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a declaration isNil or: [ a declaration isKindOf: LwsSubprogramDeclaration ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSubprogramBody.declaration should be a LwsSubprogramDeclaration' ]
]
