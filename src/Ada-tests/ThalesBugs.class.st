"
Gathers various code samples sent by Thales regarding bugs.

Implemented as selector on the class side

"
Class {
	#name : #ThalesBugs,
	#superclass : #Object,
	#category : #'Ada-tests-samples'
}

{ #category : #'bugs - other generic instantiation' }
ThalesBugs class >> D15_3D_COORDINATES_ads [

	^'package D15_3D_COORDINATES

        is new G_3D_COORDINATES

		(T_FLOAT             => INTEGER);
	'
]

{ #category : #'bugs - other generic instantiation' }
ThalesBugs class >> G_3_D_COORDINATES_ads [

	^'
	generic
	type T_FLOAT                  is digits <>;
	
	package G_3D_COORDINATES         is
	
	end G_3D_COORDINATES;'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> MSG_TOTO_1_ads [

	^'package MSG_TOTO_1 is

  type T_TOTO_1 is
    record
      A : INTEGER;
      B : BOOLEAN;
  end record;

end MSG_TOTO_1;
'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> MSG_TOTO_2_ads [

	^'package MSG_TOTO_2 is

  type T_TOTO_2 is
    record
      C : INTEGER;
      D : BOOLEAN;
  end record;

end MSG_TOTO_2;
'
]

{ #category : #'bugs - proc in proc' }
ThalesBugs class >> bug_example_adb [

	^'with pkg;
package body bug_example is

  type t_toto is (ARTIFACT,TEST,OTHER);
  type t_enum is (''d'',''f'',''g'');

  procedure cased_procedure is

   begin
      declare
         toto : t_toto := ARTIFACT;
         begin


      case toto is
        when ARTIFACT =>
        declare
           package instance is new pkg.generic_package(1);
        begin
          instance.launch;
          instance.stop;
        end;
        when others =>
          null;
         end case;
         end;
  end cased_procedure;

  procedure fast_procedure is
    package dir_pkg is new pkg.generic_package(1);
    use dir_pkg;
  begin
    dir_pkg.launch;
    dir_pkg.stop;
  end fast_procedure;

end bug_example;
'
]

{ #category : #'bugs - proc in proc' }
ThalesBugs class >> bug_example_ads [

	^'
package bug_example is

  procedure cased_procedure ;
  procedure fast_procedure;
end bug_example;
'
]

{ #category : #accessing }
ThalesBugs class >> examplesInCategory: aString [
	"(( self examplesInCategory: 'bugs - separate' ))"

	^ (self class organization listAtCategoryNamed: aString)
		collect: [ :selector | self perform: selector ]
]

{ #category : #'bugs - generic' }
ThalesBugs class >> genericprocedure_adb [

	^'with MSG_TOTO_1;
with MSG_TOTO_2;

package body genericprocedure is

  package msg1 renames MSG_TOTO_1;

type  T_NB_TOTO_1 is range 0..2;
type  T_NB_TOTO_2 is range 0..2;

type T_NB_OF_MSGS is
  record
    NB_TOTO_1 : T_NB_TOTO_1;
    NB_TOTO_2 : T_NB_TOTO_2;
  end record;

NULL_NB_MSGS : constant T_NB_OF_MSGS := (NB_TOTO_1 => 0, NB_TOTO_2 => 0);

NB_MSG : T_NB_OF_MSGS := NULL_NB_MSGS;

type T_LIST_TOTO_1 is array(T_NB_TOTO_1) of MSG_TOTO_1.T_TOTO_1;
type T_LIST_TOTO_2 is array(T_NB_TOTO_2) of MSG_TOTO_2.T_TOTO_2;

type T_LIST_OF_MSGS is
  record
    LIST_TOTO_1 : T_LIST_TOTO_1;
    LIST_TOTO_2 : T_LIST_TOTO_2;
  end record;

LIST_OF_MSG : T_LIST_OF_MSGS;

generic
  type T_NB is range <>;
  type T_MSG is private;
  type T_TAB is array(T_NB) of T_MSG;
  NUMBER : in out T_NB;
  TAB : in out T_TAB;

  procedure GENERIC_TOTO(MSG : in T_MSG);

  procedure GENERIC_TOTO(MSG : in T_MSG) is
  begin
    NUMBER := T_NB''LAST;
    TAB(NUMBER):= MSG;
  end GENERIC_TOTO;

  procedure TOTO_1 is new
    GENERIC_TOTO(T_NB => T_NB_TOTO_1,
      T_MSG => MSG_TOTO_1.T_TOTO_1,
      T_TAB => T_LIST_TOTO_1,
      NUMBER => NB_MSG.NB_TOTO_1,
      TAB => LIST_OF_MSG.LIST_TOTO_1);

  procedure TOTO_2 is new
    GENERIC_TOTO(T_NB => T_NB_TOTO_2,
      T_MSG => MSG_TOTO_2.T_TOTO_2,
      T_TAB => T_LIST_TOTO_2,
      NUMBER => NB_MSG.NB_TOTO_2,
      TAB => LIST_OF_MSG.LIST_TOTO_2);

  procedure signature(PARAM : in MSG_TOTO_1.T_TOTO_1) is
  begin
    null;
  end signature;

end genericprocedure;
'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> genericprocedure_ads [

	^'package genericprocedure is

   pragma Elaborate_Body;

end genericprocedure;
'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> id_internal_msg_ads [

	^'package ID_INTERNAL_MSG is
	INT_ID_TOTO_MESSAGE  : constant Integer := 5201;
end ID_INTERNAL_MSG;'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> instantiation_generique_ads [

	^'with ID_INTERNAL_MSG;
use ID_INTERNAL_MSG;
with POOL_MESSAGE;

package instantiation_generique is
   id : INTEGER := ID_INTERNAL_MSG.INT_ID_TOTO_MESSAGE;
   otherId : INTEGER := INT_ID_TOTO_MESSAGE;
   type T_ENU_TOTO_MESSAGE is (TRN,AZE);
   type REC_TOTO_MESSAGE is
    	record
      		HEAD              : Integer;
      		TOTO_MESSAGE      : T_ENU_TOTO_MESSAGE :=TRN;
    	end record;
   type ACC_TOTO_MESSAGE is access REC_TOTO_MESSAGE;

   package POOL_TOTO_MESSAGE is new POOL_MESSAGE
     (MESSAGE_REC  => REC_TOTO_MESSAGE,
      MESSAGE      => ACC_TOTO_MESSAGE,
      MESSAGE_TYPE => INT_ID_TOTO_MESSAGE,
      FAST         => FALSE);

   package POOL_TATA_MESSAGE is new POOL_MESSAGE
     (MESSAGE_REC  => REC_TOTO_MESSAGE,
      MESSAGE      => ACC_TOTO_MESSAGE,
      MESSAGE_TYPE => ID_INTERNAL_MSG.INT_ID_TOTO_MESSAGE,
      FAST         => FALSE);
end instantiation_generique;
'
]

{ #category : #'bugs - separate' }
ThalesBugs class >> mainmlm_adb [

	^'

   procedure MAINMLM is


      procedure INIT_STORES is separate;


   begin



   <<MAINMLM_INIT>>



    --

      INIT_STORES;


    --

   end MAINMLM;

'


]

{ #category : #'bugs - separate' }
ThalesBugs class >> mainmlm_init_stores_adb [

	^'


   separate (MAINMLM)


    procedure INIT_STORES is



	a : integer := 1;

   begin



   <<INIT_STORES_INIT>>



   a := a+1;

   end INIT_STORES;

'


]

{ #category : #'bugs - other generic instantiation' }
ThalesBugs class >> mmo_types_ads [

	^'with D15_3D_COORDINATES           ;

package MMO_TYPES is
--hfudsdbfvsdb
--hfudsdbfvsdb
--hfudsdbfvsdb
--hfudsdbfvsdb
--hfudsdbfvsdb
--hfudsdbfvsdb
end MMO_TYPES ;'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> path_manager_adb [

	^'package body PATH_MANAGER is

   procedure SEND (MESSAGE : in out MSG;
                   CONN_ID : in CONNECTION) is
   begin
		null;
   end SEND;

   procedure SEND_REPLY (MESSAGE : in out MSG;
                         CONN_ID : in CONNECTION) is
   begin
     null;
   end SEND_REPLY;
end PATH_MANAGER;
'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> path_manager_ads [

	^'with SYSTEM;
package PATH_MANAGER is
 type CONNECTION is private;
 type MSG is  
	record
         CHANN_ID       : INTEGER;
         MESSAGE_TYPE   : INTEGER;
         USER_DATA    : INTEGER;
 	end record;
 procedure SEND (MESSAGE : in out MSG;
                   CONN_ID : in CONNECTION);
 procedure SEND_REPLY (MESSAGE : in out MSG;
                         CONN_ID : in CONNECTION);
 private
   type CONNECTION is new SYSTEM.ADDRESS;
end PATH_MANAGER;'
]

{ #category : #'bugs - proc in proc' }
ThalesBugs class >> pkg_adb [

	^'package body pkg is

  package body generic_package is

    procedure launch is
    begin
      null;
    end launch;


    procedure stop is
    begin
      null;
    end stop;

  end generic_package;
end pkg;
'
]

{ #category : #'bugs - proc in proc' }
ThalesBugs class >> pkg_ads [

	^'package pkg is

generic
  value : in INTEGER;
  package generic_package is

    procedure launch;

    procedure stop;

  end generic_package;
end pkg;
'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> pool_message_adb [

	^'with PATH_MANAGER;
package body POOL_MESSAGE is

   procedure SEND (MESS    : in out MESSAGE;
                   CONN_ID : in PATH_MANAGER.CONNECTION) is
      THE_MESSAGE : PATH_MANAGER.MSG ;
   begin
      PATH_MANAGER.SEND (THE_MESSAGE, CONN_ID);
   end SEND;

   procedure SEND_REPLY (MESS    : in out MESSAGE;
                         CONN_ID : in PATH_MANAGER.CONNECTION) is
      THE_MESSAGE : PATH_MANAGER.MSG ;
   begin
      PATH_MANAGER.SEND_REPLY (THE_MESSAGE, CONN_ID);
   end SEND_REPLY;
end POOL_MESSAGE;
'
]

{ #category : #'bugs - generic instantiation' }
ThalesBugs class >> pool_message_ads [

	^'with PATH_MANAGER;
use PATH_MANAGER;
generic
   type MESSAGE_REC is limited private;
   type MESSAGE is access MESSAGE_REC;
   MESSAGE_TYPE : in Integer;
   FAST         : in BOOLEAN := FALSE;
package POOL_MESSAGE is
   procedure SEND (MESS    : in out MESSAGE;
                   CONN_ID : in CONNECTION);
   procedure SEND_REPLY (MESS    : in out MESSAGE;
                         CONN_ID : in CONNECTION);
end POOL_MESSAGE;
'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> renameexample_adb [

	^'with va_etre_rename;
with MSG_TOTO_1;

package body renameexemple is

  package VER renames va_etre_rename;

  procedure test is
  begin
    VER.launch;
  end test;

  package body subrename is

    package msg renames MSG_TOTO_1;
    procedure other_test is
      HIS_VAR : msg.T_TOTO_1;
    begin
      VER.launch;
    end other_test;

  end subrename;

end renameexemple;

'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> renameexample_ads [

	^'with va_etre_rename;

package renameexemple is

  package VER renames va_etre_rename;

  VAR2 : VER.TOIE;

  package subrename is
  end subrename;

end renameexemple;

'
]

{ #category : #'bug - compound separate' }
ThalesBugs class >> separate0 [
	^ ' -- must be 2nd
	separate (SERVICES_1553 )
 task body T_RX_TASK is

	 procedure BC_HANDLER is separate;
	begin null; end T_RX_TASK;
'
]

{ #category : #'bug - compound separate' }
ThalesBugs class >> separate1 [
	^ ' -- must be 1st
	separate (SERVICES_1553.T_RX_TASK)
procedure BC_HANDLER IS BEGIN NULL; END BC_HANDLER;

'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> va_etre_rename_adb [

	^'package body va_etre_rename is

  procedure launch is
  begin
    null;
  end launch;

end va_etre_rename;
'
]

{ #category : #'bugs - generic' }
ThalesBugs class >> va_etre_rename_ads [

	^'package va_etre_rename is
pragma Elaborate_Body;
  VAR : BOOLEAN := FALSE;
  type TOIE is
  record
    t : BOOLEAN;
    s : BOOLEAN;
  end record;


  procedure launch;

end va_etre_rename;
'
]
