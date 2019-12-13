Class {
	#name : #LwsVariantComponentAttributeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsVariantComponentAttributeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsVariantComponentAttribute'
]

{ #category : #running }
LwsVariantComponentAttributeLocalRulesTest >> testChoices [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a choices notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantComponentAttribute.choices is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a choices isNil
						or: [ (a choices isKindOf: OrderedCollection) and: [ a choices allSatisfy: [ :a5 | a5 isKindOf: LwsChoice ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsVariantComponentAttribute.choices should be a OrderedCollection and be instanciated according to ''List OF LwsChoice''' ]
]

{ #category : #running }
LwsVariantComponentAttributeLocalRulesTest >> testRecord [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a record notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantComponentAttribute.record is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a record isNil or: [ a record isKindOf: LwsRecordDefinition ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsVariantComponentAttribute.record should be a LwsRecordDefinition' ]
]
