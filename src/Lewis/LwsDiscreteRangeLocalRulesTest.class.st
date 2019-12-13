Class {
	#name : #LwsDiscreteRangeLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsDiscreteRangeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDiscreteRange'
]

{ #category : #running }
LwsDiscreteRangeLocalRulesTest >> testIdentifier [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a identifier isNil or: [ a identifier isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDiscreteRange.identifier should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsDiscreteRangeLocalRulesTest >> testRangeConstraint [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a rangeConstraint isNil or: [ a rangeConstraint isKindOf: LwsRangeConstraint ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsDiscreteRange.rangeConstraint should be a LwsRangeConstraint' ]
]

{ #category : #running }
LwsDiscreteRangeLocalRulesTest >> testWr1 [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a wr1 ]
]
