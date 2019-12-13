Class {
	#name : #LwsFullTypeDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsFullTypeDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsFullTypeDeclaration'
]

{ #category : #running }
LwsFullTypeDeclarationLocalRulesTest >> testTypeDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a typeDefinition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFullTypeDeclaration.typeDefinition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a typeDefinition isNil or: [ a typeDefinition isKindOf: LwsTypeDefinition ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFullTypeDeclaration.typeDefinition should be a LwsTypeDefinition' ]
]
