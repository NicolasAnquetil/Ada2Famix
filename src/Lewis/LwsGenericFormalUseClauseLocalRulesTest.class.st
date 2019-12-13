Class {
	#name : #LwsGenericFormalUseClauseLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericFormalUseClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericFormalUseClause'
]

{ #category : #running }
LwsGenericFormalUseClauseLocalRulesTest >> testBase [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalUseClause.base is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a base isNil or: [ a base isKindOf: LwsUseClause ] ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalUseClause.base should be a LwsUseClause' ]
]
