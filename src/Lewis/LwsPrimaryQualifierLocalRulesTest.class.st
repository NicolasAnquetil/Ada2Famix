Class {
	#name : #LwsPrimaryQualifierLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsPrimaryQualifierLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPrimaryQualifier'
]

{ #category : #running }
LwsPrimaryQualifierLocalRulesTest >> testPrimary [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a primary notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsPrimaryQualifier.primary is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a primary isNil or: [ a primary isKindOf: LwsUnaryExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsPrimaryQualifier.primary should be a LwsUnaryExpression' ]
]
