Class {
	#name : #LwsDefinedRecordTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsDefinedRecordTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDefinedRecordType'
]

{ #category : #running }
LwsDefinedRecordTypeLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDefinedRecordType.definition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition isNil or: [ a definition isKindOf: LwsRecordDefinition ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDefinedRecordType.definition should be a LwsRecordDefinition' ]
]
