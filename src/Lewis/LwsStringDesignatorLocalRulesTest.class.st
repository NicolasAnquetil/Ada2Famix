Class {
	#name : #LwsStringDesignatorLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsStringDesignatorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsStringDesignator'
]

{ #category : #running }
LwsStringDesignatorLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsStringDesignator.asString should be a String' ]
]

{ #category : #running }
LwsStringDesignatorLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsStringDesignator.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsStringDesignator.name should be a String' ]
]
