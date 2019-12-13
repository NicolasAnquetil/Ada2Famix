Class {
	#name : #LwsDerivedTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsDerivedTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDerivedType'
]

{ #category : #running }
LwsDerivedTypeLocalRulesTest >> testIsAbstract [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDerivedType.isAbstract is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract isNil or: [ a isAbstract isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDerivedType.isAbstract should be a Boolean' ]
]

{ #category : #running }
LwsDerivedTypeLocalRulesTest >> testSubtypeIndication [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDerivedType.subtypeIndication is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a subtypeIndication isNil or: [ a subtypeIndication isKindOf: LwsSubtypeIndication ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDerivedType.subtypeIndication should be a LwsSubtypeIndication' ]
]

{ #category : #running }
LwsDerivedTypeLocalRulesTest >> testWithRecord [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a withRecord isNil or: [ a withRecord isKindOf: LwsRecordType ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDerivedType.withRecord should be a LwsRecordType' ]
]
