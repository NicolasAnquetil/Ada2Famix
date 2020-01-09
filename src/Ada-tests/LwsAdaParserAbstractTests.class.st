Class {
	#name : #LwsAdaParserAbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Ada-tests-ThalesDefRef'
}

{ #category : #samples }
LwsAdaParserAbstractTests >> callerOfReplace_Elmt [
	^ '
Procedure callIt is
var1 , var2 , var3 , var4 : Integer;
begin
  Linked_List.Replace_Elmt(var1, var2, var3, var4);
end callIt;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> functionNameIsString [
	^ 'function "&" (S: String; I: Integer) return String is
   begin
      return S & ItoS(I);
   end;

'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> genericFctWithParamFct [
	^ '
generic
  type Element_T is private;
  with function mult(X, Y: Element_T) return Element_T;
function Power (A, B: Element_T) return Element_T;

function Power (A, B: Element_T) return Element_T is
begin
  return mult(A, B);   -- and repeat ...
end Power;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> genericFunctionInstanciation [
	^ '
procedure INSTANCE is
  function INT_PROD(I, J: INTEGER) return INTEGER;
  function Power_Int is new Power
    (Element_T => INTEGER, mult => INT_PROD);
  A : Integer := 0;
begin
  A := Power_Int(A,A);
end INSTANCE;  '
]

{ #category : #samples }
LwsAdaParserAbstractTests >> genericPackageInstanciation [
	^ '
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
end Instanciate; '
]

{ #category : #samples }
LwsAdaParserAbstractTests >> ifStatement [
	^ '
Procedure Simple(X : in Integer) is
begin
  if (X > 0)
	then X := 0;
end if;
end Simple;
'
]

{ #category : #accessing }
LwsAdaParserAbstractTests >> model [
	^ model
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageBodyWithProcedureExample [
	^ '
 package body Linked_List is
   Procedure Replace_Elmt(w: Integer; x:in Integer; y:in out Integer; z:out integer) is
	begin
	  z := w + x + y;
	  put(first => x);
	  y:=1;
	end Replace_Elmt;
 end Linked_List;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithBody [
	^ '
package body STACK is
begin
	null;
end STACK;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithFunctionExample [
	^ '
 package  Linked_List is
	Function Allocate_New_Node return int;
 end Linked_List;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithNamedNumbers [
	^ ' 
package Linked_List is  
	MSG_CODE : constant := 16#000000FF#;
	MAX_SIZE : constant := 6;
end;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithProcedureExample [
	^ '
 package  ListElems is
   Procedure Replace_Elmt;
 end ListElems;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithSeparate [
	^ 'package body MSG_MANAGER is

    procedure SEND is separate;
end MSG_MANAGER;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithSubtypes [
	^ '
with MAILBOX_MANAGER;
package body MESSAGES is
   type MESSBOX is access MAILBOX_MANAGER.MAILBOX_INFO;
   subtype T_MESSBOX_ID is MESSBOX;
   subtype T_CODE is INTEGER range 0 .. 65536;
   subtype T_PLOTS_RANGE is INTEGER range T_NBR_PLOTS''FIRST + 1 .. T_NBR_PLOTS''LAST;

end MESSAGES;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithTwoTypes [
	^ '
  package body Linked_List is

    type List_Item is record
                        Data       : Item_To_Manage := Illegal_Value ;
                        Prior_Item : List_Item      := Empty_Node    ;
                        Next_Item  : List_Item      := Empty_Node    ;
                      end record ;
  
  type Status_value is (empty, partially_full, full);

  Empty_Node : Constant List_Item ;  

end Linked_List;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> packageWithVariables [
	^ ' 
package Linked_List is  
    Empty_Node : Constant List_Node ;  
    List_Exception : Boolean ;       
    Empty_List_After_Deletion : Boolean ; 
end;
'
]

{ #category : #running }
LwsAdaParserAbstractTests >> parse: aStreamOrSource [
	| aStream |
	aStream := aStreamOrSource isStream 
		ifTrue: [ aStreamOrSource ] 
		ifFalse: [ ReadStream on: aStreamOrSource ].
	^(LwsParser on: aStream) parse

	
]

{ #category : #running }
LwsAdaParserAbstractTests >> parseAndVisit: input [
	| importer res |
	res := ((input isStream or: [input isString])
				ifTrue: [(self parse: input) entities]
				ifFalse: [input flatCollect: [:i | (self parse: i) entities]]).

	self visitorClasses do: [ :aClass |
		importer := aClass new model: model; yourself.
		[importer programPath: 'testPath'] on: MessageNotUnderstood do: [].
		res do: [ :e | importer visit: e]
	]
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureDeclarationAndDefinition [
	^ '	procedure Simple1;
   procedure Simple1 is
	begin
	  Put;
	end Simpel1;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureInProcedureInPackage [
	^ '
package body Linked_List is

   procedure Simple1 is
   procedure P1 is
   begin
       Put;
   end P1;
   function F1 return BOOLEAN is
   begin
      Put;
   end F1;
begin
  Put;
end Simple1;

end Linked_List;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureInSeparate [
	^ 'separate(MSG_MANAGER)
   procedure SEND is
   begin
      null;
   end SEND;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureWithDeclare [
	^ 'procedure Handle_Value is
	begin
	declare
     V: Integer;
     begin
       v := 1;
     end;  -- declare
	end Handle_Value;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureWithTwoTasks [
	^ 'procedure Task1 is
   task First_Task;
   task body First_Task is
   begin
      Put("This is in First_Task, pass number ");
   end First_Task;

   task Second_Task;
   task body Second_Task is
   begin
     Put("This is in Second_Task, pass number");
   end Second_Task;
begin
   Put_Line("This is in the main program.");
end Task1;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureWithVariables [
	^ 'procedure ReadOut is
   S: String(1..100);
   N: Integer;
begin
	put;
end ReadOut;
 '
]

{ #category : #samples }
LwsAdaParserAbstractTests >> procedureWithoutPackage [
	^ ' procedure P2 is
   begin
       Put;
   end P2;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> separatePackageInner1 [
	^ 'separate(P_MAIN)

package body P_INSIDE1 is 
end P_INSIDE1;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> separatePackageInner2 [
	^ 'separate(P_MAIN)

package body P_INSIDE2 is 
end P_INSIDE2;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> separatePackageMainDecl [
	^ 'package body P_MAIN is

   package P_INSIDE1 is
	end P_INSIDE1;

   package P_INSIDE2 is
	end P_INSIDE2;
end P_MAIN;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> separatePackageMainDef [
	^ 'package body P_MAIN is

    package body P_INSIDE1 is separate;
    package body P_INSIDE2 is separate;
end P_MAIN;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> separateWithSeparate [
	^ '	
package TOP is
  package FIRST_SEPARATE is
    package SECOND_SEPARATE is
    end SECOND_SEPARATE;
  end FIRST_SEPARATE;
end TOP;

package body TOP is
  package body FIRST_SEPARATE is separate;
end TOP;

separate (TOP)
package body FIRST_SEPARATE is
  package body SECOND_SEPARATE is separate;
end FIRST_SEPARATE;

separate (TOP.FIRST_SEPARATE)
package body SECOND_SEPARATE is
end SECOND_SEPARATE;
'
]

{ #category : #running }
LwsAdaParserAbstractTests >> setUp [
	model := ADAModel new
]

{ #category : #samples }
LwsAdaParserAbstractTests >> stackPackageExample [
	^ '
package STACK is
end STACK;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> taskTypeWithProcedure [
	^ '
package body NAVS_Interface is

   task type T_TA_PMPI_NAVS is
      pragma PRIORITY (RESSOURCES_DEFINITION.PRIORITY_OF_TA_NAVS);
      entry START;
   end T_TA_PMPI_NAVS;

   TA_PMPI_NAVS : T_TA_PMPI_NAVS;


   -----------------------------------------------------------------------------
   procedure START  is
   -----------------------------------------------------------------------------
   begin
    TA_PMPI_NAVS.START;
   end START;


end NAVS_Interface;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> taskWithThalesCase [
	"standalone and simplified version of ThalesExample class>>surveillance_adb"
	^ 'package body SURVEILLANCE is
   procedure TREAT_RADAR_MESSAGES(RADAR_MSG : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG);
	function CHANNEL_NUMBER_OF(THIS_MSG : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG) return integer;

	task body T_TA_SURVEILLANCE is
      MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
   begin
      loop
            MSG_POINTER := WAIT_AND_DO_SOMETHING(FROM_MAILBOX => MBX, RECEPTION_TASK => CSCI_DEFINITIONS.SURVEILLANCE);

            case CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
            when INPUT_RADAR_TO_SURVEILLANCE =>
               TREAT_RADAR_MESSAGES(RADAR_MSG => MSG_POINTER);
             when others =>
               null;
            end case;
      end loop;
   end T_TA_SURVEILLANCE;
end SURVEILLANCE;
'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> taskWithThalesCaseInCase [
	"standalone and simplified version of ThalesExample class>>task_2_adb"
	^ 'package body TASK_2 is

	task body T_TA_TASK_2 is
		MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
	   procedure SEND(VIA_CHANNEL : in COMMUNICATION_SERVICES.T_CHANNEL_NUMBER; MSG : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG);

	begin
		loop
			MSG_POINTER := COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_BLABLA(
				FROM_MAILBOX => MBX,
				RECEPTION_TASK => CSCI_DEFINITIONS.TASK_1);
			case COMMUNICATION_SERVICES.MSG_MANAGER.CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
				when COMMUNICATION_SERVICES.TASK_1_TO_TASK_2 =>
					case COMMUNICATION_SERVICES.MSG_MANAGER.MSG_CODE_OF(THIS_MSG => MSG_POINTER) is
						when MSG_POINTER =>
							TASK_2.T_TA_TASK_2 .SEND(
								VIA_CHANNEL => COMMUNICATION_SERVICES.TASK_2_TO_TASK_1,
								MSG	=> MSG_POINTER);
					end case;
				when COMMUNICATION_SERVICES.TASK_12_TO_TASK_2 =>
					NULL;
			end case;
		end loop;
	end T_TA_TASK_2;
end TASK_2;'
]

{ #category : #samples }
LwsAdaParserAbstractTests >> typeDefUsedInParameter [
	^ 'package MAILBOX_MANAGER is
    type MAILBOX_INFO is
      record
         QUEUE : INTEGER; --Simplification du soustype par INTEGER pour arreter l''arborescence pas utile \u00e0al compr\u00e9hension
      end record;

   type MAILBOX is access MAILBOX_INFO;

   function RECEIVE (MBX : in MAILBOX) return BOOLEAN;

end MAILBOX_MANAGER;
'
]

{ #category : #visitor }
LwsAdaParserAbstractTests >> visitorClasses [
	self subclassResponsibility 
]
