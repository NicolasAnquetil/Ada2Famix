Class {
	#name : #LwsPragmaTokenLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsPragmaTokenLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPragmaToken'
]

{ #category : #running }
LwsPragmaTokenLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaToken.parsedString should be a String' ]
]

{ #category : #running }
LwsPragmaTokenLocalRulesTest >> testPragma [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a pragma notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaToken.pragma is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a pragma isNil or: [ a pragma isKindOf: LwsPragma ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaToken.pragma should be a LwsPragma' ]
]

{ #category : #running }
LwsPragmaTokenLocalRulesTest >> testTokens [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a tokens notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragmaToken.tokens is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a tokens isNil
						or: [ (a tokens isKindOf: OrderedCollection) and: [ a tokens allSatisfy: [ :a5 | a5 isKindOf: LwsToken ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsPragmaToken.tokens should be a OrderedCollection and be instanciated according to ''List OF LwsToken''' ]
]
