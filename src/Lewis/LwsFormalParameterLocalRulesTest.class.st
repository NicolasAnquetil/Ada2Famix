Class {
	#name : #LwsFormalParameterLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsFormalParameterLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsFormalParameter'
]

{ #category : #running }
LwsFormalParameterLocalRulesTest >> testDomainName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domainName notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFormalParameter.domainName is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a domainName isNil or: [ a domainName isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFormalParameter.domainName should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsFormalParameterLocalRulesTest >> testInitialization [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a initialization isNil or: [ a initialization isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFormalParameter.initialization should be a LwsExpression' ]
]

{ #category : #running }
LwsFormalParameterLocalRulesTest >> testMode [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a mode isNil or: [ #(#INPUTMODE #OUTPUTMODE #INPUTOUTPUTMODE #ACCESSMODE) includes: a mode asUppercase ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsFormalParameter.mode should be one of #INPUTMODE #OUTPUTMODE #INPUTOUTPUTMODE #ACCESSMODE' ]
]

{ #category : #running }
LwsFormalParameterLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFormalParameter.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a names isNil or: [ (a names isKindOf: OrderedCollection) and: [ a names allSatisfy: [ :a5 | a5 isKindOf: String ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsFormalParameter.names should be a OrderedCollection and be instanciated according to ''list OF String''' ]
]
