Class {
	#name : #LwsElementRenamingDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsElementRenamingDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsElementRenamingDeclaration'
]

{ #category : #running }
LwsElementRenamingDeclarationLocalRulesTest >> testNewDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newDeclaration notNil ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsElementRenamingDeclaration.newDeclaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newDeclaration isNil or: [ a newDeclaration isKindOf: LwsBasicDeclaration ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsElementRenamingDeclaration.newDeclaration should be a LwsBasicDeclaration' ]
]
