Class {
	#name : #LwsRecordDefinitionLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRecordDefinitionLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRecordDefinition'
]

{ #category : #running }
LwsRecordDefinitionLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordDefinition.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ (a elements isKindOf: OrderedCollection) and: [ a elements allSatisfy: [ :a5 | a5 isKindOf: LwsComponentAttribute ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsRecordDefinition.elements should be a OrderedCollection and be instanciated according to ''List OF LwsComponentAttribute''' ]
]

{ #category : #running }
LwsRecordDefinitionLocalRulesTest >> testVariantPart [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a variantPart isNil or: [ a variantPart isKindOf: LwsVariantRecordPart ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordDefinition.variantPart should be a LwsVariantRecordPart' ]
]
