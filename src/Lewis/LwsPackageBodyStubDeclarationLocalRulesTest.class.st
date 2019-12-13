Class {
	#name : #LwsPackageBodyStubDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsPackageBodyStubDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackageBodyStubDeclaration'
]

{ #category : #running }
LwsPackageBodyStubDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageBodyStubDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsPackageBodyStubDeclaration.name should be a LwsCompoundName' ]
]
