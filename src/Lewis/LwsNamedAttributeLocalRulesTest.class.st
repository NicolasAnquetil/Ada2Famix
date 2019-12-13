Class {
	#name : #LwsNamedAttributeLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsNamedAttributeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNamedAttribute'
]

{ #category : #running }
LwsNamedAttributeLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNamedAttribute.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsNamedAttribute.parsedString should be a String' ]
]
