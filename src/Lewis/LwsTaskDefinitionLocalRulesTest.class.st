Class {
	#name : #LwsTaskDefinitionLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTaskDefinitionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskDefinition'
]

{ #category : #running }
LwsTaskDefinitionLocalRulesTest >> testPrivatePart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a privatePart isNil or: [ a privatePart isKindOf: LwsTaskPart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDefinition.privatePart should be a LwsTaskPart' ]
]

{ #category : #running }
LwsTaskDefinitionLocalRulesTest >> testPublicPart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDefinition.publicPart is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart isNil or: [ a publicPart isKindOf: LwsTaskPart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDefinition.publicPart should be a LwsTaskPart' ]
]
