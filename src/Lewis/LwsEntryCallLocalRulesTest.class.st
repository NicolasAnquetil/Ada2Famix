Class {
	#name : #LwsEntryCallLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsEntryCallLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryCall'
]

{ #category : #running }
LwsEntryCallLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsEntryCall.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsEntryCall.name should be a LwsQualifiedIdentifier' ]
]
