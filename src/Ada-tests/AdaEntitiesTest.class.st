Class {
	#name : #AdaEntitiesTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
AdaEntitiesTest >> createADAEntity: aClass named: aName [

	^ model add: (aClass new name: aName ; yourself).
]

{ #category : #running }
AdaEntitiesTest >> createAccessFrom: anEntity to: aVariable [
	^ model
		add:
			(FAMIXAccess new
				accessor: anEntity;
				variable: aVariable;
				yourself)
]

{ #category : #running }
AdaEntitiesTest >> setUp [
	model := ADAModel new
]

{ #category : #tests }
AdaEntitiesTest >> testADAAccess [
	| pckg var acc |
	pckg := self createADAEntity: ADAPackage named: 'pckg'.
	var := self createADAEntity: ADAStructuralEntity named: 'var'.
	var container: pckg.
	
	acc := self createAccessFrom: pckg to: var.
	
	self assert: (acc isReadAccessWithin: pckg).  "unknown access is assumed read"
	acc isWrite: false.
	self assert: (acc isReadAccessWithin: pckg).
	acc isWrite: true.
	self deny: (acc isReadAccessWithin: pckg).
]

{ #category : #tests }
AdaEntitiesTest >> testADAAccessIndirectWithin [
	| pckg1 pckg2 proc var acc |
	pckg1 := self createADAEntity: ADAPackage named: 'pckg'.
	pckg2 := self createADAEntity: ADAPackage named: 'inner'.
	pckg2 container: pckg1.
	proc := self createADAEntity: ADASubprogram named: 'proc'.
	proc container: pckg2.
	var := self createADAEntity: ADAStructuralEntity named: 'var'.

	acc := self createAccessFrom: proc to: var.

	var container: pckg1.
	self assert: (acc isReadAccessWithin: pckg1).
	self deny: (acc isReadAccessWithin: pckg2).
	var container: pckg2.
	self assert: (acc isReadAccessWithin: pckg1).
	var container: proc.
	self assert: (acc isReadAccessWithin: pckg1).

]

{ #category : #tests }
AdaEntitiesTest >> testDataSentToMultiple [
	| pckg proc var1 var2 acc1 acc2 |
	pckg := model add: (self createADAEntity: ADAPackage named: 'pckg').
	proc := model add: (self createADAEntity: ADASubprogram named: 'proc').
	proc container: pckg.
	var1 := model add: (self createADAEntity: ADAStructuralEntity named: 'var1').
	var1 container: pckg.
	var2 := model add: (self createADAEntity: ADAStructuralEntity named: 'var2').
	var2 container: pckg.

	acc1 := self createAccessFrom: pckg to: var1.
	acc1 isWrite: false.
	acc2 := self createAccessFrom: proc to: var2.
	acc2 isWrite: false.

	self assert: (proc dataReceivedFrom: pckg) size equals: 1.
	self assert: (proc dataReceivedFrom: pckg) anyOne equals: var2.

	self assert: (pckg dataReceivedFrom: pckg) size equals: 2.
	self assert: ((pckg dataReceivedFrom: pckg) includes: var1).
	self assert: ((pckg dataReceivedFrom: pckg) includes: var2).

]

{ #category : #tests }
AdaEntitiesTest >> testDataSentToSimple [
	| pckg proc var1 var2 accR accW |
	pckg := self createADAEntity: ADAPackage named: 'pckg'.
	proc := self createADAEntity: ADASubprogram named: 'proc'.
	proc container: pckg.
	var1 := self createADAEntity: ADAStructuralEntity named: 'varR'.
	var1 container: pckg.
	var2 := self createADAEntity: ADAStructuralEntity named: 'varW'.
	var2 container: pckg.

	accR := self createAccessFrom: proc to: var1.
	accR isWrite: false.
	accW := self createAccessFrom: proc to: var2.
	accW isWrite: true.

	self assert: (proc dataReceivedFrom: pckg) size equals: 1.
	self assert: (proc dataReceivedFrom: pckg) anyOne equals: var1.

	"self assert: (proc dataSentTo: pckg) size equals: 1.
	self assert: (proc dataSentTo: pckg) anyOne equals: var2."

]

{ #category : #tests }
AdaEntitiesTest >> testInvocationArguments [
	| invok arg1 arg2 |
	invok := FAMIXInvocation new.
	arg1 := ADAArgument new.
	arg2 := ADAArgument new.

	self assert: invok arguments size equals: 0.
	
	arg1 invocation: invok.
	self assert: invok arguments size equals: 1.
	self assert: arg1 invocation equals: invok.
	self assert: arg2 invocation isNil.

	invok arguments: { arg1 . arg2 }.
	self assert: invok arguments size equals: 2.
	self assert: arg1 invocation equals: invok.
	self assert: arg2 invocation equals: invok

]
