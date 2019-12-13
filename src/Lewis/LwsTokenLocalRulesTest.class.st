Class {
	#name : #LwsTokenLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsTokenLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsToken'
]

{ #category : #running }
LwsTokenLocalRulesTest >> testBlankString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blankString isNil or: [ a blankString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.blankString should be a String' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testBlanks [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a blanks notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.blanks is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a blanks isNil
						or: [ (a blanks isKindOf: OrderedCollection) and: [ a blanks allSatisfy: [ :a5 | a5 isKindOf: LwsBlankToken ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsToken.blanks should be a OrderedCollection and be instanciated according to ''List OF LwsBlankToken''' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testCommentString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a commentString isNil or: [ a commentString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.commentString should be a String' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testId [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a id notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.id is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a id isNil or: [ (a id isKindOf: Array) and: [ a id allSatisfy: [ :a5 | a5 isKindOf: Number ] ] ] ] value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsToken.id should be a Array and be instanciated according to ''Array OF Integer''' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testLevel [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a level isNil or: [ a level isKindOf: Number ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.level should be a Number' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testNext [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a next isNil or: [ a next isKindOf: LwsToken ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.next should be a LwsToken' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.parsedString should be a String' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testPrev [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a prev isNil or: [ a prev isKindOf: LwsToken ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.prev should be a LwsToken' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testStart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a start notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.start is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a start isNil or: [ a start isKindOf: Number ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.start should be a Number' ]
]

{ #category : #running }
LwsTokenLocalRulesTest >> testValue [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a value notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.value is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a value isNil or: [ a value isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsToken.value should be a String' ]
]
