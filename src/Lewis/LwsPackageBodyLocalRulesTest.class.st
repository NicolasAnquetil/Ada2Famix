Class {
	#name : #LwsPackageBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsPackageBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPackageBody'
]

{ #category : #running }
LwsPackageBodyLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsPackageBody.asString should be a String' ]
]

{ #category : #running }
LwsPackageBodyLocalRulesTest >> testBlockBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blockBody isNil or: [ a blockBody isKindOf: LwsBlockBody ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsPackageBody.blockBody should be a LwsBlockBody' ]
]

{ #category : #running }
LwsPackageBodyLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsPackageBody.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsPackageBody.name should be a LwsCompoundName' ]
]
