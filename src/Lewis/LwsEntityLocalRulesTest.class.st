Class {
	#name : #LwsEntityLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsEntityLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntity'
]

{ #category : #running }
LwsEntityLocalRulesTest >> testContext [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a context isNil or: [ a context isKindOf: LwsEntity ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsEntity.context should be a LwsEntity' ]
]
