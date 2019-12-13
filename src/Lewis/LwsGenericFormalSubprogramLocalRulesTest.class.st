Class {
	#name : #LwsGenericFormalSubprogramLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericFormalSubprogramLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericFormalSubprogram'
]

{ #category : #running }
LwsGenericFormalSubprogramLocalRulesTest >> testBase [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalSubprogram.base is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base isNil or: [ a base isKindOf: LwsSubprogramDeclaration ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalSubprogram.base should be a LwsSubprogramDeclaration' ]
]

{ #category : #running }
LwsGenericFormalSubprogramLocalRulesTest >> testSubpDefault [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subpDefault isNil or: [ a subpDefault isKindOf: LwsGenericSubprogramDefault ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalSubprogram.subpDefault should be a LwsGenericSubprogramDefault' ]
]
