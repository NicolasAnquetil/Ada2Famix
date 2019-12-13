Class {
	#name : #LwsSubtypeDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsSubtypeDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubtypeDeclaration'
]

{ #category : #running }
LwsSubtypeDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeDeclaration.name should be a String' ]
]

{ #category : #running }
LwsSubtypeDeclarationLocalRulesTest >> testSubtypeIndication [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeDeclaration.subtypeIndication is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication isNil or: [ a subtypeIndication isKindOf: LwsSubtypeIndication ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeDeclaration.subtypeIndication should be a LwsSubtypeIndication' ]
]
