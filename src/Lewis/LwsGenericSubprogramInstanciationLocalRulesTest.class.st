Class {
	#name : #LwsGenericSubprogramInstanciationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericSubprogramInstanciationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericSubprogramInstanciation'
]

{ #category : #running }
LwsGenericSubprogramInstanciationLocalRulesTest >> testSubprogramDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subprogramDeclaration notNil ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsGenericSubprogramInstanciation.subprogramDeclaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a subprogramDeclaration isNil or: [ a subprogramDeclaration isKindOf: LwsSubprogramDeclaration ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsGenericSubprogramInstanciation.subprogramDeclaration should be a LwsSubprogramDeclaration' ]
]
