Class {
	#name : #LwsRangeIntegerTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRangeIntegerTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRangeIntegerType'
]

{ #category : #running }
LwsRangeIntegerTypeLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRangeIntegerType.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRangeConstraint ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRangeIntegerType.range should be a LwsRangeConstraint' ]
]
