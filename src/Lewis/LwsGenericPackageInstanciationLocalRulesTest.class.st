Class {
	#name : #LwsGenericPackageInstanciationLocalRulesTest,
	#superclass : #LewisLocalTestCase,
	#category : #'Lewis-LwsDeclarationSchema-Tests'
}

{ #category : #platypus }
LwsGenericPackageInstanciationLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsGenericPackageInstanciation'
]

{ #category : #running }
LwsGenericPackageInstanciationLocalRulesTest >> testPackageDeclaration [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a packageDeclaration notNil ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsGenericPackageInstanciation.packageDeclaration is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a packageDeclaration isNil or: [ a packageDeclaration isKindOf: LwsCompoundName ] ] value: data)
				description:
					'Lewis.LwsDeclarationSchema.LwsGenericPackageInstanciation.packageDeclaration should be a LwsCompoundName' ]
]
