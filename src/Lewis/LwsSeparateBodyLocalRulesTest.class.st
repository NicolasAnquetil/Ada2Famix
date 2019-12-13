Class {
	#name : #LwsSeparateBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsSeparateBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSeparateBody'
]

{ #category : #running }
LwsSeparateBodyLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSeparateBody.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsCompoundName ] ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSeparateBody.name should be a LwsCompoundName' ]
]

{ #category : #running }
LwsSeparateBodyLocalRulesTest >> testSubunitBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subunitBody notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsSeparateBody.subunitBody is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a subunitBody isNil
						or: [ 
							{LwsSubprogramBody.
							LwsPackageBody.
							LwsTaskBody.
							LwsProtectedUnitBody} anySatisfy: [ :el | a subunitBody isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsSeparateBody.subunitBody should be kind of one of (LwsSubprogramBody. LwsPackageBody. LwsTaskBody. LwsProtectedUnitBody)' ]
]
