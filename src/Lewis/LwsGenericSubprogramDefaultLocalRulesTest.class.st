Class {
	#name : #LwsGenericSubprogramDefaultLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsGenericDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericSubprogramDefaultLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericSubprogramDefault'
]

{ #category : #running }
LwsGenericSubprogramDefaultLocalRulesTest >> testDefault [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a default notNil ] value: data)
				description: 'Lewis.LwsGenericDeclarationSchema.LwsGenericSubprogramDefault.default is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a default isNil
						or: [ 
							{LwsQualifiedIdentifier.
							LwsAnyExpression} anySatisfy: [ :el | a default isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsGenericDeclarationSchema.LwsGenericSubprogramDefault.default should be kind of one of (LwsQualifiedIdentifier. LwsAnyExpression)' ]
]
