Class {
	#name : #LwsRealTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRealTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRealType'
]

{ #category : #running }
LwsRealTypeLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRangeConstraint ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRealType.range should be a LwsRangeConstraint' ]
]
