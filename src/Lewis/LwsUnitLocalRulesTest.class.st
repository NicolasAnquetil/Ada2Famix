Class {
	#name : #LwsUnitLocalRulesTest,
	#superclass : #Object,
	#category : #'Lewis-LwsStructureSchema-Tests'
}

{ #category : #platypus }
LwsUnitLocalRulesTest class >> entityName [
	<generatedByPlatypus>
	^ 'LwsUnit'
]

{ #category : #running }
LwsUnitLocalRulesTest >> testElement [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a element notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.element is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a element isNil
						or: [ 
							{LwsPackageDeclaration.
							LwsPackageBody.
							LwsSubprogramDeclaration.
							LwsSubprogramBody.
							LwsGenericDeclaration.
							LwsSeparateBody.
							LwsGenericInstanciation.
							LwsUnitRenamingDeclaration} anySatisfy: [ :el | a element isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUnit.element should be kind of one of (LwsPackageDeclaration. LwsPackageBody. LwsSubprogramDeclaration. LwsSubprogramBody. LwsGenericDeclaration. LwsSeparateBody. LwsGenericInstanciation. LwsUnitRenamingDeclaration)' ]
]

{ #category : #running }
LwsUnitLocalRulesTest >> testElements [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a elements notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.elements is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a elements isNil
						or: [ 
							{LwsPackageDeclaration.
							LwsPackageBody.
							LwsSubprogramDeclaration.
							LwsSubprogramBody.
							LwsGenericDeclaration.
							LwsSeparateBody.
							LwsGenericInstanciation.
							LwsUnitRenamingDeclaration} anySatisfy: [ :el | a elements isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUnit.elements should be kind of one of (LwsPackageDeclaration. LwsPackageBody. LwsSubprogramDeclaration. LwsSubprogramBody. LwsGenericDeclaration. LwsSeparateBody. LwsGenericInstanciation. LwsUnitRenamingDeclaration)' ]
]

{ #category : #running }
LwsUnitLocalRulesTest >> testInterfaces [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a interfaces notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.interfaces is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a interfaces isNil
						or: [ (a interfaces isKindOf: OrderedCollection) and: [ a interfaces allSatisfy: [ :a5 | a5 isKindOf: LwsUnitInterface ] ] ] ]
						value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUnit.interfaces should be a OrderedCollection and be instanciated according to ''List OF LwsUnitInterface''' ]
]

{ #category : #running }
LwsUnitLocalRulesTest >> testIsPrivate [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isPrivate notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.isPrivate is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a isPrivate isNil or: [ a isPrivate isKindOf: Boolean ] ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.isPrivate should be a Boolean' ]
]

{ #category : #running }
LwsUnitLocalRulesTest >> testUnitElement [
	<generatedByPlatypus>
	self
		localTestBlock: [ :data | 
			self
				assert: ([ :a | a unitElement notNil ] value: data)
				description: 'Lewis.LwsStructureSchema.LwsUnit.unitElement is nil whereas it is mandatory.' ].
	self
		localTestBlock: [ :data | 
			self
				assert:
					([ :a | 
					a unitElement isNil
						or: [ 
							{LwsPackageDeclaration.
							LwsPackageBody.
							LwsSubprogramDeclaration.
							LwsSubprogramBody.
							LwsGenericDeclaration.
							LwsSeparateBody.
							LwsGenericInstanciation.
							LwsUnitRenamingDeclaration} anySatisfy: [ :el | a unitElement isKindOf: el ] ] ] value: data)
				description:
					'Lewis.LwsStructureSchema.LwsUnit.unitElement should be kind of one of (LwsPackageDeclaration. LwsPackageBody. LwsSubprogramDeclaration. LwsSubprogramBody. LwsGenericDeclaration. LwsSeparateBody. LwsGenericInstanciation. LwsUnitRenamingDeclaration)' ]
]
