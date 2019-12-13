Class {
	#name : #LwsExceptionDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsExceptionDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsExceptionDeclaration'
]

{ #category : #running }
LwsExceptionDeclarationLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsExceptionDeclaration.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsExceptionDeclaration.names should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
