Class {
	#name : #LwsProtectedUnitTypeDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsProtectedUnitTypeDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProtectedUnitTypeDeclaration'
]

{ #category : #running }
LwsProtectedUnitTypeDeclarationLocalRulesTest >> testDiscriminant [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a discriminant isNil or: [ a discriminant isKindOf: LwsDiscriminantPart ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsProtectedUnitTypeDeclaration.discriminant should be a LwsDiscriminantPart' ]
]
