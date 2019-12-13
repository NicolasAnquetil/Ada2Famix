Class {
	#name : #LwsCommentLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsCommentLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsComment'
]

{ #category : #running }
LwsCommentLocalRulesTest >> testContent [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a content notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsComment.content is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a content isNil or: [ a content isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsComment.content should be a String' ]
]

{ #category : #running }
LwsCommentLocalRulesTest >> testHaveSomethingBefore [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a haveSomethingBefore notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsComment.haveSomethingBefore is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a haveSomethingBefore isNil or: [ a haveSomethingBefore isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsComment.haveSomethingBefore should be a Boolean' ]
]

{ #category : #running }
LwsCommentLocalRulesTest >> testParsedString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsComment.parsedString is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parsedString isNil or: [ a parsedString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsComment.parsedString should be a String' ]
]
