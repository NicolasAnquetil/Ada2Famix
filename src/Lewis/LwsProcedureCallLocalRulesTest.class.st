Class {
	#name : #LwsProcedureCallLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsProcedureCallLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsProcedureCall'
]

{ #category : #running }
LwsProcedureCallLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsProcedureCall.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsProcedureCall.name should be a LwsQualifiedIdentifier' ]
]
