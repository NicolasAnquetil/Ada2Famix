Class {
	#name : #LwsSimpleNameSelectorLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsSimpleNameSelectorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSimpleNameSelector'
]

{ #category : #running }
LwsSimpleNameSelectorLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleNameSelector.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsSimpleNameSelector.parsedString should be a String' ]
]
