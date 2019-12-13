Class {
	#name : #LwsRecordTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsRecordTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsRecordType'
]

{ #category : #running }
LwsRecordTypeLocalRulesTest >> testIsAbstract [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isAbstract is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isAbstract isNil or: [ a isAbstract isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isAbstract should be a Boolean' ]
]

{ #category : #running }
LwsRecordTypeLocalRulesTest >> testIsLimited [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isLimited notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isLimited is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isLimited isNil or: [ a isLimited isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isLimited should be a Boolean' ]
]

{ #category : #running }
LwsRecordTypeLocalRulesTest >> testIsTagged [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isTagged notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isTagged is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isTagged isNil or: [ a isTagged isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsRecordType.isTagged should be a Boolean' ]
]
