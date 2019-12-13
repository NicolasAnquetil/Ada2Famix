Class {
	#name : #LwsPragmaLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsParsingResultSchema-Tests'
}

{ #category : #platypus }
LwsPragmaLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsPragma'
]

{ #category : #running }
LwsPragmaLocalRulesTest >> testArguments [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a arguments notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragma.arguments is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a arguments isNil
						or: [ (a arguments isKindOf: OrderedCollection) and: [ a arguments allSatisfy: [ :a5 | a5 isKindOf: LwsPragmaArgument ] ] ] ]
						value: data)
				description:
					'Lewis.LwsParsingResultSchema.LwsPragma.arguments should be a OrderedCollection and be instanciated according to ''List OF LwsPragmaArgument''' ]
]

{ #category : #running }
LwsPragmaLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragma.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsParsingResultSchema.LwsPragma.name should be a String' ]
]
