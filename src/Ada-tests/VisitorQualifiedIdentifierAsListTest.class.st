"
A LwsSubprogramSignatureTest is xxxxxxxxx.

"
Class {
	#name : #VisitorQualifiedIdentifierAsListTest,
	#superclass : #AbstractUtilityVisitor,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
VisitorQualifiedIdentifierAsListTest >> initialize [
	super initialize.
	rootRule := #expressionEntry "default starting rule for most of the tests"

]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitAllAttributeAndFunctionCall [
	|  q |
	q := self parseAndVisit: 'Get (Cont).Data.all'.
	
	self assert: q size equals: 2.
	self assert: q first  equals: 'Get'.
	self assert: q second equals: 'Data'.

]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitAttribute [
	|  q |
	q := self parseAndVisit: 'Person_Access''Size'.

	self assert: q class equals: FASTAdaQualifiedIdentifier.
	self assert: q size equals: 2.
	self assert: q first equals: 'Person_Access'.
	self assert: q second equals: 'Size'.


]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitFunctionCall [
	|  q |
	q := self parseAndVisit: 'COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_DO_SOMETHING(FROM_MAILBOX => MBX, RECEPTION_TASK => CSCI_DEFINITIONS.INPUT_RADAR)'.
	
	self assert: q size equals: 3.
	self assert: q first  equals: 'COMMUNICATION_SERVICES'.
	self assert: q second equals: 'MSG_MANAGER'.
	self assert: q third  equals: 'WAIT_AND_DO_SOMETHING'.
	self assert: q hasArguments

]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitFunctionCallArguments [
	|  q |
	q := self parseAndVisit: 'DO_SOMETHING(FROM_MAILBOX => MBX, RECEPTION_TASK => CSCI_DEFINITIONS.INPUT_RADAR)'.

	self assert: q size equals: 1.
	self assert: q hasArguments.
	self assert: q nbArguments equals: 2.

	self assert: q arguments first class equals: FASTAdaQualifiedIdentifier.
	self assert: q arguments first size equals: 1.
	self assert: q arguments first first equals: 'MBX'.
	self assert: q arguments second size equals: 2.
	self assert: q arguments second first equals: 'CSCI_DEFINITIONS'.
	self assert: q arguments second second equals: 'INPUT_RADAR'.

]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitMultipleIdentifiers [
	|  q |
	q := self parseAndVisit: 'COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG'.
	
	self assert: q size equals: 3.
	self assert: q first  equals: 'COMMUNICATION_SERVICES'.
	self assert: q second equals: 'MSG_MANAGER'.
	self assert: q third  equals: 'T_MSG'.
	self deny: q hasArguments

]

{ #category : #tests }
VisitorQualifiedIdentifierAsListTest >> testVisitSimpleIdentifier [
	|  q |
	q := self parseAndVisit: 'BOOLEAN'.
	
	self assert: q size equals: 1.
	self assert: q first equals: 'BOOLEAN'.
	self deny: q hasArguments

]

{ #category : #running }
VisitorQualifiedIdentifierAsListTest >> visitorClass [
	^ LwsVisitorQualifiedIdentifierAsList 
]
