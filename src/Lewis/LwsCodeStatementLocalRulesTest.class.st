Class {
	#name : #LwsCodeStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsCodeStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCodeStatement'
]

{ #category : #running }
LwsCodeStatementLocalRulesTest >> testCode [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a code notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCodeStatement.code is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a code isNil or: [ a code isKindOf: LwsPrimaryQualifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsCodeStatement.code should be a LwsPrimaryQualifier' ]
]
