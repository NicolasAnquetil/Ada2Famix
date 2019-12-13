Class {
	#name : #LwsIndexLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsIndexLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsIndex'
]

{ #category : #running }
LwsIndexLocalRulesTest >> testTypeMark [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a typeMark notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsIndex.typeMark is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a typeMark isNil or: [ a typeMark isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsIndex.typeMark should be a LwsQualifiedIdentifier' ]
]
