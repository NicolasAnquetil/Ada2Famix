"
A LwsAdaDefTest is xxxxxxxxx.

"
Class {
	#name : #LwsAdaRefNameResolutionTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> obsoletetestAggregatArgument [
	"Aggregate argument is a very specific construction that is not treated in the parser"
	| invok |
	self parseAndVisit: '
package body file is
  procedure AggregatArgA (TOTO: in BOOLEAN; TO: in BOOLEAN);

  procedure AggregatArgB is
  begin
     AggregatArgA(TOTO =>FALSE, TO => TRUE);
  end AggregatArgB;
end file;
'.

	self assert: (model findEntityNamed: 'AggregatArgB') notNil.
	self assert: (model findEntityNamed: 'AggregatArgB') accesses size equals: 2.
	self assert: (model findEntityNamed: 'AggregatArgB') outgoingInvocations size equals: 1.

	invok := (model findEntityNamed: 'AggregatArgB') outgoingInvocations anyOne.

	self assert: invok arguments size equals: 2.

	self assert: (invok arguments allSatisfy: [:adaArg | adaArg class = ADAAggregateArgument ]).
]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testAdaAccessed [
	self parseAndVisit: '
package body ATT is
	task body THE_TASK is
		INNER_VAR : integer;
	begin
		null;
	end THE_TASK;

	type THE_TYPE is access THE_TASK;
	
	A_VAR : THE_TYPE;
begin
	A_VAR.INNER_VAR := 1;
end ATT;
'.

	self assert: (model entities detect: [ :e | e name = 'THE_TYPE']) adaAccessed equals: (model entities detect: [ :e | e name = 'THE_TASK']).

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testDataReceivedFrom [
	| client provider |
	
	self parseAndVisit: {
		ThalesExamples csci_definitions .
		ThalesExamples piste_3d_ads .
		ThalesExamples communication_services_ads .
		ThalesExamples surveillance_adb
	}.

	client := model findEntityNamed: 'T_TA_SURVEILLANCE'.
	provider := model findEntityNamed: 'COMMUNICATION_SERVICES'.
	self assert: (client dataReceivedFrom: provider) size equals: 2. "see below which 2"
	self assert: ( (client dataReceivedFrom: provider) 
				anySatisfy: [ :v | v name = 'INPUT_RADAR_TO_SURVEILLANCE' ] ).
	self assert: ( (client dataReceivedFrom: provider) 
				anySatisfy: [ :v | v name = 'GESTION_TO_SURVEILLANCE' ] ).

	provider := model findEntityNamed: 'CSCI_DEFINITIONS'.
	self assert: (client dataReceivedFrom: provider) size equals: 1.
	self assert: ( (client dataReceivedFrom: provider) 
				anySatisfy: [ :v | v name = 'SURVEILLANCE' ] ).

	client := model findEntityNamed: 'TREAT_RADAR_MESSAGES'.
	provider := model findEntityNamed: 'PISTE_3D'.
	self assert: (client dataReceivedFrom: provider) size equals: 1.
	self assert: ( (client dataReceivedFrom: provider) 
				anySatisfy: [ :v | v name = 'MSG_CODE' ] ).

	client := model findEntityNamed: 'SURVEILLANCE' where: #isAdaPackage. "container of TREAT_RADAR_MESSAGES"
	self assert: (client dataReceivedFrom: provider) size equals: 1.
	self assert: ( (client dataReceivedFrom: provider) 
				anySatisfy: [ :v | v name = 'MSG_CODE' ] ).

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testDataReceivedFromAggregateArgument [
	| data |
	self parseAndVisit: '
package body file is
  type C is record
    M : Integer;
    P : Integer;
  end record ;
  procedure AggregatArgA (TOTO: in BOOLEAN; TO:in C);
  procedure AggregatArgB is
    ONE : Integer := 1;
    TWO : Integer := 2;
  begin
    AggregatArgA(TOTO =>FALSE, TO => ( M=>ONE,P=>TWO));
   end AggregatArgB;
end file;
'.

	data := ( (model entities detect: [ :e | e name = 'AggregatArgA'])
					dataReceivedFrom: (model entities detect: [ :e | e name = 'AggregatArgB']) ) asOrderedCollection.
	self assert: data size equals: 2.
	"self assert: (data anySatisfy: [:d | d name = 'FALSE'])."
	self assert: (data anySatisfy: [:d | d name = 'ONE']).
	self assert: (data anySatisfy: [:d | d name = 'TWO']).

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testFunctionsProcedures [
	| ent |
	self parseAndVisit: {ThalesExamples communication_services_ads . ThalesExamples communication_services_msg_manager}.

	ent := model entities detect: [ :e | e name = 'MSG_MANAGER'].

	self assert: ent subprograms size equals: 4.
	self assert: (ent subprograms noneSatisfy: [:s | s isGeneric]).
	self assert: (ent subprograms select: [:s | s isFunction]) size equals: 3.
	self assert: (ent subprograms select: [:s | s isProcedure]) size equals: 1.

	ent := model entities detect: [ :e | e name = 'CHANNEL_NUMBER_OF'].
	self assert: ent notNil.
	self assert: ent declaredType name equals: 'T_CHANNEL_NUMBER'.
	
	ent := model entities detect: [ :e | e name = 'WAIT_AND_DO_SOMETHING'].
	self assert: ent notNil.
	self assert: ent declaredType name equals: 'T_MSG'.
	
	ent := model entities detect: [ :e | e name = 'MSG_CODE_OF'].
	self assert: ent notNil.
	self assert: ent declaredType name equals: 'T_MSG_CODE'.
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testInvocationWithDataPassed [
	| invok |
	self parseAndVisit: { self packageBodyWithProcedureExample . self callerOfReplace_Elmt }.

	self assert: (model allWithType: FASTAdaProcedureCall ) size equals: 1.

	invok := (model allWithType: FASTAdaProcedureCall) first.
	"Linked_List.Replace_Elmt(var1, var2, var3, var4)"
	invok := invok invocation.
	self deny: invok isNil.
	self assert: invok from equals: (model findEntityNamed: 'callIt').
	self assert: invok candidates first equals: (model findEntityNamed: 'Replace_Elmt').
	
	self assert: invok arguments size equals: 4.

	self assert: invok dataSent size equals: 3.
	self assert: invok dataSent first  equals: (model findEntityNamed: 'var1').
	self assert: invok dataSent second equals: (model findEntityNamed: 'var2').
	self assert: invok dataSent third  equals: (model findEntityNamed: 'var3').
	
	self assert: invok dataReturned size equals: 2.
	self assert: invok dataReturned first  equals: (model findEntityNamed: 'var3').
	self assert: invok dataReturned second equals: (model findEntityNamed: 'var4').

]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testIsAdaAccessType [
	| aType |
	self
		parseAndVisit:
			{(self typeDefUsedInParameter).
			(self packageWithSubtypes)}.
	aType := model entities detect: [ :e | e name = 'MESSBOX' ].
	self assert: aType isAdaAccessType.
	self assert: aType adaAccessed notNil.
	self assert: aType adaAccessed name equals: 'MAILBOX_INFO'.
	
	self deny: (model entities detect: [ :e | e name = 'T_MESSBOX_ID' ]) isAdaAccessType.
	self deny: (model entities detect: [ :e | e name = 'T_CODE' ]) isAdaAccessType.
	self deny: (model entities detect: [ :e | e name = 'T_PLOTS_RANGE' ]) isAdaAccessType.

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testOverrideNameArrayFunction [
	| entity |
	self parseAndVisit: '
function aName (I : Integer) return Boolean is
  aName : array (INTEGER range <>) of Boolean ;     -- array with same name as function
begin
  return aName(1);      -- aName here should be the array
end aName;
'.

	entity := (model allWithType: ADAStructuralEntity) first.

	self assert: entity name equals: 'aName'.
	self assert: entity incomingAccesses size equals: 1

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testOverrideNameVarPackage [
	| entity symbol |
	self parseAndVisit: '
package body OUTER is
	type Color is (Red, Green, Blue);
	aName : Color;            -- variable with same name as inner package

	package body aName is     -- package "overrides" variable name
	  Green : boolean;        -- variable also "overrides" the enum constant
	begin
		aName.Green;           -- aName is the package and Green its var
	end aName;
begin
	aName.Green;              -- aName is the var in OUTER and Green the enum constant
end OUTER;
'.
	symbol := (FASTAdaQualifiedIdentifier withAll: #('aName' 'Green')) asStructuralIdentifier asSubprogramIdentifier.
	entity := model findEntityNamed: 'OUTER' where: #isAdaPackage.
	self assert: (entity resolve: symbol forNode: entity) container name equals: 'OUTER'.
	entity := model findEntityNamed: 'aName' where: #isAdaPackage. "will return the package"
	self assert: (entity resolve: symbol forNode: entity) container name equals: 'aName'.
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testParameterWithType [
	| fct |
	self parseAndVisit: 'package MAILBOX_MANAGER is
    type MAILBOX_INFO is
      record
         QUEUE : INTEGER;
      end record;

   type MAILBOX is access MAILBOX_INFO;

   function RECEIVE (MBX : in MAILBOX) return BOOLEAN;

end MAILBOX_MANAGER;
'. 

	fct := model entities detect: [ :e | e name = 'RECEIVE'].
	
	self assert: fct parameters size equals: 1.

	self assert: fct parameters first name equals: 'MBX'.
	self assert: fct parameters first declaredType name equals: 'MAILBOX'.

]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testPointerToTask [
	self parseAndVisit: '
package body ATT is
	task body THE_TASK is
		INNER_VAR : integer;
	begin
		null;
	end THE_TASK;
	type THE_TYPE is access THE_TASK;
	A_VAR : THE_TYPE;
begin
	A_VAR.INNER_VAR := 1;
end ATT;
'.

	self assert: model allAccesses size equals: 2. "A_VAR.INNER_VAR"

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testPreviousAccessWithRecord [
	| var acc |
	self parseAndVisit: '
 package body Linked_List is
   type STRUCT is record
      y : Integer ;
    end record ;
   Procedure Replace_Elmt(x:in struct ; z:out integer) is
	begin
	  z := x.y;
	end Replace_Elmt;
 end Linked_List;
'.

	var := model findEntityNamed: 'z'.
	self assert: var incomingAccesses size equals: 1.
	acc := var incomingAccesses first.
	self assert: acc isWrite.
	self assert: acc next isNil.

	var := model findEntityNamed: 'x'.
	self assert: var incomingAccesses size equals: 1.
	acc := var incomingAccesses first.
	self deny: acc isWrite.
	self assert: acc next notNil.

	acc := acc next.
	self assert: acc variable name equals: 'y'.
	self deny: acc isWrite.
	self assert: acc next isNil.

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testPreviousAccessWithRecordPointer [
	| var acc |
	self parseAndVisit: '
 package body PCKG is
	type T_ACCESS is access INTEGER;
   Procedure PROC( z:out INTEGER) is
	  Y : INTEGER;
	begin
	  z := PROC.y; 
	end PROC;
 end PCKG;
'.

	var := model findEntityNamed: 'z'.
	self assert: var incomingAccesses size equals: 1.
	acc := var incomingAccesses first.
	self assert: acc isWrite.
	self assert: acc next isNil.

	"*** stubs not created anymore
	self assert: (model allWithType: ADAUnknownContainer) size equals: 1.
	self assert: (model allWithType: ADAUnknownContainer) first name equals: 'X'."

	var := model findEntityNamed: 'Y'.
	self assert: var incomingAccesses size equals: 1.
	acc := var incomingAccesses first.
	self deny: acc isWrite.
	self assert: acc previous isNil
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testProcedureCallAndInvocation [
	| calls |
	self parseAndVisit: {ThalesExamples tracks_1_ads . ThalesExamples tracks_1_characterization . ThalesExamples tracks_1_adb }.

	self assert: (model allWithType: FASTAdaProcedureCall) size equals: 2.
	"TREAT -> CHARACTERIZATION.SEND_TO_OPERATOR(CODE, THIS)
	 TREAT -> KINEMATIC.SEND_TO_OPERATOR(CODE => CODE, THIS => THIS)"
	
	"calls to SEND_TO_OPERATOR procedure"
	calls := (model entities detect: [ :e | e name = 'TREAT']) outgoingInvocations.
	self assert: calls size equals: 2.

	self assert: (calls allSatisfy: [:call | call dataSent first name = 'CODE']).
	self assert: (calls allSatisfy: [:call | call dataSent second name = 'THIS'])
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testRecordElementsWithType [
	| typ |
	
	self parseAndVisit: '
  package body Linked_List is
    type List_Item is record
      Data       : Item_To_Manage := Illegal_Value ;
      Prior_Item : List_Item      := Empty_Node    ;
      Next_Item  : List_Item      := Empty_Node    ;
    end record ;
end Linked_List;'. 

	typ := model findEntityNamed: 'List_Item'.

	self assert: (model findEntityNamed: 'Prior_Item') declaredType equals: typ.
	self assert: (model findEntityNamed: 'Prior_Item') container equals: typ.
	self assert: (model findEntityNamed: 'Next_Item') declaredType equals: typ.
	self assert: (model findEntityNamed: 'Next_Item') container equals: typ
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testResolveSymbol1 [

	| pckg symbol |
	self parseAndVisit: { ThalesExamples communication_services_ads . ThalesExamples csci_definitions . ThalesExamples input_radar_ads }.

	pckg := model findEntityNamed: 'INPUT_RADAR' where: #isAdaPackage.
	symbol := (FASTAdaQualifiedIdentifier with: 'CSCI_DEFINITIONS') asContainerIdentifier.
	self 
		assert: (pckg resolve: symbol forNode: pckg) 
		equals: (model findEntityNamed: 'CSCI_DEFINITIONS')
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testResolveSymbol2 [

	| pckg symbol |
	self parseAndVisit: { ThalesExamples communication_services_ads . ThalesExamples input_radar_ads }.

	pckg := model entities detect: [ :e | e name = 'INPUT_RADAR'].
	symbol := (FASTAdaQualifiedIdentifier with: 'COMMUNICATION_SERVICES') asContainerIdentifier.
	self assert: (pckg resolve: symbol forNode: pckg) equals: (model entities detect: [ :e | e name = 'COMMUNICATION_SERVICES'])
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testSubProgNbParams [
	| symb0 pckg symb4 |
	self parseAndVisit: '
 package body PCKG1 is
   Procedure PROC(w: Integer; x:in Integer; y:in out Integer; z:out integer);
 end Linked_List;
'.
	self parseAndVisit: '
 package  PCKG2 is
   Procedure PROC;
 end ListElems;
'.

	symb0 := (FASTAdaQualifiedIdentifier with: 'PROC') asSubprogramIdentifier.
	symb4 := (FASTAdaQualifiedIdentifier with: 'PROC') asSubprogramIdentifier.
	symb4 addArgument: nil ; addArgument: nil ; addArgument: nil ; addArgument: nil.

	pckg := model entities detect: [ :e | e name = 'PCKG1'].
	self assert: (pckg fastScope resolve: symb0 forNode: pckg) isNil.
	self assert: (pckg fastScope resolve: symb4 forNode: pckg) notNil.
	pckg := model entities detect: [ :e | e name = 'PCKG2'].
	self assert: (pckg fastScope resolve: symb0 forNode: pckg) notNil.
	self assert: (pckg fastScope resolve: symb4 forNode: pckg) isNil.

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testTaskTypeWithProcedure [
	| typ tsk ent |
	self parseAndVisit: '
package body PCKG is
   task type T_TASK is
      pragma PRIORITY (OTHER.MEMBER);
      entry START;
   end T_TASK;

   V_TASK : T_TASK;

   procedure START  is
   begin
    V_TASK.START;
   end START;
end PCKG;
'. 

	typ := model findEntityNamed: 'T_TASK'.
	self assert: typ notNil.
	self assert: typ class equals: ADATask.

	tsk := model allAdaTasks detect: [:e | e name = 'V_TASK'].
	self assert: tsk notNil.
	self deny: tsk isStub.
	self deny: tsk sourceAnchor isNil.
	self assert: tsk fastScope equals: typ fastScope.

	ent := model allAdaSubprograms detect: [:e | (e name = 'START') and: [e outgoingInvocations notEmpty ] ].
	self assert: ent container name equals: 'PCKG'.
	self assert: ent outgoingInvocations size equals: 1.

	ent := model allAdaSubprograms detect: [:e | (e name = 'START') and: [e incomingInvocations notEmpty ] ].
	self assert: ent container name equals: 'T_TASK'.
	self assert: ent incomingInvocations size equals: 1.
	self assert: ent incomingInvocations first sender name equals: 'START'.

]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testUpdateScopeWhenParsingMultipleFiles [
	| scope |
	self parseAndVisit: '
package A is
	subtype I is INTEGER;
end A;'.
	self parseAndVisit: '
package B is
	subtype J is INTEGER;
end B;'.

	scope := (model  allWithType: ADATopLevelContainer) first fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'A')) size equals: 1.
	self 
		assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'A')) first 
		equals: (model findEntityNamed: 'A').
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'B')) size equals: 1.
	self 
		assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'B')) first 
		equals: (model findEntityNamed: 'B')
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testVariableWithType [

	self parseAndVisit: '
package body Linked_List is
  type List_Item is record
    Data : Item_To_Manage;
  end record ;

  Empty_Node : Constant List_Item ;  
end Linked_List;'. 

	self 
		assert: (model findEntityNamed: 'Empty_Node') declaredType 
		equals: (model findEntityNamed: 'List_Item')
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testVisitFunctionCallInFunctionCall [
	| fct |
	self parseAndVisit: '
package body PCKG is
	function REC(PARAM : integer) return integer is
	begin
		return REC( REC("2") );
   end REC;
end PCKG;
'. 
	
	self assert: model allAdaSubprograms size equals: 1.
	fct := model allAdaSubprograms first.

	self assert: model allInvocations size equals: 2.
	self assert: (model allInvocations allSatisfy: [:invok | invok sender = fct]).
	self assert: (model allInvocations anySatisfy: [:invok | invok arguments isEmpty]).
	self assert: (model allInvocations anySatisfy: [:invok |
						(invok arguments size = 1)
						and:
						[invok arguments first argument isNil]
					]).
]

{ #category : #testing }
LwsAdaRefNameResolutionTest >> testVisitGenericFunctionWithParameterFunction [
	| ent |
	self parseAndVisit: '
generic
  type Element_T is private;
  with function mult(X, Y: Element_T) return Element_T;
function Square (X : Element_T) return Element_T;

function Square (X: Element_T) return Element_T is
begin
  return mult(X, X);
end Square;'. 

	ent := model findEntityNamed: 'Square'.
	self assert: ent notNil.
	self assert: ent declaredType name equals: 'Element_T'.
	self assert: ent parameters size equals: 1.
	self assert: ent parameters first name equals: 'X'.
	self assert: ent parameters first declaredType name equals: 'Element_T'.
	self assert: ent outgoingInvocations size equals: 1.
	self assert: ent outgoingInvocations first candidates first name equals: 'mult'.
	self assert: ent outgoingInvocations first candidates first container equals: ent.
	

]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testVisitGenericPackageInstanciation [
	| ent |
	self parseAndVisit: '
generic
  type Element_T is private;
   NB_MAX_OF_PARAMETERS    : INTEGER;
package Generic_Stack is
  procedure Push (E: Element_T);
  function Pop return Element_T;
end Generic_Stack;

package body Instanciate is
  package Float_Stack is new Generic_Stack (Float);
begin
  Float_Stack.Push (45.8);
end Instanciate; '. 

	ent := model findEntityNamed: 'Float_Stack'.
	self assert: ent notNil.
	self assert: ent class equals: ADAGenericPackageInstanciation.
	self assert: ent container name equals: 'Instanciate'.
	self assert: ent generic name equals: 'Generic_Stack'.

	ent := model findEntityNamed: 'Instanciate'.
	self assert: ent outgoingInvocations size equals: 1.
	self assert: ent outgoingInvocations anyOne to first name equals: 'Push'.
	self assert: ent outgoingInvocations anyOne to first container name equals: 'Generic_Stack'.

	ent := model findEntityNamed: 'Generic_Stack'.
	self assert: ent instances size equals: 1.
	self assert: ent instances first name equals: 'Float_Stack'
]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testVisitGenericSubprogramInstanciation [
	| inst gen  |
	self parseAndVisit: {self genericFctWithParamFct . self genericFunctionInstanciation}. 

	inst := model findEntityNamed: 'Power_Int'.
	self assert: inst notNil.
	self assert: inst class equals: ADAGenericSubprogramInstanciation.
	self assert: inst container name equals: 'INSTANCE'.
	self assert: inst generic name equals: 'Power'.

	self assert: inst signature equals: 'Power_Int(Element_T;Element_T): Element_T'.
	self assert: inst parameters size equals: 2.
	self assert: inst declaredType name equals: 'Element_T'.
	self assert: inst incomingInvocations size equals: 1.
	self assert: inst incomingInvocations anyOne from name equals: 'INSTANCE'.

	gen := model findEntityNamed: 'Power'.
	self assert: gen instances size equals: 1.
	self assert: gen instances first name equals: 'Power_Int'.

]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testVisitPackageBodyWithQualifiedName [
	self parseAndVisit: '
package body OWNER.PCKG is
end OWNER.PCKG;'.

	self assert: model allAdaPackages size equals: 1.
	self assert: (model allWithType: ADAUnknownContainer) size equals: 1.
	self assert: (model entities detect: [ :e | e name = 'PCKG']) container name equals: 'OWNER'
]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testVisitPackageDeclarationWithQualifiedName [
	self parseAndVisit: '
package OWNER.PCKG is
end OWNER.PCKG;'.

	self assert: model allAdaPackages size equals: 1.
	self assert: (model allWithType: ADAUnknownContainer) size equals: 1.
	self assert: (model entities detect: [ :e | e name = 'PCKG']) container name equals: 'OWNER'
]

{ #category : #'tests-AdaEntities' }
LwsAdaRefNameResolutionTest >> testVisitSubprogramInstanciationBeforeGeneric [
	| inst |
	self parseAndVisit: { self genericFunctionInstanciation . self genericFctWithParamFct}. 

	inst := model findEntityNamed: 'Power_Int'.
	self assert: inst notNil.
	self assert: inst class equals: ADAGenericSubprogramInstanciation.
	self assert: inst container name equals: 'INSTANCE'.
	self assert: inst generic name equals: 'Power'.

	self assert: inst signature equals: 'Power_Int(Element_T;Element_T): Element_T'.
	self assert: inst parameters size equals: 2.
	self assert: inst declaredType name equals: 'Element_T'.
	self assert: inst incomingInvocations size equals: 1.
	self assert: inst incomingInvocations anyOne from name equals: 'INSTANCE'.

]

{ #category : #running }
LwsAdaRefNameResolutionTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
