Class {
	#name : #LwsAcceptStatementLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsStatementSchema-Tests'
}

{ #category : #platypus }
LwsAcceptStatementLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAcceptStatement'
]

{ #category : #running }
LwsAcceptStatementLocalRulesTest >> testEntryName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entryName notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptStatement.entryName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a entryName isNil or: [ a entryName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptStatement.entryName should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsAcceptStatementLocalRulesTest >> testHandlers [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a handlers notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptStatement.handlers is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a handlers isNil
						or: [ (a handlers isKindOf: OrderedCollection) and: [ a handlers allSatisfy: [ :a5 | a5 isKindOf: LwsExceptionHandler ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAcceptStatement.handlers should be a OrderedCollection and be instanciated according to ''List OF LwsExceptionHandler''' ]
]

{ #category : #running }
LwsAcceptStatementLocalRulesTest >> testParameters [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parameters notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptStatement.parameters is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a parameters isNil
						or: [ (a parameters isKindOf: OrderedCollection) and: [ a parameters allSatisfy: [ :a5 | a5 isKindOf: LwsFormalParameter ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAcceptStatement.parameters should be a OrderedCollection and be instanciated according to ''List OF LwsFormalParameter''' ]
]

{ #category : #running }
LwsAcceptStatementLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsStatementSchema.LwsAcceptStatement.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStatementSchema.LwsAcceptStatement.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
