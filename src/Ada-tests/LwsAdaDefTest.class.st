Class {
	#name : #LwsAdaDefTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #testing }
LwsAdaDefTest >> testEnumCharacter [
	| enum names parents |
	self parseAndVisit: ' 
package body enum_example is

  type t_enum is (''d'',''f'',''g'');

end enum_example;
'.

	self assert: model allAdaTypes size equals: 1.
	enum := model allAdaTypes anyOne.
	self assert: enum isAdaEnumeratedType.
	self assert: enum enumValues size equals: 3.
	names := enum enumValues collect: #name. 
	self assert: (#('''d''' '''f''' '''g''') 
						allSatisfy: [ :each | names includes: each ]).
	parents := enum enumValues collect: #parentEnum.
	self assert: (parents allSatisfy: [ :each | each == enum ]).
	
	
]

{ #category : #testing }
LwsAdaDefTest >> testEnumString [
	|   enum names parents |
	self parseAndVisit: ' 
package body enum_example is

  type t_enum is (ARTIFACT,TEST,OTHER);
 
end enum_example;
'.

	self assert: model allAdaTypes size equals: 1.
	enum := model allAdaTypes anyOne.
	self assert: enum isAdaEnumeratedType.
	self assert: enum enumValues size equals: 3.
	names := enum enumValues collect: #name. 
	self assert: (#('ARTIFACT' 'TEST' 'OTHER') 
						allSatisfy: [ :each | names includes: each ]).
	parents := enum enumValues collect: #parentEnum.
	self assert: (parents allSatisfy: [ :each | each == enum ]).
						
	
]

{ #category : #testing }
LwsAdaDefTest >> testMod [
	|   aType   |
	self parseAndVisit: ' 
package body mod_example is

  type seconds is mod 60;
 
end mod_example;
'.

	self assert: model allAdaTypes size equals: 1.
	aType := model allAdaTypes anyOne.
	self assert: aType isAdaModType.
]

{ #category : #testing }
LwsAdaDefTest >> testParameterTypeItNamedAttribute [
	|  proc |
	self parseAndVisit: ' procedure PROC  (A : Ada.Streams.Root_Stream_Type''Class); '.

	self assert: model allAdaSubprograms size equals: 1.
	proc := model allAdaSubprograms  first.
	self assert: proc signature equals: 'PROC(Ada.Streams.Root_Stream_Type.''Class)'.
]

{ #category : #testing }
LwsAdaDefTest >> testPrimitiveType [
	|      |
	self parseAndVisit: '
with toto;
use toto;
package body mod_example is

  type t1 is access integer;
  type t2 is access string;
  type t3 is access toto.pointer;

end mod_example;
'.

	self assert: model allAdaTypes size equals: 3.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testTaskTypeWithProcedure [
	| ent |
	self parseAndVisit: self taskTypeWithProcedure. 

	ent := model entities detect: [ :e | e name = 'T_TA_PMPI_NAVS'].
	self assert: ent notNil.
	self assert: ent class equals: ADATask.

	ent := model entities detect: [ :e | e name = 'TA_PMPI_NAVS'].
	self assert: ent notNil.
	self assert: ent class equals: ADAStructuralEntity.

	ent := model entities select: [:e | e name = 'START'].
	self assert: ent size equals: 2.
	self assert: (ent allSatisfy: [:e | e class = ADASubprogram]).
	self assert: (ent anySatisfy: [:e | e container name = 'T_TA_PMPI_NAVS']).

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitAnonymousArrayDefinition [
	"this is a parsing test (check that the parser accepts the construct)"
	
	self parseAndVisit: '
package body PCKG is
     VAR  : array (Positive range 1 .. 10) of ATYPE;
end PCKG;'.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitArrayTypeDefinition [
	
	| typ |
	self parseAndVisit: '
package body PCKG is
     type T_ARRAY is array (INTEGER range <>) of T_ELEM;
end PCKG;'.

	typ := model entities detect: [ :e | e name = 'T_ARRAY'].
	self assert: typ notNil.
	self deny: typ isAdaRecordType.
	self deny: typ isAdaRangeType.
	self deny: typ isAdaEnumeratedType.
	self deny: typ isAdaAccessType.
	self deny: typ isAdaContainer.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitEnumeratedTypeDefinition [
	| pckg typ |
	self parseAndVisit: '
package body Linked_List is
  type Status_value is (empty, partially_full, full);
end Linked_List;'.

	pckg := model allAdaPackages first. "there is only one"

	self deny: pckg isNil.
	self assert: pckg localVariables size equals: 3.
	"enumeration constantes are defined directly into the container of the enumeration type"

	self assert: (pckg localVariables includes: (model entities detect: [ :e | e name = 'empty'])).
	self assert: (pckg localVariables includes: (model entities detect: [ :e | e name = 'partially_full'])).
	self assert: (pckg localVariables includes: (model entities detect: [ :e | e name = 'full'])).

	typ := model entities detect: [ :e | e name = 'Status_value'].
	self assert: typ notNil.
	self deny: typ isAdaRecordType.
	self deny: typ isAdaRangeType.
	self assert: typ isAdaEnumeratedType.
	self deny: typ isAdaAccessType.
	self assert: typ isAdaContainer.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitFunctionCallNameIsString [
	self parseAndVisit: '
function "NOT"(MSG : INTEGER) return INTEGER is
begin
  return ("NOT"(42));
end "NOT";'.
	
	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms first name equals: 'NOT'.
	self assert: model allAdaSubprograms first signature equals: 'NOT(INTEGER): INTEGER'
	

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitFunctionDefinitionWithoutPackage [
	self parseAndVisit: '
function F1 return BOOLEAN is
   begin
      Put;
   end F1;
'. 

	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms first name equals: 'F1'.
	self assert: model allAdaSubprograms first signature equals: 'F1(): BOOLEAN'.
	self assert: model allAdaSubprograms first isStub not.
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitFunctionNameIsString [
	self parseAndVisit: self functionNameIsString.
	
	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms first name equals: '&'

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitGenericFunctionInstanciation [
	| subprg |
	self parseAndVisit:  {self genericFctWithParamFct . self genericFunctionInstanciation}. 

	subprg := model entities detect: [ :e | e name = 'Power'].
	self assert: subprg notNil.
	self assert: subprg class equals: ADASubprogram.
	self assert: subprg isGeneric.
	self assert: subprg container equals: ((model allWithType: ADATopLevelContainer) first).

	subprg := model entities detect: [ :e | e name = 'mult'].
	self assert: subprg notNil.
	self assert: subprg class equals: ADASubprogram.
	self assert: subprg container name equals: 'Power'.

	subprg := model entities detect: [ :e | e name = 'INSTANCE'].
	self assert: subprg notNil.
	self assert: subprg class equals: ADASubprogram.
	self assert: subprg container equals: ((model allWithType: ADATopLevelContainer) first).

	subprg := model entities detect: [ :e | e name = 'Power_Int'].
	self assert: subprg notNil.
	self assert: subprg class equals: ADAGenericSubprogramInstanciation.
	self assert: subprg generic isNil.
	self assert: subprg container name equals: 'INSTANCE'.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitGenericFunctionWithParameterFunction [
	| subprg typ |
	self parseAndVisit: self genericFctWithParamFct. 

	subprg := model entities detect: [ :e | e name = 'Power'].
	self assert: subprg notNil.
	self assert: subprg isGeneric.
	self assert: subprg class equals: ADASubprogram.

	typ := model entities detect: [ :e | e name = 'Element_T'].
	self assert: typ notNil.
	self assert: typ class equals: ADAType.
	self assert: typ container name equals: 'Power'.

	subprg := model entities detect: [ :e | e name = 'mult'].
	self assert: subprg notNil.
	self assert: subprg class equals: ADASubprogram.
	self assert: subprg container name equals: 'Power'.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitGenericPackageInstanciation [
	| pckg |
	self parseAndVisit: self genericPackageInstanciation. 

	pckg := model entities detect: [ :e | e name = 'Generic_Stack'].
	self assert: pckg notNil.
	self assert: pckg class equals: ADAPackage.
	self assert: pckg isGeneric.
	self assert: pckg subprograms size equals: 2.
	self assert: pckg localVariables size equals: 1.
	self assert: pckg localVariables first name equals: 'NB_MAX_OF_PARAMETERS'.
	self assert: pckg container equals: ((model allWithType: ADATopLevelContainer) first).

	pckg := model entities detect: [ :e | e name = 'Instanciate'].
	self assert: pckg notNil.
	self assert: pckg class equals: ADAPackage.
	self assert: pckg subprograms size equals: 0.
	self assert: pckg container equals: ((model allWithType: ADATopLevelContainer) first).

	pckg := model entities detect: [ :e | e name = 'Float_Stack'].
	self assert: pckg notNil.
	self assert: pckg class equals: ADAGenericPackageInstanciation.
	self assert: pckg subprograms size equals: 0.
	self assert: pckg container name equals: 'Instanciate'.
	self assert: pckg generic isNil

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageBodyWithProcedure [
	self parseAndVisit: self packageBodyWithProcedureExample. 

	self assert: model allAdaPackages size equals: 1.
	self assert: model allAdaPackages first name equals: 'Linked_List'.
	self assert: model allAdaPackages first isStub not.
]

{ #category : #testing }
LwsAdaDefTest >> testVisitPackageDeclaration [
	self parseAndVisit: self stackPackageExample
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageDeclarationWithOneFunction [
	| pckg |
	self parseAndVisit: self packageWithFunctionExample. 

	self assert: model allAdaPackages size equals: 1. 
	pckg := model allAdaPackages first.
	self assert: model allAdaSubprograms first signature equals: 'Allocate_New_Node(): int'.
	self assert: model allAdaSubprograms first container equals: pckg.
	self assert: model allAdaSubprograms first isStub not
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageDeclarationWithOneProcedure [
	| pckg |
	self parseAndVisit: self packageWithProcedureExample. 

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: model allAdaSubprograms first signature equals: 'Replace_Elmt()'.
	self assert: model allAdaSubprograms first container equals: pckg.
	self assert: model allAdaSubprograms first isStub not
]

{ #category : #testing }
LwsAdaDefTest >> testVisitPackageDeclarationWithQualifiedName [
	self parseAndVisit: '
package OWNER.PCKG is
end OWNER.PCKG;'.

	self assert: model allAdaPackages size equals: 1.
	self assert: (model allWithType: ADAUnknownContainer) size equals: 1.
	self assert: (model entities detect: [:e | e name = 'PCKG']) container name equals: 'OWNER'
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageSeparateInsideBeforeDecl [

	self parseAndVisit: {self separatePackageInner1 . self separatePackageInner2 . self separatePackageMainDecl . self separatePackageMainDef}.

	self assert: model allAdaPackages size equals: 3.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageWithNamedNumbers [
	| pckg |
	self parseAndVisit: self packageWithNamedNumbers.

	self assert: model allAdaPackages size equals: 1.

	pckg := model allAdaPackages first.
	self assert: pckg localVariables size equals: 2.
	self assert: (pckg localVariables detect: [ :e | e name = 'MSG_CODE']) container equals: pckg.
	self assert: (pckg localVariables detect: [ :e | e name = 'MSG_CODE']) isConstant.
	self assert: (pckg localVariables detect: [ :e | e name = 'MSG_CODE']) isStub not.

	self assert: (pckg localVariables detect: [ :e | e name = 'MAX_SIZE']) container equals: pckg.
	self assert: (pckg localVariables detect: [ :e | e name = 'MAX_SIZE']) isConstant.
	self assert: (pckg localVariables detect: [ :e | e name = 'MAX_SIZE']) isStub not.

]

{ #category : #testing }
LwsAdaDefTest >> testVisitPackageWithSeparate [
	self parseAndVisit: self packageWithSeparate

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitPackageWithVariables [
	| pckg |
	self parseAndVisit: self packageWithVariables.

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg localVariables size equals: 3.
	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_Node']) container equals: pckg.
	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_Node']) isConstant.
	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_Node']) isStub not.

	self assert: (pckg localVariables detect: [ :e | e name = 'List_Exception']) container equals: pckg.
	self assert: (pckg localVariables detect: [ :e | e name = 'List_Exception']) isConstant not.
	self assert: (pckg localVariables detect: [ :e | e name = 'List_Exception']) isStub not.

	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_List_After_Deletion']) container equals: pckg.
	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_List_After_Deletion']) isConstant not.
	self assert: (pckg localVariables detect: [ :e | e name = 'Empty_List_After_Deletion']) isStub not.

]

{ #category : #'test-ThalesEntities' }
LwsAdaDefTest >> testVisitParametersMode [
	| param |
	self parseAndVisit: self packageBodyWithProcedureExample. 

	param := model findEntityNamed: 'w'.
	self assert: param mode equals: (AdaImporter inModeSymbol).
	param := model findEntityNamed: 'x'.
	self assert: param mode equals: (AdaImporter inModeSymbol).
	param := model findEntityNamed: 'y'.
	self assert: param mode equals: (AdaImporter inOutModeSymbol).
	param := model findEntityNamed: 'z'.
	self assert: param mode equals: (AdaImporter outModeSymbol).
]

{ #category : #'test-ThalesEntities' }
LwsAdaDefTest >> testVisitParametersModeExport [
	| mse |
	self parseAndVisit: self packageBodyWithProcedureExample. 

	(model findEntityNamed: 'x') mode: 'toto'.

	mse := model asMSEString.
	self assert: (mse includesSubstring: 'mode ''inputMode''').
	self assert: (mse includesSubstring: 'mode ''outputMode''').
	self assert: (mse includesSubstring: 'mode ''inputOutputMode''').

]

{ #category : #'test-ThalesEntities' }
LwsAdaDefTest >> testVisitParametersOfOperator [
	| fct |
	self parseAndVisit: self functionNameIsString. 

	self assert: model allAdaVariables size equals: 2.

	fct := model entities detect: [:e | e name = '&'].
	
	self assert: fct parameters size equals: 2.

	self assert: (fct parameters detect: [:v | v name = 'S'] ifNone: nil) isNotNil.
	self assert: (fct parameters detect: [:v | v name = 'S']) container equals: fct.

	self assert: (fct parameters detect: [:v | v name = 'I'] ifNone: nil) isNotNil.
	self assert: (fct parameters detect: [:v | v name = 'I']) container equals: fct.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitProcedureDeclarationAndDefinition [
	self parseAndVisit: self procedureDeclarationAndDefinition.

	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms first name equals: 'Simple1'.
	self assert: model allAdaSubprograms first isStub not
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitProcedureDefinitionWithoutPackage [
	self parseAndVisit: self procedureWithoutPackage. 

	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms first signature equals: 'P2()'.
	self assert: model allAdaSubprograms first isStub not
]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitProcedureInProcedureInPackage [
	| pckg |
	self parseAndVisit: self procedureInProcedureInPackage. 

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg functions size equals: 1.
	self assert: pckg functions first signature equals: 'Simple1()'.
	self assert: pckg functions first container equals: pckg.
	self assert: pckg functions first functions size equals: 2.
	pckg functions first functions do: [ :sub | self assert: sub isStub not ]
]

{ #category : #testing }
LwsAdaDefTest >> testVisitProcedureInSeparate [
	self parseAndVisit: self procedureInSeparate

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitProcedureWithTwoTasks [
	| ent |
	self parseAndVisit: self procedureWithTwoTasks.

	self assert: model allAdaSubprograms size equals: 1.
	ent := model allAdaSubprograms first.
	self assert: ent name equals: 'Task1'.

	ent := model allAdaTasks detect: [ :e | e name = 'First_Task'] ifNone: nil.
	self assert: ent class equals: ADATask.
	self assert: ent isStub not.

	ent := model allAdaTasks detect: [ :e | e name = 'Second_Task'] ifNone: nil.
	self assert: ent class equals: ADATask.
	self assert: ent isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitProcedureWithVariables [
	| proc |

	self parseAndVisit: self procedureWithVariables.

	self assert: model allAdaSubprograms size equals: 1.
	proc := model allAdaSubprograms first.
	self assert: proc localVariables size equals: 2.
	self assert: (proc localVariables detect: [ :e | e name = 'S'] ifNone: nil) notNil.
	self assert: (proc localVariables detect: [ :e | e name = 'S']) container equals: proc.
	self assert: (proc localVariables detect: [ :e | e name = 'S']) isConstant not.
	self assert: (proc localVariables detect: [ :e | e name = 'S']) isStub not.

	self assert: (proc localVariables detect: [ :e | e name = 'N'] ifNone: nil) notNil.
	self assert: (proc localVariables detect: [ :e | e name = 'N']) container equals: proc.
	self assert: (proc localVariables detect: [ :e | e name = 'N']) isConstant not.
	self assert: (proc localVariables detect: [ :e | e name = 'N']) isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitRangeTypeDefinition [
	| pckg typ |
	self parseAndVisit: '
package body PCKG is
  subtype SUBRANGE is INTEGER range 0 .. 10;
end PCKG;'.

	pckg := model allAdaPackages first. "there is only one"

	self deny: pckg isNil.

	typ := model entities detect: [ :e | e name = 'SUBRANGE'].
	self assert: typ notNil.
	self deny: typ isAdaRecordType.
	self deny: typ isAdaEnumeratedType.
	self assert: typ isAdaRangeType.
	self deny: typ isAdaAccessType.
	self assert: typ isAdaContainer.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitRecordDefinition [
	| typ |
	self parseAndVisit: '
  package body Linked_List is
    type STRUCT is record
      Data       : Item_To_Manage := Illegal_Value ;
      Prior_Item : STRUCT      := Empty_Node    ;
      Next_Item  : STRUCT      := Empty_Node    ;
    end record ;
end Linked_List;'.

	typ := model entities detect: [ :e | e name = 'STRUCT'].
	self assert: typ notNil.
	self assert: typ isAdaRecordType.
	self deny: typ isAdaRangeType.
	self deny: typ isAdaEnumeratedType.
	self deny: typ isAdaAccessType.
	self assert: typ isAdaContainer.
	self assert: typ localVariables size equals: 3.

	self assert: (typ localVariables detect: [ :e | e name = 'Data'] ifNone: nil) notNil.
	self assert: (typ localVariables detect: [ :e | e name = 'Data']) container equals: typ.
	self assert: (typ localVariables detect: [ :e | e name = 'Data']) isStub not.

	self assert: (typ localVariables detect: [ :e | e name = 'Prior_Item'] ifNone: nil) notNil.
	self assert: (typ localVariables detect: [ :e | e name = 'Prior_Item']) container equals: typ.
	self assert: (typ localVariables detect: [ :e | e name = 'Prior_Item']) isStub not.

	self assert: (typ localVariables detect: [ :e | e name = 'Next_Item'] ifNone: nil) notNil.
	self assert: (typ localVariables detect: [ :e | e name = 'Next_Item']) container equals: typ.
	self assert: (typ localVariables detect: [ :e | e name = 'Next_Item']) isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSeparateAfterDeclarationOneVisitor [
	| pckg |
	self parseAndVisit: {self packageWithSeparate . self procedureInSeparate}.

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg name equals: 'MSG_MANAGER'.
	self assert: pckg isStub not.

	self assert: model allAdaSubprograms first name equals: 'SEND'.
	self assert: model allAdaSubprograms first container equals: pckg.
	self assert: model allAdaSubprograms first isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSeparateAfterDeclarationTwoVisitors [
	| pckg |
	self parseAndVisit: self packageWithSeparate.
	self parseAndVisit: self procedureInSeparate.

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg name equals: 'MSG_MANAGER'.
	self assert: pckg isStub not.

	self assert: model allAdaSubprograms anyOne name equals: 'SEND'.
	self assert: model allAdaSubprograms anyOne container equals: pckg.
	self assert: model allAdaSubprograms anyOne isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSeparateBeforeDeclarationOneVisitor [
	| pckg |
	self parseAndVisit: {self procedureInSeparate . self packageWithSeparate}.

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg name equals: 'MSG_MANAGER'.
	self assert: pckg isStub not.

	self assert: model allAdaSubprograms anyOne name equals: 'SEND'.
	self assert: model allAdaSubprograms anyOne container equals: pckg.
	self assert: model allAdaSubprograms anyOne isStub not.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSeparateBeforeDeclarationTwoVisitors [
	| pckg |
	self parseAndVisit: self procedureInSeparate.
	self parseAndVisit: self packageWithSeparate.

	self assert: model allAdaPackages size equals: 1.
	pckg := model allAdaPackages first.
	self assert: pckg name equals: 'MSG_MANAGER'.
	self assert: pckg isStub not.

	self assert: model allAdaSubprograms size equals: 1.
	self assert: model allAdaSubprograms anyOne name equals: 'SEND'.
	self assert: model allAdaSubprograms anyOne container equals: pckg.
	self assert: model allAdaSubprograms anyOne isStub not.

]

{ #category : #testing }
LwsAdaDefTest >> testVisitSeparateInSeparate [
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

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSubprogramWithParameters [
	| sub |
	self parseAndVisit: self packageBodyWithProcedureExample. 

	sub := model entities detect: [ :e | e name = 'Replace_Elmt'].

	self assert: sub notNil.
	self assert: sub parameters size equals: 4.

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitSubtypeDefinition [
	| pckg |
	self parseAndVisit: self packageWithSubtypes.

	self assert: model allAdaPackages size equals: 2.
	pckg := model allAdaPackages detect: [:p | p isStub].
	self assert: pckg name equals: 'MAILBOX_MANAGER'.

	pckg := model allAdaPackages detect: [:p | p isStub not].
	self assert: pckg name equals: 'MESSAGES'.
	
	self assert: pckg types size equals: 4.
	self assert: (pckg types detect: [ :e | e name = 'MESSBOX'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'MESSBOX']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'MESSBOX']) isStub not.

	self assert: (pckg types detect: [ :e | e name = 'T_MESSBOX_ID'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'T_MESSBOX_ID']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'T_MESSBOX_ID']) isStub not.

	self assert: (pckg types detect: [ :e | e name = 'T_CODE'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'T_CODE']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'T_CODE']) isStub not.

	self assert: (pckg types detect: [ :e | e name = 'T_PLOTS_RANGE'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'T_PLOTS_RANGE']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'T_PLOTS_RANGE']) isStub not.

]

{ #category : #'test-ThalesEntities' }
LwsAdaDefTest >> testVisitTaskWithThalesCase [
	self parseAndVisit: self taskWithThalesCase. 

	self assert: model allAdaPackages size equals: 1.
	self assert: model allAdaPackages first name equals: 'SURVEILLANCE'.
	
	self assert: model allAdaSubprograms size equals: 2.
	self assert: (model allAdaSubprograms anySatisfy: [ :v | v name = 'TREAT_RADAR_MESSAGES']).
	self assert: (model allAdaSubprograms anySatisfy: [ :v | v name = 'CHANNEL_NUMBER_OF']).

	self assert: model allAdaTasks size equals: 1.
	self assert: model allAdaTasks first name equals: 'T_TA_SURVEILLANCE'.

	self assert: model allAdaVariables size equals: 3.
	self assert: (model allAdaVariables anySatisfy: [ :v | v name = 'RADAR_MSG']).
	self assert: (model allAdaVariables anySatisfy: [ :v | v name = 'THIS_MSG']).
	self assert: (model allAdaVariables anySatisfy: [ :v | v name = 'MSG_POINTER']).

]

{ #category : #'tests-AdaEntities' }
LwsAdaDefTest >> testVisitTypeDefinition [
	| pckg |
	self parseAndVisit: self packageWithTwoTypes.

	pckg := model allAdaPackages first.
	self assert: pckg types size equals: 2.

	self assert: (pckg types detect: [ :e | e name = 'List_Item'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'List_Item']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'List_Item']) isStub not.

	self assert: (pckg types detect: [ :e | e name = 'Status_value'] ifNone: nil) notNil.
	self assert: (pckg types detect: [ :e | e name = 'Status_value']) container equals: pckg.
	self assert: (pckg types detect: [ :e | e name = 'Status_value']) isStub not.

]

{ #category : #running }
LwsAdaDefTest >> visitorClasses [
	^ { LwsAdaVisitorDef }
]
