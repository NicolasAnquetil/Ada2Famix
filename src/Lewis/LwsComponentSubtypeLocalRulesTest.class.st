Class {
	#name : #LwsComponentSubtypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsComponentSubtypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsComponentSubtype'
]

{ #category : #running }
LwsComponentSubtypeLocalRulesTest >> testAliased [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a aliased notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.aliased is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a aliased isNil or: [ a aliased isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.aliased should be a Boolean' ]
]

{ #category : #running }
LwsComponentSubtypeLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.definition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition isNil or: [ a definition isKindOf: LwsSubtypeIndication ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.definition should be a LwsSubtypeIndication' ]
]

{ #category : #running }
LwsComponentSubtypeLocalRulesTest >> testIsAliased [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAliased notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.isAliased is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAliased isNil or: [ a isAliased isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentSubtype.isAliased should be a Boolean' ]
]
