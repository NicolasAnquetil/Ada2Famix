Class {
	#name : #LwsOrdinaryFixedTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsOrdinaryFixedTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsOrdinaryFixedType'
]

{ #category : #running }
LwsOrdinaryFixedTypeLocalRulesTest >> testDelta [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a delta notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsOrdinaryFixedType.delta is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a delta isNil or: [ a delta isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsOrdinaryFixedType.delta should be a LwsExpression' ]
]
