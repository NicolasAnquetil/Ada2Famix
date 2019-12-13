Class {
	#name : #LwsAccessTypeLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsAccessTypeLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsAccessType'
]

{ #category : #running }
LwsAccessTypeLocalRulesTest >> testAccessMode [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | a accessMode isNil or: [ #(#CONSTANTACCESSMODE #ALLACCESSMODE #PROTECTEDACCESSMODE) includes: a accessMode asUppercase ] ]
						value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsAccessType.accessMode should be one of #CONSTANTACCESSMODE #ALLACCESSMODE #PROTECTEDACCESSMODE' ]
]
