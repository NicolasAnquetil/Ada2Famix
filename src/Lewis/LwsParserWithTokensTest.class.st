Class {
	#name : #LwsParserWithTokensTest,
	#superclass : #LwsParserTest,
	#category : #'Lewis-AdaParser'
}

{ #category : #'subprogram declaration tests' }
LwsParserWithTokensTest >> testFunctionDeclaration1 [
	self parse: '--
function RANDOM return PROBABILITY;' rule: #declEntry.
	self assert: result entities first startPosition equals: 4.
	self assert: result entities first endPosition equals: 38

]

{ #category : #'name tests' }
LwsParserWithTokensTest >> testNameWithAccessAttribute5 [
	"used to test procedure call"
 	self parse: 'Add_Any_Attribute
        (Parser.Grammar, List,
         Internal_Any_Descr''
           (Target_NS        => Empty_String,
            Process_Contents => Attributes.Any.Process_Contents,
            Namespaces       => Attributes.Any.Namespaces),
         As_Restriction);' rule: #statementEntry.
	self assert: result entities first startPosition equals: 1.
	self assert: result entities first endPosition equals: 274
]

{ #category : #'name tests' }
LwsParserWithTokensTest >> testNameWithParameters1 [
	"testing start position of function call"
 	self parse: '--
MY_SCHEDULE(SAT)' rule: #nameEntry.
	self assert: result entities first startPosition equals: 4.
	"self assert: result entities first endPosition equals: 19"

]

{ #category : #'subprogram declaration tests' }
LwsParserWithTokensTest >> testOperatorOverloadingDeclaration1 [
	self parse: '  function "*"(LEFT,RIGHT : MATRIX) return MATRIX;' rule: #declEntry.
	self assert: result entities first startPosition equals: 3.
	self assert: result entities first endPosition equals: 50

]

{ #category : #'package body tests' }
LwsParserWithTokensTest >> testPackageBody1 [
	self parse: ' -- bla
package body AdderPkg is
   procedure Add_Em_Up(In_Dat : in MY_ARRAY; Sum : out FLOAT) is
   Total : FLOAT;
   begin
      Total := 0.0;
      for Index in In_Dat''FIRST..In_Dat''LAST loop
         Total := Total + In_Dat(Index);
      end loop;
      Sum := Total;
   end Add_Em_Up;
end AdderPkg;
' rule: #unitEntry.

	self assert: result entities first startPosition equals: 9.
	self assert: result entities first endPosition equals: 303
]

{ #category : #'package body tests' }
LwsParserWithTokensTest >> testPackageDecl [
	self parse: '
 package  Linked_List is
	Function Allocate_New_Node return int;
 end Linked_List;
' rule: #declEntry.

	self assert: result entities first startPosition equals: 3.
	self assert: result entities first endPosition equals: 83
]

{ #category : #'subprogram declaration tests' }
LwsParserWithTokensTest >> testProcedureBody [
	self parse: ' procedure P2 is
   begin
       Put;
   end P2;' rule: #bodyEntry.
	self assert: result entities first startPosition equals: 2.
	self assert: result entities first endPosition equals: 48

]

{ #category : #'subprogram declaration tests' }
LwsParserWithTokensTest >> testProcedureDeclaration1 [
	self parse: '-- proc
procedure TRAVERSE_TREE;' rule: #declEntry.
	self assert: result entities first startPosition equals: 9.
	self assert: result entities first endPosition equals: 32

]

{ #category : #'subprogram declaration tests' }
LwsParserWithTokensTest >> testProcedureDeclaration2 [
	self parse: 'procedure INCREMENT(X : in out INTEGER);' rule: #declEntry.
	self assert: result entities first startPosition equals: 1.
	self assert: result entities first endPosition equals: 40

]

{ #category : #'subtype declaration tests' }
LwsParserWithTokensTest >> testSubtypeDeclaration1 [
	self parse: '  subtype RAINBOW is COLOR range RED .. BLUE;' rule: #declEntry.
	self assert: result entities first startPosition equals: 3.
	self assert: result entities first endPosition equals: 45

]

{ #category : #'task body tests' }
LwsParserWithTokensTest >> testTaskBody1 [

	self parse: ' -- task
task body SHORT_LINE is
begin
   for Index in 1..4 loop
      delay 0.0;
      Put_Line("This is a short line");
   end loop;
end SHORT_LINE;
' rule: #bodyEntry.
	self assert: result entities first startPosition equals: 10.
	self assert: result entities first endPosition equals: 150

]

{ #category : #'task declaration tests' }
LwsParserWithTokensTest >> testTaskDeclaration1 [
	self parse: '
task PRODUCER_CONSUMER is 
	entry READ (V : out ITEM); 
	entry WRITE(E : in ITEM);
end;' rule: #declEntry.
	self assert: result entities first startPosition equals: 2.
	self assert: result entities first endPosition equals: 88

]

{ #category : #'type declaration tests' }
LwsParserWithTokensTest >> testTypeDeclaration1 [
	self parse: '    type COLOR is (WHITE, RED, YELLOW, GREEN, BLUE, BROWN, BLACK);' rule: #declEntry.
	self assert: result entities first startPosition equals: 5.
	self assert: result entities first endPosition equals: 66

]
