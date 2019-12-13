Class {
	#name : #LwsImportClauseLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsImportClauseLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsImportClause'
]

{ #category : #running }
LwsImportClauseLocalRulesTest >> testNames [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a names notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsImportClause.names is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a names isNil
						or: [ 
							(a names isKindOf: OrderedCollection)
								and: [ 
									a names
										allSatisfy: [ :a5 | 
											{LwsCompoundName.
											LwsQualifiedIdentifier} anySatisfy: [ :el | a5 isKindOf: el ] ] ] ] ] value: data)
				description:
					'Lewis.LwsStructureSchema.LwsImportClause.names should be a OrderedCollection and be instanciated according to ''list OF LwsImportClauseName''' ]
]
