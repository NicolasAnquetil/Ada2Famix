Class {
	#name : #LwsDigitConstraintLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsDigitConstraintLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDigitConstraint'
]

{ #category : #running }
LwsDigitConstraintLocalRulesTest >> testExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitConstraint.expression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression isNil or: [ a expression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitConstraint.expression should be a LwsExpression' ]
]

{ #category : #running }
LwsDigitConstraintLocalRulesTest >> testRangeConstraint [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a rangeConstraint isNil or: [ a rangeConstraint isKindOf: LwsRangeConstraint ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDigitConstraint.rangeConstraint should be a LwsRangeConstraint' ]
]
