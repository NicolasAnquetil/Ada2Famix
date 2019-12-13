Class {
	#name : #LwsAccessToSubprogramLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAccessToSubprogramLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAccessToSubprogram'
]

{ #category : #running }
LwsAccessToSubprogramLocalRulesTest >> testParameters [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parameters notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAccessToSubprogram.parameters is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a parameters isNil
						or: [ (a parameters isKindOf: OrderedCollection) and: [ a parameters allSatisfy: [ :a5 | a5 isKindOf: LwsFormalParameter ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsAccessToSubprogram.parameters should be a OrderedCollection and be instanciated according to ''List OF LwsFormalParameter''' ]
]

{ #category : #running }
LwsAccessToSubprogramLocalRulesTest >> testReturnType [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a returnType isNil or: [ a returnType isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAccessToSubprogram.returnType should be a LwsQualifiedIdentifier' ]
]
