Class {
	#name : #LwsVariantRecordPartLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsVariantRecordPartLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsVariantRecordPart'
]

{ #category : #running }
LwsVariantRecordPartLocalRulesTest >> testCaseIdentifier [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a caseIdentifier notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantRecordPart.caseIdentifier is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a caseIdentifier isNil or: [ a caseIdentifier isKindOf: LwsSimpleIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantRecordPart.caseIdentifier should be a LwsSimpleIdentifier' ]
]

{ #category : #running }
LwsVariantRecordPartLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantRecordPart.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ 
							(a elements isKindOf: OrderedCollection)
								and: [ a elements allSatisfy: [ :a5 | a5 isKindOf: LwsVariantComponentAttribute ] ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsVariantRecordPart.elements should be a OrderedCollection and be instanciated according to ''List OF LwsVariantComponentAttribute''' ]
]
