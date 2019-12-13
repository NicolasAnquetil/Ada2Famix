Class {
	#name : #LwsGenericFormalParameterLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericFormalParameterLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericFormalParameter'
]

{ #category : #running }
LwsGenericFormalParameterLocalRulesTest >> testBase [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalParameter.base is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base isNil or: [ a base isKindOf: LwsFormalParameter ] ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalParameter.base should be a LwsFormalParameter' ]
]
