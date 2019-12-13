Class {
	#name : #LwsRecordTypeRepresentationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRecordTypeRepresentationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRecordTypeRepresentation'
]

{ #category : #running }
LwsRecordTypeRepresentationLocalRulesTest >> testAlign [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a align isNil or: [ a align isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordTypeRepresentation.align should be a LwsExpression' ]
]

{ #category : #running }
LwsRecordTypeRepresentationLocalRulesTest >> testLocations [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a locations notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordTypeRepresentation.locations is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a locations isNil
						or: [ (a locations isKindOf: OrderedCollection) and: [ a locations allSatisfy: [ :a5 | a5 isKindOf: LwsComponentLocation ] ] ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsRecordTypeRepresentation.locations should be a OrderedCollection and be instanciated according to ''List OF LwsComponentLocation''' ]
]

{ #category : #running }
LwsRecordTypeRepresentationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordTypeRepresentation.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name isNil or: [ a name isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordTypeRepresentation.name should be a LwsQualifiedIdentifier' ]
]
