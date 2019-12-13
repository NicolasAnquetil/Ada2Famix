Class {
	#name : #LwsGenericInstanciationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericInstanciationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericInstanciation'
]

{ #category : #running }
LwsGenericInstanciationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsGenericInstanciation.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsGenericInstanciation.name should be a LwsQualifiedIdentifier' ]
]
