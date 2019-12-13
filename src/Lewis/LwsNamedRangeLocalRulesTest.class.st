Class {
	#name : #LwsNamedRangeLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsNamedRangeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNamedRange'
]

{ #category : #running }
LwsNamedRangeLocalRulesTest >> testArgument [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a argument isNil or: [ a argument isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNamedRange.argument should be a LwsExpression' ]
]

{ #category : #running }
LwsNamedRangeLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNamedRange.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNamedRange.name should be a LwsQualifiedIdentifier' ]
]
