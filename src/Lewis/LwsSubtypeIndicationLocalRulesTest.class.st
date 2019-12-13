Class {
	#name : #LwsSubtypeIndicationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsSubtypeIndicationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsSubtypeIndication'
]

{ #category : #running }
LwsSubtypeIndicationLocalRulesTest >> testConstraint [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a constraint isNil or: [ a constraint isKindOf: LwsConstraint ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeIndication.constraint should be a LwsConstraint' ]
]

{ #category : #running }
LwsSubtypeIndicationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeIndication.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsSubtypeIndication.name should be a LwsQualifiedIdentifier' ]
]
