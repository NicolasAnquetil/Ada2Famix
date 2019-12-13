Class {
	#name : #LwsSubprogramRenamingDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsSubprogramRenamingDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubprogramRenamingDeclaration'
]

{ #category : #running }
LwsSubprogramRenamingDeclarationLocalRulesTest >> testNewDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newDeclaration notNil ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsSubprogramRenamingDeclaration.newDeclaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a newDeclaration isNil or: [ a newDeclaration isKindOf: LwsSubprogramDeclaration ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsSubprogramRenamingDeclaration.newDeclaration should be a LwsSubprogramDeclaration' ]
]
