Class {
	#name : #LwsAccessToObjectLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAccessToObjectLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAccessToObject'
]

{ #category : #running }
LwsAccessToObjectLocalRulesTest >> testSubtypeIndication [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAccessToObject.subtypeIndication is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication isNil or: [ a subtypeIndication isKindOf: LwsSubtypeIndication ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAccessToObject.subtypeIndication should be a LwsSubtypeIndication' ]
]
