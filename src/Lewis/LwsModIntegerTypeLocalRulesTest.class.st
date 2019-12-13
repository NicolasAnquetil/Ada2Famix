Class {
	#name : #LwsModIntegerTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsModIntegerTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsModIntegerType'
]

{ #category : #running }
LwsModIntegerTypeLocalRulesTest >> testModu [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a modu notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsModIntegerType.modu is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a modu isNil or: [ a modu isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsModIntegerType.modu should be a LwsExpression' ]
]
