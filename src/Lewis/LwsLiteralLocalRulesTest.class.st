Class {
	#name : #LwsLiteralLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsLiteralLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsLiteral'
]

{ #category : #running }
LwsLiteralLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsLiteral.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsLiteral.parsedString should be a String' ]
]
