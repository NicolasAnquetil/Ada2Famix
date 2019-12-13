Class {
	#name : #LwsPragmaArgumentLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsPragmaArgumentLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPragmaArgument'
]

{ #category : #running }
LwsPragmaArgumentLocalRulesTest >> testArgumentValue [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a argumentValue notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaArgument.argumentValue is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a argumentValue isNil or: [ a argumentValue isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaArgument.argumentValue should be a LwsExpression' ]
]

{ #category : #running }
LwsPragmaArgumentLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaArgument.name should be a String' ]
]
