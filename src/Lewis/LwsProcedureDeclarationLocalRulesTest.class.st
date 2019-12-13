Class {
	#name : #LwsProcedureDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProcedureDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProcedureDeclaration'
]

{ #category : #running }
LwsProcedureDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProcedureDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProcedureDeclaration.name should be a LwsCompoundName' ]
]
