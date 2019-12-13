Class {
	#name : #LwsAbortStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsAbortStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAbortStatement'
]

{ #category : #running }
LwsAbortStatementLocalRulesTest >> testTaskNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a taskNames isNil
						or: [ (a taskNames isKindOf: OrderedCollection) and: [ a taskNames allSatisfy: [ :a5 | a5 isKindOf: LwsQualifiedIdentifier ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAbortStatement.taskNames should be a OrderedCollection and be instanciated according to ''List OF LwsQualifiedIdentifier''' ]
]
