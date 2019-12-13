Class {
	#name : #LwsGenericFormalTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericFormalTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericFormalType'
]

{ #category : #running }
LwsGenericFormalTypeLocalRulesTest >> testBase [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalType.base is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base isNil or: [ a base isKindOf: LwsFullTypeDeclaration ] ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalType.base should be a LwsFullTypeDeclaration' ]
]
