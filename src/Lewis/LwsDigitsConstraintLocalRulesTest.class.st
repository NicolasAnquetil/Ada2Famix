Class {
	#name : #LwsDigitsConstraintLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsDigitsConstraintLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDigitsConstraint'
]

{ #category : #running }
LwsDigitsConstraintLocalRulesTest >> testExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitsConstraint.expression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression isNil or: [ a expression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitsConstraint.expression should be a LwsExpression' ]
]

{ #category : #running }
LwsDigitsConstraintLocalRulesTest >> testRangeConstraint [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a rangeConstraint isNil or: [ a rangeConstraint isKindOf: LwsRangeConstraint ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitsConstraint.rangeConstraint should be a LwsRangeConstraint' ]
]
