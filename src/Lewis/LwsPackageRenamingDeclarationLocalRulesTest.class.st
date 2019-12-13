Class {
	#name : #LwsPackageRenamingDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPackageRenamingDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackageRenamingDeclaration'
]

{ #category : #running }
LwsPackageRenamingDeclarationLocalRulesTest >> testNewName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newName notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageRenamingDeclaration.newName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newName isNil or: [ a newName isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageRenamingDeclaration.newName should be a LwsCompoundName' ]
]
