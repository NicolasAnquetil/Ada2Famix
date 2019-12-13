Class {
	#name : #LwsTaskTypeDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTaskTypeDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTaskTypeDeclaration'
]

{ #category : #running }
LwsTaskTypeDeclarationLocalRulesTest >> testDiscriminant [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a discriminant isNil or: [ a discriminant isKindOf: LwsDiscriminantPart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTaskTypeDeclaration.discriminant should be a LwsDiscriminantPart' ]
]
