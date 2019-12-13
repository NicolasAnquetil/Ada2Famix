Class {
	#name : #LwsBlockBodyLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsDeclarationBodySchema-Tests'
}

{ #category : #platypus }
LwsBlockBodyLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsBlockBody'
]

{ #category : #running }
LwsBlockBodyLocalRulesTest >> testHandlers [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a handlers notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsBlockBody.handlers is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a handlers isNil
						or: [ (a handlers isKindOf: OrderedCollection) and: [ a handlers allSatisfy: [ :a5 | a5 isKindOf: LwsExceptionHandler ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsBlockBody.handlers should be a OrderedCollection and be instanciated according to ''List OF LwsExceptionHandler''' ]
]

{ #category : #running }
LwsBlockBodyLocalRulesTest >> testStatements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a statements notNil ] value: data)
				description: 'Lewis.LwsDeclarationBodySchema.LwsBlockBody.statements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a statements isNil
						or: [ (a statements isKindOf: OrderedCollection) and: [ a statements allSatisfy: [ :a5 | a5 isKindOf: LwsStatement ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationBodySchema.LwsBlockBody.statements should be a OrderedCollection and be instanciated according to ''List OF LwsStatement''' ]
]
