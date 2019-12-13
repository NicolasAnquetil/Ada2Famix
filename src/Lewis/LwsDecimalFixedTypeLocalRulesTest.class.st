Class {
	#name : #LwsDecimalFixedTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsDecimalFixedTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsDecimalFixedType'
]

{ #category : #running }
LwsDecimalFixedTypeLocalRulesTest >> testDigits [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a digits notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDecimalFixedType.digits is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a digits isNil or: [ a digits isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsDecimalFixedType.digits should be a LwsExpression' ]
]
