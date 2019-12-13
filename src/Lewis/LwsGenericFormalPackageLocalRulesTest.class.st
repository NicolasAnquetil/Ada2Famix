Class {
	#name : #LwsGenericFormalPackageLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericFormalPackageLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericFormalPackage'
]

{ #category : #running }
LwsGenericFormalPackageLocalRulesTest >> testBoxArgument [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a boxArgument notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.boxArgument is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a boxArgument isNil or: [ a boxArgument isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.boxArgument should be a Boolean' ]
]

{ #category : #running }
LwsGenericFormalPackageLocalRulesTest >> testIsNewName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isNewName notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.isNewName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isNewName isNil or: [ a isNewName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.isNewName should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsGenericFormalPackageLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericFormalPackage.name should be a String' ]
]
