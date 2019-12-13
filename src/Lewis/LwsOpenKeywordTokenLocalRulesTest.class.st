Class {
	#name : #LwsOpenKeywordTokenLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsOpenKeywordTokenLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsOpenKeywordToken'
]

{ #category : #running }
LwsOpenKeywordTokenLocalRulesTest >> testIsReallyOpening [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isReallyOpening notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsOpenKeywordToken.isReallyOpening is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isReallyOpening isNil or: [ a isReallyOpening isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsOpenKeywordToken.isReallyOpening should be a Boolean' ]
]
