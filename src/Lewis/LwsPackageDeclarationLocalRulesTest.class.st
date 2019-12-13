Class {
	#name : #LwsPackageDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPackageDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackageDeclaration'
]

{ #category : #running }
LwsPackageDeclarationLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDeclaration.asString should be a String' ]
]

{ #category : #running }
LwsPackageDeclarationLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDeclaration.definition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition isNil or: [ a definition isKindOf: LwsPackageDefinition ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDeclaration.definition should be a LwsPackageDefinition' ]
]

{ #category : #running }
LwsPackageDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageDeclaration.name should be a LwsCompoundName' ]
]
