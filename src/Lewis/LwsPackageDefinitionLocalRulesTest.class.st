Class {
	#name : #LwsPackageDefinitionLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPackageDefinitionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackageDefinition'
]

{ #category : #running }
LwsPackageDefinitionLocalRulesTest >> testPrivatePart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a privatePart isNil or: [ a privatePart isKindOf: LwsPackagePart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDefinition.privatePart should be a LwsPackagePart' ]
]

{ #category : #running }
LwsPackageDefinitionLocalRulesTest >> testPublicPart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDefinition.publicPart is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a publicPart isNil or: [ a publicPart isKindOf: LwsPackagePart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDefinition.publicPart should be a LwsPackagePart' ]
]
