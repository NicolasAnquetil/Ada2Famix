Class {
	#name : #ADAChefDependencies,
	#superclass : #ThalesExampleTest,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
ADAChefDependencies >> allSamples [
	^ self allSamplesForCategory: 'chef-dependencies'
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageIncomingAccesses [
	| sub |
	sub := model findEntityNamed: 'P2'.
	self assert: sub notNil.
	self assert: sub queryIncomingAccesses size equals: 5
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageIncomingInvocations [
	| sub |
	sub := model findEntityNamed: 'P1'.
	self assert: sub notNil.
	self assert: sub queryAllIncomingInvocations size equals: 2
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageIncomingReferences [
	| sub |
	self skip. "This test expect variable declaration as Incoming ref but it is not yet implemented in a generic way in famix."
	sub := model findEntityNamed: 'P2'.
	self assert: sub notNil.
	self assert: sub queryIncomingReferences size equals: 4
	"P1Sub2 -> P2.P2Typ1
	 localP1Var -> P2.P2Typ1
	 P2Sub1 -> P2Typ1
	 localP2Var -> P2Typ1"
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageIncomingTypeDeclarations [
	| sub |
	sub := model findEntityNamed: 'P2'.
	self assert: sub notNil.
	self assert: sub queryIncomingTypeDeclarations size equals: 4
	"P1Sub2 -> P2.P2Typ1
	 localP1Var -> P2.P2Typ1
	 P2Sub1 -> P2Typ1
	 localP2Var -> P2Typ1"
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageOutgoingAccesses [
	| sub |
	sub := model findEntityNamed: 'P1'.
	self assert: sub notNil.
	self assert: sub children size equals: 1.
	self assert: sub queryOutgoingAccesses size equals: 3
]

{ #category : #testDependencies }
ADAChefDependencies >> testPackageOutgoingInvocations [
	| sub |
	sub := model findEntityNamed: 'P1'.
	self assert: sub notNil.
	self assert: sub queryAllOutgoingInvocations size equals: 2
]

{ #category : #testDependencies }
ADAChefDependencies >> testSubprogramIncomingAccesses [
	| sub |
	"Old comment: return 0 because ada subprograms do not have incoming accesses
	New comment: This is wrong! The children of subprograms have incomming accesses. So a subprogram can have incomming accesses."
	sub := model findEntityNamed: 'P1Sub1'.
	self assert: sub notNil.
	self assert: sub queryIncomingAccesses size equals: 1
]

{ #category : #testDependencies }
ADAChefDependencies >> testSubprogramIncomingInvocations [
	| sub |
	sub := model findEntityNamed: 'P2Sub1'.
	self assert: sub notNil.
	self assert: sub queryAllIncomingInvocations size equals: 2.
	
	sub := model findEntityNamed: 'P1Sub1'.
	self assert: sub notNil.
	self assert: sub queryAllIncomingInvocations size equals: 2
]

{ #category : #testDependencies }
ADAChefDependencies >> testSubprogramOutgoingAccesses [
	| sub |
	sub := model findEntityNamed: 'P1Sub1'.
	self assert: sub notNil.
	self assert: sub queryOutgoingAccesses size equals: 3
]

{ #category : #testDependencies }
ADAChefDependencies >> testSubprogramOutgoingInvocations [
	| sub |
	sub := model findEntityNamed: 'P1Sub1'.
	self assert: sub notNil.
	self assert: sub queryAllOutgoingInvocations size equals: 2
]

{ #category : #testDependencies }
ADAChefDependencies >> testTaskIncomingAccesses [
	| sub |
	sub := model findEntityNamed: 'P2Task1'.
	self assert: sub notNil.
	self assert: sub queryIncomingAccesses size equals: 1
]

{ #category : #testDependencies }
ADAChefDependencies >> testTaskOutgoingAccesses [
	| sub |
	sub := model findEntityNamed: 'P2Task1'.
	self assert: sub notNil.
	self assert: sub queryOutgoingAccesses size equals: 3
]

{ #category : #testDependencies }
ADAChefDependencies >> testTaskOutgoingInvocations [
	| sub |
	sub := model findEntityNamed: 'P2Task1'.
	self assert: sub notNil.
	self assert: sub queryAllOutgoingInvocations size equals: 1
]

{ #category : #testDependencies }
ADAChefDependencies >> testTypeIncomingTypeDeclarations [
	| sub |
	sub := model findEntityNamed: 'P2Typ1'.
	self assert: sub notNil.
	self assert: sub queryIncomingTypeDeclarations size equals: 4
]
