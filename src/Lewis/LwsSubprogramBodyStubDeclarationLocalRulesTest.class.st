Class {
	#name : #LwsSubprogramBodyStubDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsSubprogramBodyStubDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubprogramBodyStubDeclaration'
]

{ #category : #running }
LwsSubprogramBodyStubDeclarationLocalRulesTest >> testDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a declaration notNil ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsSubprogramBodyStubDeclaration.declaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a declaration isNil or: [ a declaration isKindOf: LwsSubprogramDeclaration ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsSubprogramBodyStubDeclaration.declaration should be a LwsSubprogramDeclaration' ]
]
