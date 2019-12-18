"
A LwsAdaDefTest is xxxxxxxxx.

"
Class {
	#name : #LwsAdaRefFASTEntitiesCreationTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testArgumentInPropertyCall [
	self parseAndVisit: '
procedure PROC is
begin
  X''FUNC(ARG);
end PROC;'.

	self assert: model allAdaSubprograms size equals: 1. "PROC"
	self assert: model allInvocations size equals: 0
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testAssignementVarIsWrite [
	| var |
	self parseAndVisit: '
Procedure Simple(X : in Integer) is
begin
	if (X > 0)
	  then X := 0;
	end if;
end Simple;
'.

	var := model findEntityNamed: 'X'.

	self assert: var incomingAccesses size equals: 2.	

	self assert: var incomingAccesses first isWrite not.
	self assert: var incomingAccesses first sourceAnchor notNil.
	self assert: var incomingAccesses first sourceAnchor startPos equals: 49.
	self assert: var incomingAccesses first sourceAnchor mooseModel notNil.
	
	self assert: var incomingAccesses second isWrite.
	self assert: var incomingAccesses second sourceAnchor notNil.
	self assert: var incomingAccesses second sourceAnchor startPos equals: 64.
	self assert: var incomingAccesses second sourceAnchor mooseModel notNil.
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testScopeForDeclareInCaseStmt [
	| var scope |
	self parseAndVisit:
	'procedure Handle_Value is
	begin
	declare
     V: Integer;
     begin
       null;
     end;  -- declare
	end Handle_Value;'. 

	var := model findEntityNamed: 'V'.
	self assert: var container class equals: FASTAdaDeclareStatement.  "DECLARE"
	scope := var container fastScope.
	self assert: scope class equals: FASTAdaDeclareScope.
	self assert: scope parents size equals: 1.
	self assert: scope parents first owner name equals: 'Handle_Value'
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testScopeForDeclareInProcedure [
	| var scope |
	self parseAndVisit:
	'procedure Handle_Value is
	begin
    case aVar is
    when 0 => 
	  declare
      V: Integer;
     begin
       null;
     end;  -- declare
    end case;
	end Handle_Value;'. 

	var := model findEntityNamed: 'V'.
	self assert: var container class equals: FASTAdaDeclareStatement.  "DECLARE"
	scope := var container fastScope.
	self assert: scope class equals: FASTAdaDeclareScope.
	self assert: scope parents size equals: 1.
	self assert: scope parents first owner name equals: 'Handle_Value'
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitAccessTypeDefinition [
	| typ |
	self parseAndVisit: '
package Linked_List is
  type POINTER is access integer;
  type P_POINT is access POINTER;
end Linked_List;'.

	typ := model entities detect: [ :e | e name = 'POINTER'].
	self deny: typ isAdaRecordType.
	self deny: typ isAdaRangeType.
	self deny: typ isAdaEnumeratedType.
	self assert: typ isAdaAccessType.  
	self deny: typ adaAccessed isNil. 
	self assert: typ adaAccessed name equals: 'integer'.   "primitive type !!!" 
	self deny: typ isAdaContainer.

	typ := model entities detect: [ :e | e name = 'P_POINT'].
	self deny: typ isAdaRecordType.
	self deny: typ isAdaRangeType.
	self deny: typ isAdaEnumeratedType.
	self assert: typ isAdaAccessType.
	self deny: typ adaAccessed isNil. 
	self assert: typ adaAccessed name equals: 'POINTER'. 
	self deny: typ isAdaContainer.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitAnonymousType [
	| var |
	self parseAndVisit: '
package body MSG_MANAGER is
	V : ARRAY ( Positive range 1 .. 10 ) of INTEGER;
end MSG_MANAGER;
'.

	var := model findEntityNamed: 'V'.
	self assert: var declaredType equals: model singletonAnonymousArray

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitFunctionBody [
	| fastEntity |
	self parseAndVisit: 'function F1 return BOOLEAN is
   begin
      null;
   end F1;
'. 
	
	self assert: model allAdaSubprograms size equals: 1.
	fastEntity := model allAdaSubprograms first fastBehaviouralEntity.
	self assert: fastEntity parentNode equals: model allAdaSubprograms first.
	self assert: fastEntity statementBlock notNil.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitPackgeBody [
	| fastEntity |
	self parseAndVisit: '
package body STACK is
begin
	null;
end STACK;'. 

	self assert: model allAdaPackages size equals: 1.
	fastEntity := model allAdaPackages first fastBehaviouralEntity.
	self assert: fastEntity parentNode equals: model allAdaPackages first.
	self assert: fastEntity statementBlock notNil.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitProcedureBody [
	| fastEntity |
	self parseAndVisit: '
   procedure Simple1 is
	begin
	  null;
	end Simpel1;
'. 

	self assert: model allAdaSubprograms size equals: 1.
	fastEntity := model allAdaSubprograms first fastBehaviouralEntity.
	self assert: fastEntity parentNode equals: model allAdaSubprograms first.
	self assert: fastEntity statementBlock notNil.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitProcedureWithDeclare [
	| var |
	self parseAndVisit:
	'procedure Handle_Value is
	begin
	declare
     V: Integer;
     begin
       null;
     end;  -- declare
	end Handle_Value;'. 

	var := model entities detect: [ :e | e name = 'V'].
	self deny: var isNil.

	self deny: var container isNil.
	self assert: var container class equals: FASTAdaDeclareStatement.  "DECLARE"
	self assert: var container parentNode class equals: FASTAdaStatementBlock.  "BEGIN/END of PROCEDURE"
	self assert: var container parentNode parentNode class equals: FASTAdaNamedBehaviouralEntity.   "PROCEDURE in FAST"
	self assert: var container parentNode parentNode parentNode equals: (model entities detect: [ :e | e name = 'Handle_Value']).   "PROCEDURE in FAMIX"
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitSeparateInSeparate [
	| pckg |
	self parseAndVisit: self separateWithSeparate.

	self assert: model allAdaPackages size equals: 3.  "TOP + FIRST_SEPARATE + SECOND_SEPARATE"
	pckg := model entities detect: [ :e | e name = 'TOP'].
	self assert: pckg isStub not.
	self assert: pckg packages size equals: 1.

	pckg := pckg packages first.
	self assert: pckg name equals: 'FIRST_SEPARATE'.
	self assert: pckg isStub not.
	self assert: pckg packages size equals: 1.

	pckg := pckg packages first.
	self assert: pckg name equals: 'SECOND_SEPARATE'.
	self assert: pckg isStub not.
	self assert: pckg packages size equals: 0.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitSubTypeInDeclareStatement [

	| typ |
	self parseAndVisit: '
procedure PROC is
begin
  declare
    subtype SUB_T is INTEGER;
  begin
    null;
  end;
end PROC;'.

	self assert: model allAdaTypes size equals: 1. "SUB_T"

	typ := model entities detect: [ :e | e name = 'SUB_T'].
	self assert: typ container class equals: FASTAdaDeclareStatement.
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitSubtypeDefinition [
	| pckg aType |
	self parseAndVisit: 
'with MAILBOX_MANAGER;
package body MESSAGES is
   type MESSBOX is access MAILBOX_MANAGER.MAILBOX_INFO;
   subtype T_MESSBOX_ID is MESSBOX;
end MESSAGES;'.

	pckg := model allAdaPackages first.
	aType := model entities detect: [ :e | e name = 'MESSBOX' ].
	self assert: aType isAdaAccessType.

	"21 Nov 2016
	1) Dans l'état actuel de l'importateur, le type MESSBOX n'est pas lié au type MAILBOX_INFO.
	Malgré mes connaissances limitées d'ADA, il me semble que ce n'est pas correct et 
	qu'il faudrait créer un stub pour MAILBOX_INFO. Est-ce que vous confirmez mon sentiment ?
 	"	
	self assert: aType adaAccessed notNil.
	self assert: aType adaAccessed isStub.
	self assert: aType adaAccessed name equals: 'MAILBOX_INFO'.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitTaskBody [
	| task fastEntity |
	self parseAndVisit: 'procedure PCDR is
   task body aTask is
   begin
      null;
   end aTask;
begin
      null;
end PCDR;
'.

	task := model allAdaTasks anyOne.
	self assert: task name equals: 'aTask'.

	fastEntity := task fastBehaviouralEntity.
	self assert: fastEntity parentNode equals: task.
	self assert: fastEntity statementBlock notNil.

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitTaskWithThalesCase [
	| task case  |
	self parseAndVisit: '
package body PCKG is
	task body aTask is
      aVar : Integer;
   begin
    case aVar is
    when 0 => null;
    when others => null;
    end case;
   end aTask;
end PCKG;
'. 

	task := model allAdaTasks anyOne.
	self assert: task name equals: 'aTask'.

	self assert: task fastBehaviouralEntity statementBlock statements size equals: 1.

	case := task fastBehaviouralEntity statementBlock statements first.
	self assert: case notNil.
	self flag: 'should be a StructuralEntity'.
	self assert: case expression class equals: FAMIXAccess.
	self assert: case expression variable name equals: 'aVar'.

	self assert: case alternatives size equals: 2.
	self assert: (case alternatives allSatisfy: [ :a | a parentNode = case. ]).
	self assert: (case alternatives allSatisfy: [ :a | a choices isEmpty ]).

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitTaskWithThalesCaseInCase [
	| task case alt |
	self parseAndVisit: 'package body PCKG is
	task body aTask is
      aVar : Integer;
   begin
    case aVar is
     when 0 =>
       case aVar*2 is
			when 1 => null;
		 end case;
     when others => null;
     end case;
   end aTask;
end PCKG;
'. 

	task := model allAdaTasks first.
	self assert: task name equals: 'aTask'.

	"first (outer) CASE"
	self assert: task fastBehaviouralEntity statementBlock statements size equals: 1.
	case := task fastBehaviouralEntity statementBlock statements first.
	self assert: case notNil.
	self assert: case expression class equals: FAMIXAccess.
	self assert: case expression variable name equals: 'aVar'.

	"first alternative in outer CASE"
	self assert: case alternatives size equals: 2.
	alt := case alternatives first.
	self assert: alt choices isEmpty.

	"second (inner) CASE"
	self assert: alt statements size equals: 1.
	case := alt statements first.
	self assert: case notNil.
	self assert: case expression isNil. "because it is an expression"

	"first alternative in inner CASE"
	self assert: case alternatives size equals: 1.
	alt := case alternatives anyOne.
	self assert: alt notNil.
	self assert: alt choices isEmpty.
	self assert: alt parentNode equals: case.


]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitTwoProcWithSameNameAndChildren [

	| typ1 typ2 |
	self parseAndVisit: '
procedure PROC(PARAM : Integer) is
  subtype ITYPE is INTEGER;
begin
  null;
end PROC;

procedure PROC(PARAM : FLOAT) is
  subtype BTYPE is Boolean;
begin
  null;
end PROC;'.

	self assert: model allAdaSubprograms size equals: 2.
	self assert: model allAdaTypes size equals: 2.
	
	typ1 := model allAdaTypes first.
	typ2 := model allAdaTypes second.
	self deny: typ1 container = typ2 container.
]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitUSEClauseFound [
	| pckg aScope |

	self parseAndVisit: '
package TRACKING_TYPES is
  subtype T_TEST_2 is INTEGER;
end TRACKING_TYPES;'.
	self parseAndVisit: '
with TRACKING_TYPES;
use TRACKING_TYPES;
package COMMON_TYPES is
  subtype T_MAIN_CODE is INTEGER;
end COMMON_TYPES;
'. 

	self assert: model allAdaPackages size equals: 2.

	pckg := model entities detect: [ :e | e name = 'COMMON_TYPES'].
	self assert: pckg fastScope notNil.
	self assert: pckg fastScope owner equals: pckg.

	"pckg scope"
	self assert: pckg fastScope parents size equals: 2. "USE-clause scope + scope of parentEntity"

	"USE-clause scope"
	aScope := pckg fastScope parents detect: [:s | s owner isNil]. 
	self assert: aScope parents size equals: 2. "topLevel scope + USEd package scope"
	
	"USEd package scope"
	aScope := aScope parents detect: [:s | s owner isAdaPackage]. 
	self assert: aScope parents size equals: 1. "topLevel scope"
	self deny: aScope owner isStub

]

{ #category : #tests }
LwsAdaRefFASTEntitiesCreationTest >> testVisitUSEClauseNotFound [
	| pckg |
	self parseAndVisit: '
with TRACKING_TYPES;
use TRACKING_TYPES;
package COMMON_TYPES is
  subtype T_MAIN_CODE is INTEGER;
end COMMON_TYPES;
'. 

	self assert: model allAdaPackages size equals: 2.

	pckg := model entities detect: [ :e | e name = 'COMMON_TYPES'].
	self assert: pckg fastScope notNil.
	self assert: pckg fastScope owner equals: pckg.

	"pckg scope"
	self assert: pckg fastScope parents size equals: 2. "scope of parentEntity"

]

{ #category : #running }
LwsAdaRefFASTEntitiesCreationTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
