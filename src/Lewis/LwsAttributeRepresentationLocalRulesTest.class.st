Class {
	#name : #LwsAttributeRepresentationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAttributeRepresentationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAttributeRepresentation'
]

{ #category : #running }
LwsAttributeRepresentationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAttributeRepresentation.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAttributeRepresentation.name should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsAttributeRepresentationLocalRulesTest >> testUseExpression [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a useExpression notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAttributeRepresentation.useExpression is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a useExpression isNil or: [ a useExpression isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAttributeRepresentation.useExpression should be a LwsExpression' ]
]
