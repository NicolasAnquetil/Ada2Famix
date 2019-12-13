Class {
	#name : #LwsProtectedUnitDefinitionLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitDefinitionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitDefinition'
]

{ #category : #running }
LwsProtectedUnitDefinitionLocalRulesTest >> testPrivatePart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a privatePart isNil or: [ a privatePart isKindOf: LwsProtectedUnitPrivatePart ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitDefinition.privatePart should be a LwsProtectedUnitPrivatePart' ]
]

{ #category : #running }
LwsProtectedUnitDefinitionLocalRulesTest >> testPublicPart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitDefinition.publicPart is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart isNil or: [ a publicPart isKindOf: LwsProtectedUnitPublicPart ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitDefinition.publicPart should be a LwsProtectedUnitPublicPart' ]
]
