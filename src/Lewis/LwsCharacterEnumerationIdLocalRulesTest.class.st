Class {
	#name : #LwsCharacterEnumerationIdLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsCharacterEnumerationIdLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsCharacterEnumerationId'
]

{ #category : #running }
LwsCharacterEnumerationIdLocalRulesTest >> testElement [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a element notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsCharacterEnumerationId.element is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a element isNil or: [ a element isKindOf: Character ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsCharacterEnumerationId.element should be a Character' ]
]
