Class {
	#name : #LwsFileAnchorsTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #tests }
LwsFileAnchorsTest >> testInvokFunction [
	| invok |
	self parseAndVisit: '
package body FCFC is
	function REC(PARAM : integer) return integer is
	begin
		return REC( REC(2) );
   end REC;
end FCFC;
'.

	invok := (model allWithType: FAMIXInvocation) first.
	self assert: invok notNil.
	self assert: invok sourceAnchor notNil.
	self assert: invok sourceAnchor startPos equals: 88.

	invok := (model allWithType: FAMIXInvocation) second.
	self assert: invok notNil.
	self assert: invok sourceAnchor notNil.
	self assert: invok sourceAnchor startPos equals: 93
]

{ #category : #tests }
LwsFileAnchorsTest >> testInvokStubProcedure [
	| invok |
	self parseAndVisit: self packageBodyWithProcedureExample.

	self assert: model allInvocations size equals: 0
	"stup not created anymore
	invok := (model allWithType: ADAInvocation) first.
	self deny: invok isNil.
	self assert: invok sourceAnchor startPos equals: 148"
]

{ #category : #tests }
LwsFileAnchorsTest >> testPackageAndFunction [
	| ent |
	self parseAndVisit: self packageWithFunctionExample. 

	ent := model findEntityNamed: 'Linked_List'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 3.
	self assert: ent sourceAnchor allFiles first stop equals: 83.

	ent := model findEntityNamed: 'Allocate_New_Node'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 28.
	self assert: ent sourceAnchor allFiles first stop equals: 65

]

{ #category : #tests }
LwsFileAnchorsTest >> testProcedureAndStub [
	| proc |
	self parseAndVisit: '
procedure P2 is
begin
  Put;
end P2;'. 

	proc := model findEntityNamed: 'P2'.
	self assert: proc notNil.
	self assert: proc sourceAnchor allFiles first start equals: 2.
	self assert: proc sourceAnchor allFiles first stop equals: 37.

	self assert: (model findEntityNamed: 'PUT') isNil
	"proc := model entityNamed: 'PUT'.
	self assert: proc notNil.
	self assert: proc sourceAnchor isNil"
]

{ #category : #tests }
LwsFileAnchorsTest >> testTwoTasksDeclAndBody [
	| ent |
	self parseAndVisit: self procedureWithTwoTasks.

	ent := model findEntityNamed: 'First_Task'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 23.
	self assert: ent sourceAnchor allFiles first stop equals: 38.
	self assert: ent sourceAnchor allFiles second start equals: 43.
	self assert: ent sourceAnchor allFiles second stop equals: 143.

	ent := model findEntityNamed: 'Second_Task'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 149.
	self assert: ent sourceAnchor allFiles first stop equals: 165.
	self assert: ent sourceAnchor allFiles second start equals: 170.
	self assert: ent sourceAnchor allFiles second stop equals: 271.

]

{ #category : #tests }
LwsFileAnchorsTest >> testTypesAndSubTypes [
	| ent |
	self parseAndVisit: self packageWithSubtypes.

	ent := model findEntityNamed: 'MESSBOX'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 52.
	self assert: ent sourceAnchor allFiles first stop equals: 103.

	ent := model findEntityNamed: 'T_MESSBOX_ID'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 108.
	self assert: ent sourceAnchor allFiles first stop equals: 139.

	ent := model findEntityNamed: 'T_CODE'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 144.
	self assert: ent sourceAnchor allFiles first stop equals: 186.

	ent := model findEntityNamed: 'T_PLOTS_RANGE'.
	self assert: ent notNil.
	self assert: ent sourceAnchor allFiles first start equals: 191.
	self assert: ent sourceAnchor allFiles first stop equals: 271.

]

{ #category : #running }
LwsFileAnchorsTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
