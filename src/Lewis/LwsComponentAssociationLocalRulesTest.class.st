Class {
	#name : #LwsComponentAssociationLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsComponentAssociationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsComponentAssociation'
]

{ #category : #running }
LwsComponentAssociationLocalRulesTest >> testChoices [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a choices notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsComponentAssociation.choices is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a choices isNil
						or: [ (a choices isKindOf: OrderedCollection) and: [ a choices allSatisfy: [ :a5 | a5 isKindOf: LwsChoice ] ] ] ]
						value: data)
				description:
					'Lewis.LwsExpressionSchema.LwsComponentAssociation.choices should be a OrderedCollection and be instanciated according to ''list OF LwsChoice''' ]
]

{ #category : #running }
LwsComponentAssociationLocalRulesTest >> testExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsComponentAssociation.expression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression isNil or: [ a expression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsComponentAssociation.expression should be a LwsExpression' ]
]
