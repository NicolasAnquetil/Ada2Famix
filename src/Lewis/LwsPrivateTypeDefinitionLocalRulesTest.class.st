Class {
	#name : #LwsPrivateTypeDefinitionLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPrivateTypeDefinitionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPrivateTypeDefinition'
]

{ #category : #running }
LwsPrivateTypeDefinitionLocalRulesTest >> testIsLimited [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isLimited notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPrivateTypeDefinition.isLimited is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isLimited isNil or: [ a isLimited isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPrivateTypeDefinition.isLimited should be a Boolean' ]
]

{ #category : #running }
LwsPrivateTypeDefinitionLocalRulesTest >> testIsTagged [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isTagged notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPrivateTypeDefinition.isTagged is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isTagged isNil or: [ a isTagged isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPrivateTypeDefinition.isTagged should be a Boolean' ]
]
