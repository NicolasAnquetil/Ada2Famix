Class {
	#name : #LwsProtectedUnitBodyStubDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitBodyStubDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitBodyStubDeclaration'
]

{ #category : #running }
LwsProtectedUnitBodyStubDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitBodyStubDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsProtectedUnitBodyStubDeclaration.name should be a String' ]
]
