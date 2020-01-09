Class {
	#name : #AdaParserTest,
	#superclass : #TestCase,
	#classVars : [
		'Parser'
	],
	#category : #'Ada-tests'
}

{ #category : #'as yet unclassified' }
AdaParserTest >> adaParser [

	^ Ada95Parser
]

{ #category : #samples }
AdaParserTest >> assignment [

^ 
'with A4G.A_Debug;  use A4G.A_Debug;

with Output;       use Output;

package body A4G.A_Elists is

   -----------------
   -- Append_Elmt --
   -----------------
 procedure Add_To_Elmt_List (Unit : Unit_Id; List : in out Elist_Id) is
   begin
      if No (List) then
         List :=  New_Elmt_List;
         Append_Elmt (Unit, List);
      elsif not In_Elmt_List (Unit, List) then
         Append_Elmt (Unit, List);
      end if;
   end Add_To_Elmt_List;
   procedure Replace_Elmt (Elmt : Elmt_Id; New_Unit : Unit_Id) is
   begin
      Elmts.Table (Elmt).Unit := New_Unit;
   end Replace_Elmt;

end A4G.A_Elists;'

]

{ #category : #samples }
AdaParserTest >> message [
^
'with COMMON_TYPES;


package MESSAGE_TEST is

  E_CONSTRAINT_ERROR_MSG : exception;

  -- code du message
  MSG_CODE : constant UNSIGNED:= 2;

  subtype T_TEST is TRACKING_TYPES.T_TEST;
   
  
  subtype T_NBR_PLOTS is INTEGER range 0 .. 10;
  subtype T_PLOTS_RANGE is INTEGER range T_NBR_PLOTS''FIRST + 1 .. T_NBR_PLOTS''LAST;

  type T_TRACK_TYPE is (MODE_1, MODE_2, MODE_3);

  type T_CHANNEL is (AVION, BATEAU);

  type T_MSL_MODE is (MANUEL, AUTOMATIQUE);


  -- PISTE 3D
  type T_3D_TRACK is
    record
      TEST					: T_TEST;
      CODE         	    	: COMMON_TYPES.T_CODE;
      TRACK_TYPE            : T_TRACK_TYPE;
      UPDATING_MODE     	: T_MSL_MODE;
      TRACK_STATUS          : TRACKING_TYPES.T_TRACK_STATUS;
      CHANNEL               : T_CHANNEL;
      CARTES_POSIT          : COMMON_TYPES.T_3D_CARTES_COORD;
      JAMMER_PRESENCE       : BOOLEAN;
      NBR_PLOTS             : T_NBR_PLOTS;
      POLAR_POSIT           : COMMON_TYPES.T_3D_POLAR_COORD;
      LIST_PLOTS	   		: T_LIST_PLOTS;
    end record;

   type T_3D_TRACK_PLOT is
     record
       SYS_TIME            : SYS_TIME_SERVICES.T_SYS_TIME;
       POLAR_POSIT         : COMMON_TYPES.T_3D_POLAR_COORD;
       MULTITARGET_PRESUMP : BOOLEAN;
     end record;



  type T_LIST_PLOTS is array (T_PLOTS_RANGE) of T_3D_TRACK_PLOT;
  NULL_LIST_PLOTS : constant T_LIST_PLOTS := (others => NULL_3D_TRACK_PLOT);


  type T_ACCESS is access T_3D_TRACK;

end EGES_3D_TRACK;
'
]

{ #category : #samples }
AdaParserTest >> message2 [
^
'package COMMON_TYPES is
	subtype T_TEST_FINAL is INTEGER range 0 .. 0;
	
	MIN_CARTES_POSIT : constant FLOAT := -1.0;
  	MAX_CARTES_POSIT : constant FLOAT := 1.0;
  	
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

{ #category : #samples }
AdaParserTest >> message3 [
^
'with MESSAGE_TEST;

package TRACKING_TYPES is

	subtype T_TEST_2 is COMMON_TYPES.T_TEST_FINAL;
	subtype T_TEST is TRACKING_TYPES.T_TEST_2;
	
	
	type T_TRACK_STATUS is (NOUVELLE_PISTE, MISE_A_JOUR);
	
	MIN_ELEVATION : constant FLOAT := -2.0;
  	MAX_ELEVATION : constant FLOAT := 2.0;
  	
  	MIN_AZIMUTH : constant FLOAT := -3.4;
  	MAX_AZIMUTH : constant FLOAT := 6.8;
  	
  	MIN_RANGE : constant FLOAT := 1_158.4;
  	MAX_RANGE : constant FLOAT := 3_000.8;
  	
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
	end TRACKING_TYPES;

end TRACKING_TYPES;

'
]

{ #category : #samples }
AdaParserTest >> messageLower [
^
'with COMMON_TYPES;


package MESSAGE_TEST is

  E_CONSTRAINT_ERROR_MSG : exception;

  -- code du message
  MSG_CODE : constant UNSIGNED:= 2;

  subtype T_TEST is TRACKING_TYPES.T_TEST;
   
  
  subtype T_NBR_PLOTS is INTEGER range 0 .. 10;
  subtype T_PLOTS_RANGE is INTEGER range T_NBR_PLOTS''FIRST + 1 .. T_NBR_PLOTS''LAST;

  type T_TRACK_TYPE is (MODE_1, MODE_2, MODE_3);

  type T_CHANNEL is (AVION, BATEAU);

  type T_MSL_MODE is (MANUEL, AUTOMATIQUE);


  -- PISTE 3D
  type T_3D_TRACK is
    record
      TEST					: T_TEST;
      CODE         	    	: COMMON_TYPES.T_CODE;
      TRACK_TYPE            : T_TRACK_TYPE;
      UPDATING_MODE     	: T_MSL_MODE;
      TRACK_STATUS          : TRACKING_TYPES.T_TRACK_STATUS;
      CHANNEL               : T_CHANNEL;
      CARTES_POSIT          : COMMON_TYPES.T_3D_CARTES_COORD;
      JAMMER_PRESENCE       : BOOLEAN;
      NBR_PLOTS             : T_NBR_PLOTS;
      POLAR_POSIT           : COMMON_TYPES.T_3D_POLAR_COORD;
      LIST_PLOTS	   		: T_LIST_PLOTS;
    end record;

   type T_3D_TRACK_PLOT is
     record
       SYS_TIME            : SYS_TIME_SERVICES.T_SYS_TIME;
       POLAR_POSIT         : COMMON_TYPES.T_3D_POLAR_COORD;
       MULTITARGET_PRESUMP : BOOLEAN;
     end record;



  type T_LIST_PLOTS is array (T_PLOTS_RANGE) of T_3D_TRACK_PLOT;
  NULL_LIST_PLOTS : constant T_LIST_PLOTS := (others => NULL_3D_TRACK_PLOT);


  type T_ACCESS is access T_3D_TRACK;

end EGES_3D_TRACK;
'
]

{ #category : #samples }
AdaParserTest >> messageUppercase [

	^ 
'WITH COMMON_TYPES;


PACKAGE MESSAGE_TEST IS

  E_CONSTRAINT_ERROR_MSG : EXCEPTION;

  -- code du message
  MSG_CODE : CONSTANT UNSIGNED := 2;

  SUBTYPE T_TEST IS TRACKING_TYPES.T_TEST;
   
  
  SUBTYPE  T_NBR_PLOTS IS INTEGER RANGE 0 .. 10;
  SUBTYPE  T_PLOTS_RANGE IS INTEGER RANGE T_NBR_PLOTS''FIRST + 1 .. T_NBR_PLOTS''LAST;

   TYPE  T_TRACK_TYPE IS (MODE_1, MODE_2, MODE_3);

   TYPE  T_CHANNEL IS (AVION, BATEAU);

   TYPE  T_MSL_MODE IS (MANUEL, AUTOMATIQUE);


  -- PISTE 3D
   TYPE  T_3D_TRACK IS
    RECORD
      TEST					: T_TEST;
      CODE         	    	: COMMON_TYPES.T_CODE;
      TRACK_TYPE            : T_TRACK_TYPE;
      UPDATING_MODE     	: T_MSL_MODE;
      TRACK_STATUS          : TRACKING_TYPES.T_TRACK_STATUS;
      CHANNEL               : T_CHANNEL;
      CARTES_POSIT          : COMMON_TYPES.T_3D_CARTES_COORD;
      JAMMER_PRESENCE       : BOOLEAN;
      NBR_PLOTS             : T_NBR_PLOTS;
      POLAR_POSIT           : COMMON_TYPES.T_3D_POLAR_COORD;
      LIST_PLOTS	   		: T_LIST_PLOTS;
    END RECORD;

    TYPE  T_3D_TRACK_PLOT IS
     RECORD
       SYS_TIME            : SYS_TIME_SERVICES.T_SYS_TIME;
       POLAR_POSIT         : COMMON_TYPES.T_3D_POLAR_COORD;
       MULTITARGET_PRESUMP : BOOLEAN;
     END RECORD;



   TYPE  T_LIST_PLOTS IS ARRAY (T_PLOTS_RANGE) OF T_3D_TRACK_PLOT;
  NULL_LIST_PLOTS : CONSTANT T_LIST_PLOTS := (others => NULL_3D_TRACK_PLOT);


   TYPE  T_ACCESS IS ACCESS T_3D_TRACK;

END EGES_3D_TRACK;'

]

{ #category : #'as yet unclassified' }
AdaParserTest >> selectorsOfAdaTestSample [

	^ AdaTestSample class selectors asOrderedCollection removeAll: #( #timedbufAds #EOFExceptionExample  #a4gAdebug #rtskpoolAdb) ; yourself
]

{ #category : #tests }
AdaParserTest >> testAdaTestCode [
	"self debug: #testAdaTestCode"
	
	self selectorsOfAdaTestSample do: [:each | self adaParser parse: (AdaTestSample perform: each) ]
]

{ #category : #tests }
AdaParserTest >> testDblbuf [
	"self debug: #testDblbuf"
	
	| tree |
	tree := self adaParser parse: AdaTestSample dblbuf2.
	self assert: tree notNil
]

{ #category : #tests }
AdaParserTest >> testGeneric [
	"self debug: #testGeneric"
	
	| tree |
	tree := self adaParser parse: AdaTestSample linklistAds.
	self assert: tree notNil	
]

{ #category : #tests }
AdaParserTest >> testMessageLower [
	"self debug: #testMessageLower"
	
	| tree |
	tree := self adaParser parse: self messageLower.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testMessageUppercase [
	"self debug: #testTGBodyUppercase"
	
	| tree |
	tree := self adaParser parse: self messageUppercase.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testPackage [
	"self debug: #testPackage"
	
	| tree |
	tree := self adaParser parse: AdaTestSample lockmgrAds.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testSimpleArray [
	"self debug: #testSimpleArray"
	
	| tree |
	tree := self adaParser parse: AdaTestSample a05_simpleArrayExample.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testSimpleFunction [
	"self debug: #testTGAssignment"
	
	| tree |
	tree := self adaParser parse: AdaTestSample a04_simpleFunction.
	self assert: tree notNil	
]

{ #category : #tests }
AdaParserTest >> testTGAssignment [
	"self debug: #testTGAssignment"
	
	| tree |
	tree := self adaParser parse: self assignment.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testTGBodyMessage2 [
	"self debug: #testTGBodyMessage2"
	
	| tree |
	tree := self adaParser parse: self message2.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testTGBodyMessage3 [
	"self debug: #testTGBodyMessage3"
	
	| tree |
	tree := self adaParser parse: self message3 .
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testTGBodyUppercase [
	"self debug: #testTGBodyUppercase"
	
	| tree |
	tree := self adaParser parse: self messageUppercase.
	self assert: tree notNil	"self assert: (tree isKindOf: BodyCode)"
]

{ #category : #tests }
AdaParserTest >> testtimedbufAds [
	"self debug: #testtimedbufAds"
	
	| tree |
	tree := self adaParser parse: AdaTestSample timedbufAds.
	self assert: tree notNil	
]
