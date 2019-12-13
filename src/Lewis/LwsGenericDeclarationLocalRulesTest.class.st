Class {
	#name : #LwsGenericDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericDeclaration'
]

{ #category : #running }
LwsGenericDeclarationLocalRulesTest >> testDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a declaration notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericDeclaration.declaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a declaration isNil
						or: [ 
							{LwsPackageDeclaration.
							LwsSubprogramDeclaration} anySatisfy: [ :el | a declaration isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericDeclaration.declaration should be kind of one of (LwsPackageDeclaration. LwsSubprogramDeclaration)' ]
]

{ #category : #running }
LwsGenericDeclarationLocalRulesTest >> testFormalPart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a formalPart notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericDeclaration.formalPart is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a formalPart isNil
						or: [ 
							(a formalPart isKindOf: OrderedCollection)
								and: [ a formalPart allSatisfy: [ :a5 | a5 isKindOf: LwsGenericFormalElement ] ] ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericDeclaration.formalPart should be a OrderedCollection and be instanciated according to ''List OF LwsGenericFormalElement''' ]
]
