Class {
	#name : #LwsAddressRepresentationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAddressRepresentationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAddressRepresentation'
]

{ #category : #running }
LwsAddressRepresentationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAddressRepresentation.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAddressRepresentation.name should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsAddressRepresentationLocalRulesTest >> testUseAt [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a useAt notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAddressRepresentation.useAt is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a useAt isNil or: [ a useAt isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAddressRepresentation.useAt should be a LwsExpression' ]
]
