Class {
	#name : #LwsTaskDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTaskDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskDeclaration'
]

{ #category : #running }
LwsTaskDeclarationLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition isNil or: [ a definition isKindOf: LwsTaskDefinition ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDeclaration.definition should be a LwsTaskDefinition' ]
]

{ #category : #running }
LwsTaskDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskDeclaration.name should be a String' ]
]
