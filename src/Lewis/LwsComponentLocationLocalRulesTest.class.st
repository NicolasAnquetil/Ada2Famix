Class {
	#name : #LwsComponentLocationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsComponentLocationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsComponentLocation'
]

{ #category : #running }
LwsComponentLocationLocalRulesTest >> testAt [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a at notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.at is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a at isNil or: [ a at isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.at should be a LwsExpression' ]
]

{ #category : #running }
LwsComponentLocationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.name should be a LwsQualifiedIdentifier' ]
]

{ #category : #running }
LwsComponentLocationLocalRulesTest >> testRange [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.range is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a range isNil or: [ a range isKindOf: LwsRange ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsComponentLocation.range should be a LwsRange' ]
]
