Class {
	#name : #LwsTokenListLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsTokenListLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsTokenList'
]

{ #category : #running }
LwsTokenListLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsTokenList.asString should be a String' ]
]

{ #category : #running }
LwsTokenListLocalRulesTest >> testLast [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a last isNil or: [ a last isKindOf: LwsToken ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsTokenList.last should be a LwsToken' ]
]

{ #category : #running }
LwsTokenListLocalRulesTest >> testSize [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a size isNil or: [ a size isKindOf: Number ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsTokenList.size should be a Number' ]
]

{ #category : #running }
LwsTokenListLocalRulesTest >> testTokens [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a tokens notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsTokenList.tokens is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a tokens isNil
						or: [ (a tokens isKindOf: OrderedCollection) and: [ a tokens allSatisfy: [ :a5 | a5 isKindOf: LwsToken ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsTokenList.tokens should be a OrderedCollection and be instanciated according to ''List OF LwsToken''' ]
]
