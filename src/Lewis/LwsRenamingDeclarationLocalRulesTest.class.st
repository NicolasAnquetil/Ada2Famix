Class {
	#name : #LwsRenamingDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRenamingDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRenamingDeclaration'
]

{ #category : #running }
LwsRenamingDeclarationLocalRulesTest >> testRenamedEntityName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a renamedEntityName notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRenamingDeclaration.renamedEntityName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a renamedEntityName isNil or: [ a renamedEntityName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsRenamingDeclaration.renamedEntityName should be a LwsQualifiedIdentifier' ]
]
