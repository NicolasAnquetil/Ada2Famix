Class {
	#name : #LwsQualifiedIdentifierLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsQualifiedIdentifierLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsQualifiedIdentifier'
]

{ #category : #running }
LwsQualifiedIdentifierLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsQualifiedIdentifier.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsQualifiedIdentifier.name should be a String' ]
]

{ #category : #running }
LwsQualifiedIdentifierLocalRulesTest >> testQualifiers [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a qualifiers notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsQualifiedIdentifier.qualifiers is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a qualifiers isNil
						or: [ (a qualifiers isKindOf: OrderedCollection) and: [ a qualifiers allSatisfy: [ :a5 | a5 isKindOf: LwsQualifier ] ] ] ]
						value: data)
				description:
					'Lewis.LwsExpressionSchema.LwsQualifiedIdentifier.qualifiers should be a OrderedCollection and be instanciated according to ''List OF LwsQualifier''' ]
]
