Class {
	#name : #LwsAnyTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAnyTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAnyType'
]

{ #category : #running }
LwsAnyTypeLocalRulesTest >> testParenthesis [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parenthesis notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAnyType.parenthesis is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a parenthesis isNil or: [ a parenthesis isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsAnyType.parenthesis should be a Boolean' ]
]
