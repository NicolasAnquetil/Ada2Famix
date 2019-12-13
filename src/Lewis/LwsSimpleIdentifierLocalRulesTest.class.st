Class {
	#name : #LwsSimpleIdentifierLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsSimpleIdentifierLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSimpleIdentifier'
]

{ #category : #running }
LwsSimpleIdentifierLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleIdentifier.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleIdentifier.name should be a String' ]
]
