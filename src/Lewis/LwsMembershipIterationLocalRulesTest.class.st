Class {
	#name : #LwsMembershipIterationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsMembershipIterationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsMembershipIteration'
]

{ #category : #running }
LwsMembershipIterationLocalRulesTest >> testIdentifier [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a identifier notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.identifier is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a identifier isNil or: [ a identifier isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.identifier should be a String' ]
]

{ #category : #running }
LwsMembershipIterationLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.range should be a LwsRange' ]
]

{ #category : #running }
LwsMembershipIterationLocalRulesTest >> testReverse [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a reverse notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.reverse is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a reverse isNil or: [ a reverse isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsMembershipIteration.reverse should be a Boolean' ]
]
