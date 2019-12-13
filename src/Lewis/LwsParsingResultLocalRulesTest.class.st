Class {
	#name : #LwsParsingResultLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsParsingResultLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsParsingResult'
]

{ #category : #running }
LwsParsingResultLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsParsingResult.asString should be a String' ]
]

{ #category : #running }
LwsParsingResultLocalRulesTest >> testEntities [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entities notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsParsingResult.entities is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a entities isNil
						or: [ (a entities isKindOf: OrderedCollection) and: [ a entities allSatisfy: [ :a5 | a5 isKindOf: LwsEntity ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsParsingResult.entities should be a OrderedCollection and be instanciated according to ''List OF LwsEntity''' ]
]

{ #category : #running }
LwsParsingResultLocalRulesTest >> testSource [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a source isNil or: [ a source isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsParsingResult.source should be a String' ]
]

{ #category : #running }
LwsParsingResultLocalRulesTest >> testTokenList [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a tokenList notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsParsingResult.tokenList is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a tokenList isNil or: [ a tokenList isKindOf: LwsTokenList ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsParsingResult.tokenList should be a LwsTokenList' ]
]

{ #category : #running }
LwsParsingResultLocalRulesTest >> testTokens [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a tokens isNil
						or: [ (a tokens isKindOf: OrderedCollection) and: [ a tokens allSatisfy: [ :a5 | a5 isKindOf: LwsToken ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsParsingResult.tokens should be a OrderedCollection and be instanciated according to ''List OF LwsToken''' ]
]
