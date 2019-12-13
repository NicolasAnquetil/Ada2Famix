Class {
	#name : #LwsSeparatorTokenLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsSeparatorTokenLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSeparatorToken'
]

{ #category : #running }
LwsSeparatorTokenLocalRulesTest >> testSeparator [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a separator isNil or: [ a separator isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsSeparatorToken.separator should be a String' ]
]
