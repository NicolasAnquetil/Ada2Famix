Class {
	#name : #LwsValueLiteralLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsValueLiteralLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsValueLiteral'
]

{ #category : #running }
LwsValueLiteralLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsValueLiteral.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsValueLiteral.parsedString should be a String' ]
]
