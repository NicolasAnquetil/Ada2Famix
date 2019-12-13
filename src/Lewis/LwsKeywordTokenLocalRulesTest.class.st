Class {
	#name : #LwsKeywordTokenLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsKeywordTokenLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsKeywordToken'
]

{ #category : #running }
LwsKeywordTokenLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsKeywordToken.parsedString should be a String' ]
]
