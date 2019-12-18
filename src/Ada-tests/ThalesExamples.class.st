"
Gathers various code samples sent by Thales.

Implemented as selector on the class side

"
Class {
	#name : #ThalesExamples,
	#superclass : #Object,
	#category : #'Ada-tests-samples'
}

{ #category : #'chef-dependencies' }
ThalesExamples class >> ChefTestP1 [
	^ '
package body P1 is

   procedure P1Sub1 is
	  function P1Sub2(iP1 : in integer) return P2.P2Typ1 is
 	  begin
       null;
  	  end P1Sub2;

     localP1Var: P2.P2Typ1;
   begin
       P2.P2Var1 := 1;
       localP1Var := P2.P2Sub1(P2.P2Var1);
       P1Sub1;
   end P1Sub1;

end P1;
'
]

{ #category : #'chef-dependencies' }
ThalesExamples class >> ChefTestP2 [
	^ '
package body P2 is
  subtype P2Typ1 is Integer;

	P2Var1 : Integer;

   function P2Sub1(iP2 : in integer) return P2Typ1 is
   begin
       P1.P1Sub1;
   end P2Sub1;

	task body P2Task1 is
	  localP2Var: P2Typ1;
	begin
	  P2Var1 := 1;
	  localP2Var := P2Sub1(P2Var1);
	end P2Task1;
end P2;
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> callingFunctionWithStringName [
	^ 'package body A_LINK_TEST_TO_A is

   function "NOT"(MSG :INTEGER)
		  return INTEGER is
   begin
      return ("NOT"(12));
   end "NOT";
   
end A_LINK_TEST_TO_A;'
]

{ #category : #'large-samples' }
ThalesExamples class >> common_types_ads [
	^ 'with TRACKING_TYPES;

package COMMON_TYPES is
   subtype T_UNSIGNED is INTEGER range 0 .. 65536;
   subtype T_TEST_FINAL is INTEGER range 0 .. 0;
	
   MIN_CARTES_POSIT : constant INTEGER := -1;
   MAX_CARTES_POSIT : constant INTEGER := 1;
  
   subtype T_MAIN_CODE is INTEGER;
   subtype T_CODE is T_MAIN_CODE range 1 .. 20;
   subtype T_CARTES_POSIT is INTEGER range MIN_CARTES_POSIT .. MAX_CARTES_POSIT;

   type T_3D_CARTES_COORD is
      record
         X : T_CARTES_POSIT;
         Y : T_CARTES_POSIT;
         Z : T_CARTES_POSIT;
      end record;

   type T_3D_POLAR_COORD is
      record
         RAN  : TRACKING_TYPES.T_RANGE;
         ELEV : TRACKING_TYPES.T_ELEVATION;
         AZIM : TRACKING_TYPES.T_AZIMUTH;      
      end record;
   
end COMMON_TYPES;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> communication_services_adb [
	^ 'package body COMMUNICATION_SERVICES is

    package body MSG_MANAGER is separate;
end COMMUNICATION_SERVICES;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> communication_services_ads [
	^ 'with MAILBOX_MANAGER;
with CSCI_DEFINITIONS;

package COMMUNICATION_SERVICES is
   subtype T_MAILBOX_ID is MAILBOX_MANAGER.MAILBOX;

   type T_CHANNEL_NUMBER is
     (UNKNOWN,
      RADAR_TO_INPUT_RADAR,
      INPUT_RADAR_TO_SURVEILLANCE,
      SURVEILLANCE_TO_INPUT_RADAR,
     GESTION_TO_INPUT_RADAR,
     GESTION_TO_SURVEILLANCE);

   subtype T_MSG_CODE is INTEGER range 0 .. 65536;

   package MSG_MANAGER is
      type T_HEAD is private;

      type T_MSG is access T_HEAD;

      function CHANNEL_NUMBER_OF (THIS_MSG : in T_MSG) return T_CHANNEL_NUMBER;

      function WAIT_AND_DO_SOMETHING(FROM_MAILBOX : in T_MAILBOX_ID;
                                     RECEPTION_TASK : CSCI_DEFINITIONS.T_ACTIVE_CSC)
                                     return T_MSG;
      function MSG_CODE_OF (THIS_MSG : in T_MSG) return T_MSG_CODE;

      procedure SEND(VIA_CHANNEL : in T_CHANNEL_NUMBER;
                     THIS_MSG : in T_MSG);

   private

      type T_HEAD is
         record
            CHAMP_A : INTEGER;
            CHAMP_B : INTEGER;
         end record;
   end MSG_MANAGER;

end COMMUNICATION_SERVICES;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> communication_services_msg_manager [
	^ 'separate(COMMUNICATION_SERVICES)

package body MSG_MANAGER is

   function CHANNEL_NUMBER_OF (THIS_MSG : in T_MSG) return T_CHANNEL_NUMBER is
   begin
      return UNKNOWN;
   end;

   function MSG_CODE_OF(THIS_MSG : in T_MSG) return T_MSG_CODE is
   begin
      return 2;
   end;

   procedure SEND(VIA_CHANNEL : in T_CHANNEL_NUMBER;
                  THIS_MSG : in T_MSG) is
   begin
      null;
   end SEND;

   function WAIT_AND_DO_SOMETHING (FROM_MAILBOX : in T_MAILBOX_ID;
                                   RECEPTION_TASK : in CSCI_DEFINITIONS.T_ACTIVE_CSC) return T_MSG is
   MSG_POINTER : T_MSG;
   begin
      return MSG_POINTER;
   end WAIT_AND_DO_SOMETHING;

end MSG_MANAGER;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> csci_definitions [
	^ 'package CSCI_DEFINITIONS is

   type T_ACTIVE_CSC_STATUS is
     (INOPERATIVE,
      LOCKED,
      OPERATIVE);

   type T_ORIGIN_OR_DESTINATION is
     (UNKNOWN,
      RADAR,
      INPUT_RADAR,
      SURVEILLANCE);

   subtype T_ACTIVE_CSC is T_ORIGIN_OR_DESTINATION range RADAR .. SURVEILLANCE;
end CSCI_DEFINITIONS;
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> desensibizedAicEngAttainabilityComputationRequestAdb [

	^ '
with ADA.UNCHECKED_CONVERSION;
with ADA.EXCEPTIONS;
with ADA.CHARACTERS.LATIN_1;
with UTILS;

with ADA.STRINGS.UNBOUNDED;
with MESSAGE_COMMON_TYPES;
with TRACK_TYPES.UTILITIES;


package body AIC_ENG_ATTAINABILITY_COMPUTATION_REQUEST is

   CRLF : constant STRING := ADA.CHARACTERS.LATIN_1.CR & ADA.CHARACTERS.LATIN_1.LF;
 
   C_HEADER_SIZE_IN_BYTES : constant := MESSAGE_COMMON_TYPES.C_MSG_HEADER_SIZE;

end AIC_ENG_ATTAINABILITY_COMPUTATION_REQUEST;
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> desensibizedMessageCommonTypesAds [

	^ '
with BASIC_DEFINITIONS; 
 
package MESSAGE_COMMON_TYPES is 
 
 ------------------------------------------------------------------------------ 
 -- Definition of Messages Header between the CSCIS of C2 
 ------------------------------------------------------------------------------ 
 
 -- Message Code 
 subtype T_MSG_CODE is BASIC_DEFINITIONS.T_IO_32_UNSIGNED; 
 
 -- Length in bytes 
 subtype T_MSG_LENGTH is BASIC_DEFINITIONS.T_32_INTEGER; 
 
 -- Lenth of Message header (for Line MessageS) 
 C_MSG_HEADER_SIZE : constant := 8; 
 
 -- Header of all Messages between CSCIs of C2 
 type T_MSG_HEADER is 
 record 
 MSG_CODE : T_MSG_CODE; 
 MSG_LENGTH : T_MSG_LENGTH; 
 end record; 
 
 type T_ACCESS_MSG_HEADER is access T_MSG_HEADER; 
 
end MESSAGE_COMMON_TYPES ; 
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> duplicateProcedureName [
	^ 'package bug is
type enum is(CREATE,DELETE);
	
procedure CREATE(A : in INTEGER; B : in BOOLEAN);
procedure CREATE;
	
end bug;'
]

{ #category : #'large-samples' }
ThalesExamples class >> global_ads [
	^ 'package GLOBAL is

   type T_EVENT is (UNKNOWN, ALARM);

   subtype T_5_UNSIGNED is INTEGER range 0 .. 112;
   type T_IO_5_UNSIGNED is new T_5_UNSIGNED;
   type T_IO_5_UNSIGNED_ARRAY is array (INTEGER range <>) of T_IO_5_UNSIGNED;

end GLOBAL;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> input_radar_adb [
	^ 'with COMMUNICATION_SERVICES;
with CSCI_DEFINITIONS;
with PISTE_3D;

package body INPUT_RADAR is

   procedure START (REACHED_STATUS : out CSCi_DEFINITIONS.T_ACTIVE_CSC_STATUS) is
   begin
      null;
   end START;

   task type T_TA_INPUT_RADAR is
      entry START;
   end T_TA_INPUT_RADAR;

   task body T_TA_INPUT_RADAR is
      MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
   begin
     loop
       MSG_POINTER := COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_DO_SOMETHING(FROM_MAILBOX => MBX, RECEPTION_TASK => CSCI_DEFINITIONS.INPUT_RADAR);
       case COMMUNICATION_SERVICES.MSG_MANAGER.CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
       when COMMUNICATION_SERVICES.RADAR_TO_INPUT_RADAR =>
         case COMMUNICATION_SERVICES.MSG_MANAGER.MSG_CODE_OF(THIS_MSG => MSG_POINTER) is
         when PISTE_3D.MSG_CODE =>
                COMMUNICATION_SERVICES.MSG_MANAGER.SEND(VIA_CHANNEL => COMMUNICATION_SERVICES.INPUT_RADAR_TO_SURVEILLANCE, THIS_MSG => MSG_POINTER);
         when PISTE_2D.MSG_CODE =>
           null;
         when others =>
           null;
         end case;
       when COMMUNICATION_SERVICES.GESTION_TO_INPUT_RADAR =>
         null;
       when others =>
         null;
       end case;
      end loop;
   end T_TA_INPUT_RADAR;
end INPUT_RADAR;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> input_radar_ads [
	^ 'with COMMUNICATION_SERVICES;
with CSCI_DEFINITIONS;

package INPUT_RADAR is
   MBX : COMMUNICATION_SERVICES.T_MAILBOX_ID := PISTE_3D.MSG_CODE;   -- NA: changed initialization to test constante access

   task type T_TA_INPUT_RADAR is
      entry START;
   end T_TA_INPUT_RADAR;

   procedure START (REACHED_STATUS : out CSCI_DEFINITIONS.T_ACTIVE_CSC_STATUS);

end INPUT_RADAR;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> mailbox_manager_adb [
	^ 'package body MAILBOX_MANAGER is

   function RECEIVE (MBX : in MAILBOX) return BOOLEAN is
   begin
      return FALSE;
   end RECEIVE;

end MAILBOX_MANAGER;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> mailbox_manager_ads [
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

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorAcceptWithParameters [

		^ '
procedure ACCEPT_WITH_PARAMETERS is
begin
   case A_VARIABLE is
    when ACCEPT_START =>
      accept START (INFO_INDEX : in BsTy.INT_16) do
         LINE_INFO_INDEX := INFO_INDEX;
         LINE_INFO_TABLE(LINE_INFO_INDEX).RECEIVER_CONTROL := RUNNING;
      end START;
   end case;
end ACCEPT_WITH_PARAMETERS;'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorComponentAssociationOther [
		^  '
package MACHIN is
 var : Basic_Definitions.T_Io_8_Unsigned_Array(1..10) := (others =>0);
end MACHIN;'

]

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorEntryStartInSeparate [

		^  '
package MACHIN1 is
task TOTO1 is
pragma Priority(35);
entry START (Fs:in Float);
end TOTO1;
end MACHIN1;'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorTopLevelFunction [
"uses type from other example: parsingErrorTypeAccessProcedure"
	^ '
function ATAN_2 (X : MACHIN2.Toto2) return MACHIN2.Toto2 is
   A : MACHIN2.Toto2;
begin
   return A;
end ATAN_2;
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorTypeAccessProcedure [
"caution, also needed for parsingErrorTopLevelFunction"
		^  '
package MACHIN2 is
type Toto2 is access procedure(Result: in Integer);
end MACHIN2;'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> parsingErrorWithTaskPointer [
	^ '
package body access_to_Task is
 task type client_read (server_id : t_server_id_access) is
   entry read (
		data : out ada_connect.data_buffer;
		received : out ada_connect.data_length;
		done : out boolean);
 end client_read;

 type client_read_access is access client_read;

 type client_read_access_array is array (ressources_definition.t_active_csc) of client_read_access;

 client_reader : client_read_access_array;
 begin
   client_reader (1).read (tmp_buffer, received, msg_found);
end access_to_Task;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> piste_2d_ads [
	^ 'with COMMON_TYPES;
with TRACKING_TYPES;
with BASIC_DEFINITIONS;


package PISTE_2D is
   -- code du message
  MSG_CODE : constant COMMON_TYPES.T_UNSIGNED:= 2;

end PISTE_2D;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> piste_3d_ads [
	^ 'with COMMON_TYPES;
with TRACKING_TYPES;
with BASIC_DEFINITIONS;


package PISTE_3D is
  package MAIN_TRACKING_TYPES renames TRACKING_TYPES;
  E_CONSTRAINT_ERROR_MSG : exception;

  -- code du message
  MSG_CODE : constant COMMON_TYPES.T_UNSIGNED:= 2;

  subtype T_TEST is MAIN_TRACKING_TYPES.T_TEST;
   
  
  subtype T_NBR_PLOTS is INTEGER range 0 .. 10;
  subtype T_PLOTS_RANGE is INTEGER range T_NBR_PLOTS''FIRST + 1 .. T_NBR_PLOTS''LAST;

  subtype T_TRACK_TYPE is MAIN_TRACKING_TYPES.T_TRACK_TYPE;

  type T_CHANNEL is (AVION, BATEAU);

  type T_MSL_MODE is (MANUEL, AUTOMATIQUE);


  -- PISTE 3D
  type T_3D_TRACK_BEG is
      record
         TEST            : T_TEST;
         CODE            : TRACKING_TYPES.T_TRACK_CODE;
         TRACK_TYPE      : T_TRACK_TYPE;
         UPDATING_MODE   : T_MSL_MODE;
         TRACK_STATUS    : MAIN_TRACKING_TYPES.T_TRACK_STATUS;
         CHANNEL         : T_CHANNEL;
         CARTES_POSIT    : COMMON_TYPES.T_3D_CARTES_COORD;
         JAMMER_PRESENCE : BOOLEAN;
         NBR_PLOTS       : T_NBR_PLOTS;
         POLAR_POSIT     : COMMON_TYPES.T_3D_POLAR_COORD;
      end record;

   type T_3D_TRACK_PLOT is
      record
         SYS_TIME            : TRACKING_TYPES.SYS_TIME_SERVICES.T_SYS_TIME;
         POLAR_POSIT         : COMMON_TYPES.T_3D_POLAR_COORD;
         MULTITARGET_PRESUMP : BOOLEAN;
      end record;


   subtype T_PLOT_RANGE is INTEGER range 0 .. 1;

   type T_LIST_PLOTS is array (T_PLOTS_RANGE) of T_3D_TRACK_PLOT;
   --NULL_LIST_PLOTS : constant T_LIST_PLOTS := (others => NULL_3D_TRACK_PLOT);

   --------------------------------------
   -- Format applicatif
   --------------------------------------
   type T_3D_TRACK is
      record
         BEG        : T_3D_TRACK_BEG;
         LIST_PLOTS : T_LIST_PLOTS;
      end record;
   
   type T_ACCESS_3D_TRACK is access T_3D_TRACK;
   
   --------------------------------------
   -- Format ligne
   --------------------------------------
   MAX_SIZE : CONSTANT := 1;
   subtype T_IO_ROUGH_3D_TRACK is BASIC_DEFINITIONS.T_IO_ARRAY(1 .. MAX_SIZE);
   
   function LINE_MSG(MSG : in T_3D_TRACK) return T_IO_ROUGH_3D_TRACK;
   

end PISTE_3D;
'
]

{ #category : #'model-building-errors' }
ThalesExamples class >> range [
	^ '
package CASTTO_B is

   subtype T_N_SAMPLES is Integer range 0..10;
   subtype T_SAMPLES is T_N_SAMPLES range 1..T_N_SAMPLES''Last;

   --type T_OTHER_TYPE is private;
   type T_OTHER_TYPE is
      record
	 COURSE: Integer;
	 ROLLING: Integer;
	 PITCHING: Integer;
      end record;


end CASTTO_B;


with CASTTO_B;
package CASTTO_A is

   type T_T_PROBLEM is
     array(CASTTO_B.T_SAMPLES range <>) of CASTTO_B.T_OTHER_TYPE;
   subtype T_PROBLEM is
     T_T_PROBLEM (CASTTO_B.T_SAMPLES range 1..5);

   function f_A return T_PROBLEM;

end CASTTO_A;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> request_signal [
	^ '
with COMMON_TYPES;

package REQUEST_SIGNAL is
   -- code du message
  MSG_CODE : constant COMMON_TYPES.T_UNSIGNED:= 3;


   --------------------------------------
   -- Format applicatif
   --------------------------------------
   type T_REQUEST_SIGNAL is
      record
         null; --> signal = pas de donnees
      end record;


   type T_ACCESS_REQUEST_SIGNAL is access T_REQUEST_SIGNAL;
   
end REQUEST_SIGNAL;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> send_and_record_if_necessary [
	^ 'with COMMUNICATION_SERVICES;
with GLOBAL;
procedure SEND_AND_RECORD_IF_NECESSARY (SOURCE_MSG_CODE : in COMMUNICATION_SERVICES.T_MSG_CODE;
                                        SOURCE_MSG_EVENT : in GLOBAL.T_EVENT := GLOBAL.UNKNOWN;
                                        SOURCE_MSG_ROUGH_DATA : in GLOBAL.T_IO_5_UNSIGNED_ARRAY;
                                       VIA_CHANNEL : in COMMUNICATION_SERVICES.T_CHANNEL_NUMBER) is
	A_MSG : T_MSG;
begin
   COMMUNICATION_SERVICES.MSG_MANAGER.SEND(VIA_CHANNEL, A_MSG);
end SEND_AND_RECORD_IF_NECESSARY;

pragma INLINE(SEND_AND_RECORD_IF_NECESSARY);
'
]

{ #category : #'large-samples' }
ThalesExamples class >> surveillance_adb [
	^ 'with PISTE_3D;
with CSCI_DEFINITIONS;
with TRACKS_1;
with TRACKING_TYPES;

package body SURVEILLANCE is

   procedure START (REACHED_STATUS : out CSCI_DEFINITIONS.T_ACTIVE_CSC_STATUS) is
   begin
      null;
   end START;

   procedure TREAT_RADAR_MESSAGES (RADAR_MSG : in COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG);

   task type T_TA_SURVEILLANCE is
      entry START;
   end T_TA_SURVEILLANCE;


   task body T_TA_SURVEILLANCE is
      MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
   begin
     loop
       MSG_POINTER := COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_DO_SOMETHING(FROM_MAILBOX => MBX,
                                                                              RECEPTION_TASK => CSCI_DEFINITIONS.SURVEILLANCE);
       case COMMUNICATION_SERVICES.MSG_MANAGER.CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
       when COMMUNICATION_SERVICES.INPUT_RADAR_TO_SURVEILLANCE =>
         TREAT_RADAR_MESSAGES(RADAR_MSG => MSG_POINTER);
       when COMMUNICATION_SERVICES.GESTION_TO_SURVEILLANCE =>
         null;
       when others =>
         null;
       end case;
     end loop;
   end T_TA_SURVEILLANCE;

   procedure CREATE_OR_MAINTAIN (TRACK : in PISTE_3D.T_3D_TRACK) is
      TRACK_REFERENCE : TRACKS_1.T_REFERENCE;
      TRACK_CODE : TRACKING_TYPES.T_TRACK_CODE;
   begin
      TRACKS_1.TREAT(CODE => TRACK_CODE, THIS => TRACK_REFERENCE);
   end CREATE_OR_MAINTAIN;

   procedure TREAT_RADAR_MESSAGES(RADAR_MSG : in COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG) is
      TRACK_3D : PISTE_3D.T_3D_TRACK;
   begin
      case COMMUNICATION_SERVICES.MSG_MANAGER.MSG_CODE_OF(THIS_MSG => RADAR_MSG) is
         when PISTE_3D.MSG_CODE =>
            CREATE_OR_MAINTAIN(TRACK => TRACK_3D);
         when others =>
            null;
      end case;
   end TREAT_RADAR_MESSAGES;

end SURVEILLANCE;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> surveillance_ads [
	^ 'with COMMUNICATION_SERVICES;
with CSCI_DEFINITIONS;

package SURVEILLANCE is
   MBX : COMMUNICATION_SERVICES.T_MAILBOX_ID := null;
    task type T_TA_SURVEILLANCE is
      entry START;
    end T_TA_SURVEILLANCE;
   procedure START (REACHED_STATUS : out CSCI_DEFINITIONS.T_ACTIVE_CSC_STATUS);

end SURVEILLANCE;
'
]

{ #category : #'simpleTask-sample' }
ThalesExamples class >> task_1_adb [
	^ 'package body TASK_1 is

	task body T_TA_TASK_1 is
		MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
	begin
	  loop
		 MSG_POINTER := COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_BLABLA(
				FROM_MAILBOX => MBX,
				RECEPTION_TASK => CSCI_DEFINITIONS.TASK_1);
		case COMMUNICATION_SERVICES.MSG_MANAGER.CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
		when COMMUNICATION_SERVICE.EQUIPEMENT_1_TO_TASK_1 =>
			case COMMUNICATION_SERVICES.MSG_MANAGER.MSG_CODE_OF(THIS_MSG => MSG_POINTER) is
			when MESSAGE_1.MSG_CODE =>
				COMMUNICATION_SERVICES.MSG_MANAGER.SEND(
								VIA_CHANNEL => COMMUNICATION_SERVICES.TASK_1_TO_TASK_2,
								MSG	=> MSG_POINTER);
			when MESSAGE_2.MSG_CODE =>
				NULL;
			end case;
		when COMMUNICATION_SERVICES.TASK_6_TO_TASK_1 =>
			NULL;
		end case;
	 end loop;
	end T_TA_TASK_1;
end TASK_1;'
]

{ #category : #'simpleTask-sample' }
ThalesExamples class >> task_1_ads [
	^ 'package TASK_1 is
	MBX : COMMUNICATION_SERVICES.MAILBOX_ID := null;
end TASK_1;'
]

{ #category : #'simpleTask-sample' }
ThalesExamples class >> task_2_adb [
	^ 'package body TASK_2 is

	task body T_TA_TASK_2 is
		MSG_POINTER : COMMUNICATION_SERVICES.MSG_MANAGER.T_MSG;
	begin
		loop
			MSG_POINTER := COMMUNICATION_SERVICES.MSG_MANAGER.WAIT_AND_BLABLA(
				FROM_MAILBOX => MBX,
				RECEPTION_TASK => CSCI_DEFINITIONS.TASK_1);
			case COMMUNICATION_SERVICES.MSG_MANAGER.CHANNEL_NUMBER_OF(THIS_MSG => MSG_POINTER) is
				when COMMUNICATION_SERVICES.TASK_1_TO_TASK_2 =>
					case COMMUNICATION_SERVICES.MSG_MANAGER.MSG_CODE_OF(THIS_MSG => MSG_POINTER) is
						when MESSAGE_3.MSG_CODE =>
							COMMUNICATION_SERVICES.MSG_MANAGER.SEND(
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

{ #category : #'simpleTask-sample' }
ThalesExamples class >> task_2_ads [
	^ 'package TASK_2 is
	MBX : COMMUNICATION_SERVICES.MAILBOX_ID := null;
end TASK_2;'
]

{ #category : #'large-samples' }
ThalesExamples class >> tracking_types [
	^ '
package TRACKING_TYPES is

   type T_TRACK_CODE is
      record
         A : INTEGER;
         B : INTEGER;
      end record;
   
   --subtype T_TEST_2 is COMMON_TYPES.T_TEST_FINAL;
   subtype T_TEST_2 is INTEGER;
   subtype T_TEST is TRACKING_TYPES.T_TEST_2;
		
   type T_TRACK_TYPE is (MODE_1, MODE_2, MODE_3);
   type T_TRACK_STATUS is (NOUVELLE_PISTE, MISE_A_JOUR);
	
   MIN_ELEVATION : constant FLOAT := -2.0;
   MAX_ELEVATION : constant FLOAT := 2.0;
  	
   MIN_AZIMUTH : constant FLOAT := -3.4;
   MAX_AZIMUTH : constant FLOAT := 6.8;
  	
   MIN_RANGE : constant FLOAT := 1_158.4;
   MAX_RANGE : constant FLOAT := 3_000.8;
  
   subtype T_ANGLE is FLOAT digits 6;
    
   subtype T_ELEVATION is T_ANGLE range MIN_ELEVATION .. MAX_ELEVATION;
   subtype T_AZIMUTH is T_ANGLE range MIN_AZIMUTH .. MAX_AZIMUTH;
   subtype T_RANGE is T_ANGLE range MIN_RANGE .. MAX_RANGE;

   type LARGE_INTEGER is	
      record		
         L0: INTEGER;
         L1: INTEGER;
      end record;

   package SYS_TIME_SERVICES is
      subtype T_SYS_TIME is TRACKING_TYPES.LARGE_INTEGER;
   end SYS_TIME_SERVICES;

end TRACKING_TYPES;

'
]

{ #category : #'large-samples' }
ThalesExamples class >> tracks_1_Kinematic [
	^ 'separate(TRACKS_1)

package body KINEMATIC is

   procedure SEND_TO_OPERATOR (CODE : in TRACKING_TYPES.T_TRACK_CODE;
                               THIS : in T_REFERENCE) is
   begin
      SEND_AND_RECORD_IF_NECESSARY ( SOURCE_MSG_CODE => ALARM.MSG_CODE,
                                     SOURCE_MSG_EVENT => GLOBAL_DEF.ALARM,
                                     SOURCE_MSG_ROUGH_DATA => ALARM_LINE_MSG,
                                     VIA_CHANNEL => COMMUNICATION_SERVICE.SURVEILLANCE_TO_OPERATOR);
   end SEND_TO_OPERATOR;


end KINEMATIC;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> tracks_1_adb [
	^ 'package body TRACKS_1 is

   procedure TREAT(CODE : in TRACKING_TYPES.T_TRACK_CODE;
                   THIS : in T_REFERENCE) is
   begin
      if(THIS.IS_OK) then
         CHARACTERIZATION.SEND_TO_OPERATOR(CODE, THIS); -- Les noms des paramètres ne sont pas toujours rappelés ....
         KINEMATIC.SEND_TO_OPERATOR(CODE => CODE, THIS => THIS);
      end if;

   end TREAT;

   package body CHARACTERIZATION is separate;
   package body KINEMATIC is separate;
end TRACKS_1;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> tracks_1_ads [
	^ 'with TRACKING_TYPES;

package TRACKS_1 is
   type T_REFERENCE is private;



   package CHARACTERIZATION is
      procedure SEND_TO_OPERATOR (CODE : in TRACKING_TYPES.T_TRACK_CODE;
                            THIS : in T_REFERENCE);
   end CHARACTERIZATION;

   package KINEMATIC is
      procedure SEND_TO_OPERATOR (CODE : in TRACKING_TYPES.T_TRACK_CODE;
                            THIS : in T_REFERENCE);
   end KINEMATIC;

   procedure TREAT (CODE : in TRACKING_TYPES.T_TRACK_CODE;
                    THIS : in T_REFERENCE);

   private

   type T_DATA;
   type T_REFERENCE is access T_DATA;

   type T_DATA is
      record
         IS_OK : BOOLEAN;
      end record;
end TRACKS_1;
'
]

{ #category : #'large-samples' }
ThalesExamples class >> tracks_1_characterization [
	^ 'separate(TRACKS_1)

package body CHARACTERIZATION is

   procedure SEND_TO_OPERATOR (CODE : in TRACKING_TYPES.T_TRACK_CODE;
                               THIS : in T_REFERENCE) is
   begin
      SEND_AND_RECORD_IF_NECESSARY ( SOURCE_MSG_CODE => ALARM.MSG_CODE,
                                    SOURCE_MSG_EVENT => GLOBAL_DEF.ALARM,
                                     SOURCE_MSG_ROUGH_DATA => ALARM_LINE_MSG,
                                     VIA_CHANNEL => COMMUNICATION_SERVICE.SURVEILLANCE_TO_OPERATOR);
   end SEND_TO_OPERATOR;


end CHARACTERIZATION;

'
]
