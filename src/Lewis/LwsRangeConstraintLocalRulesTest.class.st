Class {
	#name : #LwsRangeConstraintLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsRangeConstraintLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRangeConstraint'
]

{ #category : #running }
LwsRangeConstraintLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsRangeConstraint.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsRangeConstraint.range should be a LwsRange' ]
]
