Class {
	#name : #LwsStringEnumerationIdLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsStringEnumerationIdLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsStringEnumerationId'
]

{ #category : #running }
LwsStringEnumerationIdLocalRulesTest >> testElement [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a element notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsStringEnumerationId.element is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a element isNil or: [ a element isKindOf: String ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsStringEnumerationId.element should be a String' ]
]
