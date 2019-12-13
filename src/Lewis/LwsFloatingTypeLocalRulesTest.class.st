Class {
	#name : #LwsFloatingTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsFloatingTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsFloatingType'
]

{ #category : #running }
LwsFloatingTypeLocalRulesTest >> testDigits [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a digits notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFloatingType.digits is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a digits isNil or: [ a digits isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFloatingType.digits should be a LwsExpression' ]
]
