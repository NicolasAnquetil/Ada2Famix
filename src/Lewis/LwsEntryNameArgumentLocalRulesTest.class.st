Class {
	#name : #LwsEntryNameArgumentLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsExpressionSchema-Tests'
}

{ #category : #platypus }
LwsEntryNameArgumentLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsEntryNameArgument'
]

{ #category : #running }
LwsEntryNameArgumentLocalRulesTest >> testArgument [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a argument notNil ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsEntryNameArgument.argument is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a argument isNil or: [ a argument isKindOf: LwsExpression ] ] value: data)
				description: 'Lewis.LwsExpressionSchema.LwsEntryNameArgument.argument should be a LwsExpression' ]
]
