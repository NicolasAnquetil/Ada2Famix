Class {
	#name : #LwsProtectedUnitDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitDeclaration'
]

{ #category : #running }
LwsProtectedUnitDeclarationLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitDeclaration.definition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition isNil or: [ a definition isKindOf: LwsProtectedUnitDefinition ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitDeclaration.definition should be a LwsProtectedUnitDefinition' ]
]

{ #category : #running }
LwsProtectedUnitDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitDeclaration.name should be a String' ]
]
