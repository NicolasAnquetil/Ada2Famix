Class {
	#name : #LwsTaskBodyStubDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTaskBodyStubDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskBodyStubDeclaration'
]

{ #category : #running }
LwsTaskBodyStubDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskBodyStubDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskBodyStubDeclaration.name should be a String' ]
]
