Class {
	#name : #LwsAssignmentLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsAssignmentLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAssignment'
]

{ #category : #running }
LwsAssignmentLocalRulesTest >> testExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAssignment.expression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a expression isNil or: [ a expression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAssignment.expression should be a LwsExpression' ]
]

{ #category : #running }
LwsAssignmentLocalRulesTest >> testVariableName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a variableName notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAssignment.variableName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a variableName isNil or: [ a variableName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAssignment.variableName should be a LwsQualifiedIdentifier' ]
]
