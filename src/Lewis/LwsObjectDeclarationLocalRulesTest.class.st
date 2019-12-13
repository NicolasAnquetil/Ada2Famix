Class {
	#name : #LwsObjectDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsObjectDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsObjectDeclaration'
]

{ #category : #running }
LwsObjectDeclarationLocalRulesTest >> testDefinition [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a definition notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.definition is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a definition isNil
						or: [ 
							{LwsArrayType.
							LwsSubtypeIndication} anySatisfy: [ :el | a definition isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.definition should be kind of one of (LwsArrayType. LwsSubtypeIndication)' ]
]

{ #category : #running }
LwsObjectDeclarationLocalRulesTest >> testInitialization [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization isNil or: [ a initialization isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.initialization should be a LwsExpression' ]
]

{ #category : #running }
LwsObjectDeclarationLocalRulesTest >> testIsAliased [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAliased notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.isAliased is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAliased isNil or: [ a isAliased isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.isAliased should be a Boolean' ]
]

{ #category : #running }
LwsObjectDeclarationLocalRulesTest >> testIsConstant [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isConstant notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.isConstant is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isConstant isNil or: [ a isConstant isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.isConstant should be a Boolean' ]
]

{ #category : #running }
LwsObjectDeclarationLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsObjectDeclaration.names should be a OrderedCollection and be instanciated according to ''List OF String''' ]
]
