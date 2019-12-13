Class {
	#name : #LwsCompoundNameLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsCompoundNameLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCompoundName'
]

{ #category : #running }
LwsCompoundNameLocalRulesTest >> testAsString [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a asString isNil or: [ a asString isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsCompoundName.asString should be a String' ]
]

{ #category : #running }
LwsCompoundNameLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsCompoundName.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ (a elements isKindOf: OrderedCollection) and: [ a elements allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsCompoundName.elements should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]

{ #category : #running }
LwsCompoundNameLocalRulesTest >> testMustHaveAtLeastOneElement [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a mustHaveAtLeastOneElement ]
]

{ #category : #running }
LwsCompoundNameLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsCompoundName.name should be a String' ]
]

{ #category : #running }
LwsCompoundNameLocalRulesTest >> testSuffixes [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a suffixes isNil
						or: [ (a suffixes isKindOf: OrderedCollection) and: [ a suffixes allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsCompoundName.suffixes should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
