Class {
	#name : #LwsCharacterSelectorLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsCharacterSelectorLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCharacterSelector'
]

{ #category : #running }
LwsCharacterSelectorLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsCharacterSelector.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsCharacterSelector.parsedString should be a String' ]
]
