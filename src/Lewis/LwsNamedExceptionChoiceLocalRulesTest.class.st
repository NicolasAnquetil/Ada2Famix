Class {
	#name : #LwsNamedExceptionChoiceLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsNamedExceptionChoiceLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNamedExceptionChoice'
]

{ #category : #running }
LwsNamedExceptionChoiceLocalRulesTest >> testIdentifier [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a identifier notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsNamedExceptionChoice.identifier is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a identifier isNil or: [ a identifier isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsNamedExceptionChoice.identifier should be a LwsQualifiedIdentifier' ]
]
