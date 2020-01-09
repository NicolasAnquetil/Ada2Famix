"
A LwsSubprogramSignatureTest is xxxxxxxxx.

"
Class {
	#name : #VisitorSubprogramSignatureTest,
	#superclass : #AbstractUtilityVisitor,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
VisitorSubprogramSignatureTest >> initialize [
	super initialize.
	rootRule := #declEntry  "default entry point for most tests"

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitFunctionNoParameters [
	|  sig |
	sig := self parseAndVisit: 'function F1 return BOOLEAN;'.
	
	self assert: sig equals: 'F1(): BOOLEAN'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitOperatorOverloadDeclaration [
	|  sig |
	sig := self parseAndVisit: 'function "&" (S: String; I: Integer) return String;'.
	
	self assert: sig equals: '&(String;Integer): String'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitProcedure [
	|  sig |
	sig := self parseAndVisit: 'procedure SEND(VIA_CHANNEL : in T_CHANNEL_NUMBER; THIS_MSG : in T_MSG);'.
	
	self assert: sig equals: 'SEND(T_CHANNEL_NUMBER;T_MSG)'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitProcedureDuplicatedType [
	|  sig |
	sig := self parseAndVisit: 'procedure SEND(A, B : in T_BLAH);'.
	
	self assert: sig equals: 'SEND(T_BLAH;T_BLAH)'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitProcedureFullyQualifiedType [
	|  sig |
	sig := self parseAndVisit: 'procedure SEND(A : Container.t_Blah; B : Integer);'.
	
	self assert: sig equals: 'SEND(Container.t_Blah;Integer)'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitProcedureNoParameters [
	|  sig |
	sig := self parseAndVisit: 'Procedure PROC;'.
	
	self assert: sig equals: 'PROC()'

]

{ #category : #tests }
VisitorSubprogramSignatureTest >> testVisitQualifiedIdentifier [
	|  sig |
	rootRule := #nameEntry.
	sig := self parseAndVisit: 'A.B.C'.
	
	self assert: sig equals: 'A.B.C'

]

{ #category : #running }
VisitorSubprogramSignatureTest >> visitorClass [
	^ LwsVisitorSubprogramSignature 
]
