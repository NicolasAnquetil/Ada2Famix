Class {
	#name : #LwsNumberDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsNumberDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsNumberDeclaration'
]

{ #category : #running }
LwsNumberDeclarationLocalRulesTest >> testInitialization [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsNumberDeclaration.initialization is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization isNil or: [ a initialization isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsNumberDeclaration.initialization should be a LwsExpression' ]
]

{ #category : #running }
LwsNumberDeclarationLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsNumberDeclaration.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsNumberDeclaration.names should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
