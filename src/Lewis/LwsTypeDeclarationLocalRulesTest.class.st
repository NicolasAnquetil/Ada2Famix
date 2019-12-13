Class {
	#name : #LwsTypeDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsTypeDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTypeDeclaration'
]

{ #category : #running }
LwsTypeDeclarationLocalRulesTest >> testDiscriminant [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a discriminant isNil or: [ a discriminant isKindOf: LwsDiscriminantPart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTypeDeclaration.discriminant should be a LwsDiscriminantPart' ]
]

{ #category : #running }
LwsTypeDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTypeDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsTypeDeclaration.name should be a String' ]
]
