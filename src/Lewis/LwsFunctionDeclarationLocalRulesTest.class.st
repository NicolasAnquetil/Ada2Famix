Class {
	#name : #LwsFunctionDeclarationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsFunctionDeclarationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsFunctionDeclaration'
]

{ #category : #running }
LwsFunctionDeclarationLocalRulesTest >> testName [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a name notNil ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFunctionDeclaration.name is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a name isNil
						or: [ 
							{LwsStringDesignator.
							LwsCompoundName} anySatisfy: [ :el | a name isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsFunctionDeclaration.name should be kind of one of (LwsStringDesignator. LwsCompoundName)' ]
]

{ #category : #running }
LwsFunctionDeclarationLocalRulesTest >> testNameRule [
	<generatedByPlatypus>
	self localTestBlock: [ :a | self assert: a nameRule ]
]

{ #category : #running }
LwsFunctionDeclarationLocalRulesTest >> testReturnType [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a returnType isNil or: [ a returnType isKindOf: LwsQualifiedIdentifier ] ] value: data)
				description: 'Lewis.LwsDeclarationSchema.LwsFunctionDeclaration.returnType should be a LwsQualifiedIdentifier' ]
]
