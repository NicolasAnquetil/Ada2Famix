Class {
	#name : #LwsBlockStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsBlockStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsBlockStatement'
]

{ #category : #running }
LwsBlockStatementLocalRulesTest >> testBody [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a body notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsBlockStatement.body is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a body isNil or: [ a body isKindOf: LwsBlockBody ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsBlockStatement.body should be a LwsBlockBody' ]
]

{ #category : #running }
LwsBlockStatementLocalRulesTest >> testLocals [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a locals notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsBlockStatement.locals is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a locals isNil
						or: [ (a locals isKindOf: OrderedCollection) and: [ a locals allSatisfy: [ :a5 | a5 isKindOf: LwsEntity ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsBlockStatement.locals should be a OrderedCollection and be instanciated according to ''list OF LwsEntity''' ]
]

{ #category : #running }
LwsBlockStatementLocalRulesTest >> testStamp [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a stamp isNil or: [ a stamp isKindOf: String ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsBlockStatement.stamp should be a String' ]
]
