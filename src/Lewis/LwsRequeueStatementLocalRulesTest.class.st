Class {
	#name : #LwsRequeueStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsRequeueStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRequeueStatement'
]

{ #category : #running }
LwsRequeueStatementLocalRulesTest >> testTaskName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a taskName notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsRequeueStatement.taskName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a taskName isNil or: [ a taskName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsRequeueStatement.taskName should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsRequeueStatementLocalRulesTest >> testWithAbort [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a withAbort notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsRequeueStatement.withAbort is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a withAbort isNil or: [ a withAbort isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsRequeueStatement.withAbort should be a Boolean' ]
]
