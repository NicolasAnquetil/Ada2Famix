Class {
	#name : #LwsExceptionHandlerLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsExceptionHandlerLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExceptionHandler'
]

{ #category : #running }
LwsExceptionHandlerLocalRulesTest >> testChoices [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a choices notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsExceptionHandler.choices is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a choices isNil
						or: [ (a choices isKindOf: OrderedCollection) and: [ a choices allSatisfy: [ :a5 | a5 isKindOf: LwsExceptionChoice ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsExceptionHandler.choices should be a OrderedCollection and be instanciated according to ''List OF LwsExceptionChoice''' ]
]

{ #category : #running }
LwsExceptionHandlerLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsExceptionHandler.name should be a String' ]
]

{ #category : #running }
LwsExceptionHandlerLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsExceptionHandler.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsExceptionHandler.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
