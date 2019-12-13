Class {
	#name : #Ada95Parser,
	#superclass : #SmaCCParser,
	#category : #'Lewis-AdaParser'
}

{ #category : #generated }
Ada95Parser class >> definitionComment [
"#Definition extracted from old style definition comments
<char_lit>: \'.\' ;
<char_string>: \""(\""\""|[^\n\""])*\"" ;

<DIGIT>:                   [0-9];
<EXTENDED_DIGIT>:          [0-9a-zA-Z];
<INTEGER>:	(<DIGIT>(_?<DIGIT>)*);
<EXPONENT>:                ([eE](\+?|-)<INTEGER>);
<DECIMAL_LITERAL>:        <INTEGER>(\.?<INTEGER>)?<EXPONENT>?;
<BASE>:                    <INTEGER>;
<BASED_INTEGER>:           <EXTENDED_DIGIT>(_?<EXTENDED_DIGIT>)*;
<BASED_LITERAL>:           <BASE>\#<BASED_INTEGER>(\.<BASED_INTEGER>)?\#<EXPONENT>?;

<IDENTIFIER>: [a-zA-Z](_?[a-zA-Z0-9])*;
<eol>: \r | \n | \r\n	;

%right ""PROCEDURE"" ""FUNCTION"" ""PROTECTED"" ""ALL"" ""CONSTANT"";

%id <pragma> ;

%start typeDefEntry literalEntry nameEntry rangeEntry expressionEntry statementEntry genericTypeDefEntry typeDefEntry contextSpecEntry declEntry unitEntry bodyEntry;


parser_result :
	source_unit_s
	{ self builder parserResult: '1'}
	;

source_unit_s :
	{ OrderedCollection new }
	| source_unit_s source_unit
	{ '1' add: '2'. '1' }
	| pragma pragma_s
	{ OrderedCollection new }
	;

source_unit : 
	context_spec private_opt unit pragma_s
	{ self builder unit: '3' private: '2' interfaces: '1' }
	| private_opt unit pragma_s
	{ self builder unit: '2' private: '1' interfaces: self builder noInterface }
	;

typeDefEntry : 
	type_def
	{ self builder parserResult: '1' }
	;
	
literalEntry :
	literal
	{self builder parserResult: '1'}
	| string	
	{self builder parserResult: '1'}
	| identifier	
	{self builder parserResult: '1' value}
	;
	
nameEntry : 
	name  
	{self builder parserResult: '1'}
	;

expressionEntry :
	expression
	{self builder parserResult: '1'}
	;
	
statementEntry :
	statement
	{self builder parserResult: '1'}
	;

rangeEntry :
	range 
	{self builder parserResult: '1'}
	;
	
genericTypeDefEntry :
	generic_type_def
	{self builder parserResult: '1'}
	;

declEntry :
	decl
	{self builder parserResult: '1'}
	;
	 
contextSpecEntry :
	context_spec
	{self builder parserResult: '1'}
	;

unitEntry :
	unit 
	{self builder parserResult: '1'}
	;
	
bodyEntry :
	body 
	{self builder parserResult: '1'}
	;


semicolon : 
	"";"" 
	{  '1' }
	;

pragma  : PRAGMA identifier "";"" 
	{ self builder pragma: '2' value arguments: self builder noArgument }
	| PRAGMA simple_name ""("" pragma_arg_s "")"" "";""
	{ self builder  pragma: '2' value arguments: '4' }
	;

pragma_arg_s : 
	pragma_arg
	{ OrderedCollection with: '1' }
	| pragma_arg_s "","" pragma_arg
	{ '1' add: '3'. '1' }
	;

pragma_arg : 
	expression
	{ self builder pragmaArgument: '1' named: self builder noName}
	| simple_name RIGHT_SHAFT expression
	{ self builder pragmaArgument: '3' named: '1' value}
	;

pragma_s : 
	pragma*
	;

decl    : 
	object_decl
	{ '1'}
	| number_decl
	{ '1'}
	| type_decl
	{ '1'}
	| subtype_decl
	{ '1'}
	| subprog_decl
	{ '1'}
	| pkg_decl
	{ '1'}
	| task_decl
	{ '1'}
	| prot_decl
	{ '1'}
	| exception_decl
	{ '1'}
	| rename_decl
	{ '1'}
	| generic_decl
	{ '1'}
	| body_stub
	{ '1'}
	;

object_decl : 
	def_id_s "":"" object_qualifier_opt object_subtype_def init_opt semicolon
	{ self builder objectNames: '1' optQualifier: '3' subTypeDef: '4' optInit: '5' }
	;

def_id_s : 
	def_id
	{ OrderedCollection with: '1' }
	| def_id_s "","" def_id
	{ '1' add: '3'. '1' }
	;

def_id  : 
	identifier
	{ '1' value }
	;

object_qualifier_opt :
	{ self builder noQualifier }
	| ALIASED
	{ self builder aliasedQualifier }
	| CONSTANT
	{ self builder constantQualifier }
	| ALIASED CONSTANT
	{ self builder aliasedConstantQualifier }
	;

object_subtype_def : 
	subtype_ind
	{  '1' }
	| array_type
	{  '1' }
	;

init_opt :
	{ self builder noInit }
	| IS_ASSIGNED expression
	{ '2' }
	;

number_decl : def_id_s "":"" CONSTANT IS_ASSIGNED expression semicolon
	{ self builder numberDeclarationIdentifiers: '1' init: '5' }
	;

type_decl : TYPE identifier discrim_part_opt type_completion semicolon
	{ self withStartToken: '1' endToken: '5' return: (self builder typeIdentifier: '2' value discrimPartOpt: '3' completion: '4') }
	;

discrim_part_opt :
	{ self builder noDiscrimPart }
	| discrim_part
	{ self builder discrimPart: '1' }
	| parenthesized_box
	{ self builder genericDiscriminant }
	;
	
parenthesized_box :
	 ""("" box "")""
	{ '2' }
	;

box :
	BOX 
	{ self builder box }
	;

type_completion :
	{ self builder noTypeCompletion }
	| IS type_def
	{ '2' }
	;

type_def : 
	enumeration_type
	{  '1' }
	| integer_type
	{  '1' }
	| real_type
	{  '1' }
	| array_type
	{  '1' }
	| record_type
	{  '1' }
	| access_type
	{  '1' }
	| derived_type
	{  '1' }
	| private_type
	{  '1' }
	;

subtype_decl : 
	SUBTYPE identifier IS subtype_ind semicolon
	{ self withStartToken: '1' endToken: '5' return: (self builder subtypeIdentifier: '2' value subTypeInd: '4') }
	;

subtype_ind : 
	name constraint
	{ self builder name: '1' constraint: '2' }
	| name
	{ self builder name: '1' constraint: self builder noConstraint }
	;

constraint : 
	range_constraint
	{ '1' }
	| decimal_digits_constraint
	{ '1' }
	;

decimal_digits_constraint : 
	DIGITS expression range_constraint_opt
	{ self builder decimalDigitConstraintExpression: '2' rangeConstraintOpt: '3' }
	;

derived_type : 
	NEW subtype_ind
	{ self builder newSubtypeInd: '2' with: self builder noWithPrivate abstract: self builder noAbstract}
	| NEW subtype_ind WITH PRIVATE
	{ self builder newSubtypeInd: '2' with: self builder withPrivate abstract: self builder noAbstract }
	| NEW subtype_ind WITH record_def
	{ self builder newSubtypeInd: '2' with: '4' abstract: self builder noAbstract }
	| ABSTRACT NEW subtype_ind WITH PRIVATE
	{ self builder newSubtypeInd: '3' with: self builder withPrivate abstract: self builder abstract }
	| ABSTRACT NEW subtype_ind WITH record_def
	{ self builder newSubtypeInd: '3' with: '5' abstract: self builder abstract }
	;

range_constraint : 
	RANGE range
	{ self builder rangeConstraintRange: '2' }
	;

range : 
	simple_expression DOT_DOT simple_expression
	{ self builder rangeFrom: '1' to: '3' }
	| name TIC RANGE
	{ self builder rangeNamed: '1' argument: nil}
	| name TIC RANGE ""("" expression "")""
	{ self builder rangeNamed: '1' argument: '5' }
	;

enumeration_type : 
	""("" enum_id_s "")""
	{ self builder enumerationTypeElements: '2' }
	;

enum_id_s : 
	enum_id
	{ OrderedCollection with: '1' }
	| enum_id_s "","" enum_id
	{ '1' add: '3'. '1' }
	;

enum_id : 
	identifier
	{ self builder stringEnumerationId: '1' value }
	| 
	char
	{ self builder characterEnumerationId: '1' }
	;

integer_type : 
	range_spec
	{ self builder integerTypeRangeSpec: '1' }
	| MOD expression
	{ self builder integerTypeModSpec: '2' }
	;

range_spec : 
	range_constraint
	{ '1' }
	;

range_spec_opt :
	{ self builder noRangeSpec }
	| range_spec
	{ self builder rangeSpec: '1'  }
	;

real_type : 
	float_type
	{  '1' }
	| fixed_type
	{ '1' }
	;

float_type : 
	DIGITS expression range_spec_opt
	{ self builder digitsExpression: '2' rangeSpecOpt: '3' }
	;

fixed_type : 
	DELTA expression range_spec_opt
	{ self builder deltaExpression: '2' rangeSpecOpt: '3' }
	| DELTA expression DIGITS expression range_spec_opt
	{ self builder deltaExpression: '2' digits: '4' rangeSpecOpt: '5' }
	;

array_type : 
	unconstr_array_type
	{ '1' }
	| constr_array_type
	{  '1' }
	;

unconstr_array_type : 
	ARRAY ""("" index_s "")"" OF component_subtype_def
	{ self builder arrayTypeIndexes: '3' of: '6' }
	;

constr_array_type : 
	ARRAY iter_index_constraint OF component_subtype_def
	{ self builder arrayTypeIndexes: '2' of: '4' }
	;

component_subtype_def : 
	aliased_opt subtype_ind
	{ self builder aliasedOpt: '1' subtypeInd: '2' }
	;

aliased_opt : 
	{ self builder noAlias }
	| ALIASED
	{ self builder aliased }
	;

index_s : index
	{ OrderedCollection with: '1' }
	| index_s "","" index
	{ '1' add: '3'. '1' }
	;

index : 
	name RANGE box
	{ self builder index: '1' }
	;

iter_index_constraint : 
	""("" iter_discrete_range_s "")""
	{ '2' }
	;

iter_discrete_range_s : 
	discrete_range
	{ OrderedCollection with: '1' }
	| iter_discrete_range_s "","" discrete_range
	{ '1' add: '3'. '1' }
	;
	
discrete_range : 
	name range_constraint_opt
	{ self builder discreteRangeName: '1' constraintOpt: '2' }
	| range
	{ '1' }
	;

range_constraint_opt :
	{ self builder noRangeConstraint }
	| range_constraint
	{ '1' }
	;

record_type : 
	tagged_opt limited_opt record_def
	{ self builder recordTypeTaggedOpt: '1' limitedOpt: '2' recordDef: '3' }
	;

record_def : 
	RECORD pragma_s comp_list END RECORD
	{ self builder recordComponents:  '3' }
	| NuLL RECORD
	{ self builder nullRecord }
	;

tagged_opt :
	{ self builder notTagged }
	| TAGGED
	{ self builder tagged }
	| ABSTRACT TAGGED
	{ self builder taggedAbstract }
	;

comp_list : 
	comp_decl_s variant_part_opt
	{ self builder componentDecls: '1' variantPartOpt: '2' }
	| variant_part pragma_s
	{ self builder componentDecls: self builder noComponent variantPartOpt: '1' }
	| NuLL semicolon pragma_s
	{ self builder  componentDecls: self builder noComponent variantPartOpt: self builder noVariantPart }
	;

comp_decl_s : 
	comp_decl
	{  OrderedCollection with: '1' }
	| comp_decl_s pragma_s comp_decl
	{ '1' add: '3'.  '1' }
	;

variant_part_opt : 
	pragma_s
	{ self builder noVariantPart }
	| pragma_s variant_part pragma_s
	{ '2' }
	;

comp_decl : 
	def_id_s "":"" component_subtype_def init_opt semicolon
	{ self builder componentIdentifiers: '1' compSubtypeDef: '3' initOpt: '4' }
	;

discrim_part : 
	""("" discrim_spec_s "")""
	{ self builder discrimSpecs: '2' }
	;

discrim_spec_s : 
	discrim_spec
	{ OrderedCollection with: '1' }
	| discrim_spec_s semicolon discrim_spec
	{ '1' add: '3'. '1' }
	;

discrim_spec : 
	def_id_s "":"" access_opt qualified_name init_opt
	{ self builder discrimSpecIdentifiers:  '1' accessOpt: '3' mark: '4' initOpt: '5' }
	;

access_opt :
	{ self builder noAccess }
	| ACCESS
	{  self builder access }
	;

simple_identifier : 
	identifier 
	{ self builder simpleIdentifier: '1' value }
	;

variant_part : 
	CASE simple_identifier IS pragma_s variant_s END CASE semicolon
	{ self builder variantPartCase: '2' elements:  '5' }
	;

variant_s : 
	variant*
	;

variant : 
	WHEN choice_s RIGHT_SHAFT pragma_s comp_list
	{ self builder variantPartElementWhen: '2' componentList: '5' }
	;

choice_s : 
	choice
	{ OrderedCollection with: '1' }
	| choice_s ""|"" choice
	{ '1' add: '3'. '1' }
	;

choice : 
	expression
	{ self builder expressionChoice: '1' }
	| discrete_with_range
	{ self builder rangeChoice: '1' }
	| OTHERS
	{ self builder otherChoice }
	;

discrete_with_range : 
	name range_constraint
	{ self builder discreteRangeName: '1' constraintOpt: '2'  }
	| range
	{ '1' }
	;
	
access_type :	
	ACCESS access_type_tail
	{ '2' }
	;

access_type_tail :
	subprog_access_type
	{ '1' }
	| object_access_type
	{ '1' }
	;
	
subprog_access_type :
	 PROCEDURE formal_part_opt
	{ self withStartToken: '1' return: (self builder accessToSubprogram: '2' contents accessMode: self builder noAccessMode return: self builder noReturn) }
	| PROTECTED PROCEDURE formal_part_opt
	{ self withStartToken: '1' return: (self builder accessToSubprogram: '3' contents accessMode: self builder protectedAccessMode return: self builder noReturn) }
	| FUNCTION formal_part_opt RETURN qualified_name
	{ self withStartToken: '1' return: (self builder accessToSubprogram: '2' contents accessMode: self builder noAccessMode return: '4') }
	| PROTECTED FUNCTION formal_part_opt RETURN qualified_name
	{ self withStartToken: '1' return: (self builder accessToSubprogram: '3' contents accessMode: self builder protectedAccessMode return: '5') }
	;

object_access_type :
	CONSTANT subtype_ind
	{ self builder accessToObject: '2' accessMode: self builder constantAccessMode }
	| ALL subtype_ind
	{ self builder accessToObject: '2' accessMode: self builder allAccessMode }
	| subtype_ind
	{ self builder accessToObject: '1' accessMode: self builder noAccessMode }
	;

decl_part :
	{ self builder noDeclPart }
	| decl_item_or_body+
	{ self builder declPart: '1' }
	;

decl_item : 
	decl
	{  '1' }
	| use_clause
	{  '1' }
	| rep_spec
	{ '1' }
	| pragma
	{ '1' }
	;

decl_item_or_body : 
	body
	{  '1' }
	| decl_item
	{  '1' }
	;

body : 
	subprog_body
	{  '1' }
	| pkg_body
	{  '1' }
	| task_body
	{  '1' }
	| prot_body
	{  '1' }
	;

name : 
	identifier
	{ self builder identifier: '1' }
	| indexed_comp
	{  '1' }
	| selected_comp
	{  '1' }
	| attribute
	{ '1' }
	| string
	{ self builder stringAsName: '1' }
	;

qualified_name :
	simple_name
	{ self withStartToken: '1' endToken: '1' return: (self builder qualifiedName: '1') }
	| qualified_name TIC attribute_id
	{ self withStartToken: '1' endToken: '3' return: (self builder name: '1' attribute: '3') }
	| qualified_name ""."" simple_name
	{ self withStartToken: '1' endToken: '3' return: (self builder selected: '1' selector: ( self builder simpleNameSelector: '3' value )) }
	;

simple_name : 
	identifier 
	{ '1'  }
	;

compound_name : 
	simple_name
	{ self builder compoundName: '1' value}
	| compound_name ""."" simple_name
	{ self builder compoundName:  '1' suffix: '3' value }
	;

c_name_list : 
	compound_name
	{ OrderedCollection with: '1' }
	 | c_name_list "","" compound_name
	{ '1' add: '3'. '1'}
	;

string : 
	lex_string
	{ self builder stringLiteral: '1'}
	;

lex_string :
	<char_string>
	{ '1' value copyFrom: 2 to: '1' value size - 1}
	;

indexed_comp : 
	name ""("" index_list "")""
	{ self builder name: '1' indexes: '3' }
	;

index_list: 
	value_s
	{ '1' }
	;
	
value_s : 
	value
	{ OrderedCollection with: '1' }
	| value_s "","" value
	{ '1' add: '3'. '1'}
	;
	
value : 
	expression
	{ '1' }
	| comp_assoc
	{ '1' }
	| discrete_with_range
	{ '1' }
	;

selected_comp : 
	name ""."" selector
	{ self builder selected: '1' selector: '3' }
	;

selector :
	simple_name
	{ self builder simpleNameSelector: '1' value }
	| char
	{ self builder charSelector: '1' }
	| lex_string
	{ self builder stringSelector:  '1'}
	| ALL
	{ self builder allSelector}
	;

attribute : 
	name TIC attribute_id
	{ self builder name: '1' attribute: '3' }
	;

attribute_id : 
	identifier_attribute
	{  '1' }
	| digits
	{ '1' }
	| delta
	{ '1' }
	| access
	{ '1' }
	;

identifier_attribute :
	identifier
	{ self builder identifierAttribute: '1' value }
	;

digits:	
	DIGITS
	{ self builder digits }
	;
	
delta: 
	DELTA
	{ self builder delta }
	;
	
access: 
	ACCESS
	{ self builder access }
	;

literal : 
	character_lit
	{ '1' }
	| null_lit
	{ '1' }
	| numeric_lit
	{ '1' }
	;

null_lit :
	NuLL 
	{  self builder nullLiteral: '1' value }
	;

aggregate : 
	""("" comp_assoc "")""
	{ self builder aggregate: (Array with: '2') }
	| ""("" aggregate_element_s "")""
	{ self builder aggregate: '2' }
	
	| ""("" expression WITH index_list "")""
	{ self builder expression: '2' withIndexList: '4' }
	| ""("" expression WITH NuLL RECORD "")""
	{ self builder expression: '2' withIndexList: self builder nullRecord }
	| ""("" NuLL RECORD "")""
	{  self builder expression: self builder noExpression withIndexList: self builder nullRecord  }
	;


aggregate_element_s : 
	aggregate_element "","" aggregate_element
	{ OrderedCollection with: '1' with: '3'}
	| aggregate_element_s "","" aggregate_element
	{ '1' add: '3'. '1'}
	;
	
aggregate_element : 
	expression
	{  '1' }
	| comp_assoc
	{ '1' }
	| discrete_with_range
	{  '1' }
	;

comp_assoc : 
	choice_s RIGHT_SHAFT expression
	{ self builder componentAssociationChoices: '1' expression: '3' }
	;

expression : 
	relation
	{  '1' }
	| expression logical relation
	{ self builder expression: '1' logical: '2' relation: '3' }
	| expression short_circuit relation
	{ self builder expression: '1' shortCircuit: '2' relation: '3' }
	;

logical : 
	and 
	{ '1' }
	| or 
	{ '1' }
	| xor 
	{ '1' }
	;

and: 
	AND
	{ self builder and } 
	;
or: 
	OR
	{ self builder or } 
	;
xor: 
	XOR
	{ self builder xor } 
	;

short_circuit : 
	AND THEN
	{ self builder andThen }
	| OR ELSE
	{ self builder orElse }
	;

relation : 
	simple_expression
	{ self builder simpleExpression: '1' }
	| simple_expression relational simple_expression
	{ self builder expression: '1' relational: '2' expression: '3' }
	| simple_expression membership range
	{ self builder expression: '1' memberShip: '2' expression: '3' }
	| simple_expression membership name
	{ self builder expression: '1' memberShip: '2' expression: '3' }
	;

relational : 
	""=""
	{ self builder equal }
	| NE
	{ self builder nonEqual }
	| ""<""
	{ self builder lessThan }
	| LT_EQ
	{ self builder lessThanOrEqual }
	| "">""
	{ self builder greaterThan }
	| GE
	{ self builder greaterThanOrEqual }
	;

membership : 
	IN
	{ self builder in }
	| NOT IN
	{ self builder notIn }
	;

simple_expression : 
	unary term
	{ self builder unary: '1' term: '2' }
	| term
	{ self builder term: '1' }
	| simple_expression adding term
	{ self builder expression: '1' adding: '2' term: '3' }
	;

unary   : 
	""+""
	{ self builder unaryPlus }
	| ""-""
	{ self builder unarySubstract }
	;

adding  : 
	""+""
	{ self builder plus }
	| ""-""
	{ self builder substract }
	| ""&""
	{ self builder concat }
	;

term    : 
	factor
	{ '1' }
	| term multiplying factor
	{ self builder term: '1' multiply: '2' factor: '3' }
	;

multiplying : 
	""*""
	{ self builder mult }
	| ""/""
	{ self builder div }
	| MOD
	{ self builder mod }
	| REM
	{ self builder rem }
	;

factor : 
	primary
	{ '1' }
	| NOT primary
	{ self builder not: '2' }
	| ABS primary
	{ self builder abs: '2' }
	| primary EXPON primary
	{ self builder primary: '1' expon: '3' }
	;

primary : 
	literal
	{ '1' }
	| name
	{ '1' }
	| allocator
	{ '1' }
	| qualified
	{ '1' }
	| parenthesized_primary
	{ '1' }
	;

parenthesized_primary : 
	aggregate
	{ '1' }
	| 
	""("" expression "")""
	{ self builder parenthesized: '2' }
	;

qualified : 
	name TIC parenthesized_primary
	{ self builder name: '1' primary: '3' }
	;

allocator : 
	NEW name
	{  self builder newName: '2' }
	| NEW qualified
	{  self builder newName: '2' }
	;

statement_s : 
	stmt_s
	{ self builder statements: '1' }
	;

stmt_s :
	statement
	{ OrderedCollection with: '1' }
	| stmt_s  statement
	{ '1' add: '2'. '1' }
	;

statement : 
	unlabeled
	{ '1' }
	| label+ unlabeled
	{ self builder labels: '1' statement: '2' }
	;

unlabeled : 
	simple_stmt
	{ self builder simpleStatement: '1' }
	| compound_stmt
	{ self builder compoundStatement: '1' }
	| pragma
	{ '1' }
	;

simple_stmt : 
	null_stmt
	{ '1' }
	| assign_stmt
	{ '1' }
	| exit_stmt
	{ '1' }
	| return_stmt
	{ '1' }
	| goto_stmt
	{ '1' }
	| procedure_call
	{ '1' }
	| delay_stmt
	{ '1' }
	| abort_stmt
	{ '1' }
	| raise_stmt
	{ '1' }
	| code_stmt
	{ '1' }
	| requeue_stmt
	{ '1' }
	;

compound_stmt : 
	if_stmt
	{ '1' }
	| case_stmt
	{ '1' }
	| loop_stmt
	{ '1' }
	| block
	{ '1' }
	| accept_stmt
	{ '1' }
	| select_stmt
	{ '1' }
	;

label : 
	LT_LT identifier GT_GT
	{ self builder label: '2' value }
	;

null_stmt : 
	NuLL semicolon
	{ self builder nullStatement }
	;

assign_stmt : 
	name IS_ASSIGNED expression semicolon
	{ self builder assign: '3' to: '1' }
	;

if_stmt : 
	IF cond_clause_s else_opt END IF semicolon
	{ self builder if: '2' else: '3' }
	;

cond_clause_s : 
	cond_clause
	{ OrderedCollection with: (self builder ifCondition: '1' first statements: '1' second) }
	| cond_clause_s ELSIF cond_clause
	{ '1' add: (self builder ifCondition: '3' first statements: '3' second). '1' }
	;

cond_clause : 
	cond_part statement_s
	{ OrderedCollection with: '1' with: '2' }
	;

cond_part : 
	condition THEN
	{ '1' }
	;

condition : 
	expression
	{ '1' }
	;

else_opt :
	{ self builder noElse }
	| ELSE statement_s
	{ '2' }
	;

case_stmt : 
	case_hdr pragma_s alternative_s END CASE semicolon
	{ self builder case: '1' alternatives: '3' }
	;

case_hdr : 
	CASE expression IS
	{ '2' }
	;

alternative_s : 
	alternative*
	;

alternative : 
	WHEN choice_s RIGHT_SHAFT statement_s
	{ self builder when: '2' do: '4' }
	;

loop_stmt : 
	label_opt iteration basic_loop id_opt semicolon
	{ self builder labelOpt: '1' iteration: '2' basicLoop: '3' }
	;

label_opt :
	{ self builder noLabel }
	| identifier "":""
	{ self builder label: '1' value }
	;

iteration :
	{ self builder noIteration }
	| WHILE condition
	{ self builder while: '2' }
	| iter_part reverse_opt discrete_range
	{ self builder for: '1' reverseOpt: '2' in: '3' }
	;

iter_part : 
	FOR identifier IN
	{ '2' value }
	;

reverse_opt :
	{ self builder noReverse }
	| REVERSE
	{ self builder reverse }
	;

basic_loop : 
	LOOP statement_s END LOOP
	{  '2' }
	;
	
id_opt :
	{ self builder noId }
	| designator
	{ '1' }
	;

block : 
	label_opt block_decl block_body END id_opt semicolon
	{  self builder labelOpt: '1' declare: '2' body: '3' }
	;

block_decl :
	{ self builder noBlockDecl }
	| DECLARE decl_part
	{ '2' }
	;

block_body : 
	BEGiN handled_stmt_s
	{ self builder blockBodyStatements: '2' first exceptionHandlers: '2' second}
	;

handled_stmt_s : 
	statement_s except_handler_part_opt 
	{ self builder statements: '1' handlerPartOpt: '2' }
	; 

except_handler_part_opt :
	{ self builder noHandler }
	| except_handler_part
	{ self builder exceptionHandler: '1' }
	;

exit_stmt : EXIT name_opt when_opt semicolon
	{ self builder exit: '2' whenOpt: '3' }
	;

name_opt :
	{ self builder noName }
	| name
	{ '1' }
	;

when_opt :
	{ self builder noCondition }
	| WHEN condition
	{ '2' }
	;

return_stmt : 
	RETURN semicolon
	{ self builder return }
	| RETURN expression semicolon
	{ self builder return: '2' }
	;

goto_stmt : GOTO identifier semicolon
	{ self builder goto: '2' value }
	;

subprog_decl : 
	subprog_spec semicolon
	{ self withEndToken: '2' return: '1' }
	| generic_subp_inst semicolon
	{ self withEndToken: '2' return: '1' }
	| subprog_spec_is_push ABSTRACT semicolon
	{ self withEndToken: '2' return: (self builder abstractSubprogram: '1')  }
	;

subprog_spec : 
	PROCEDURE compound_name formal_part_opt
	{ self withStartToken: '1' return: (self builder procedureSpecName: '2' formalPartOpt: '3' contents) }
	| FUNCTION designator formal_part_opt RETURN name
	{ self withStartToken: '1' return: (self builder functionSpecName: '2' formalPartOpt: '3' contents return: '5') }
	| FUNCTION designator  /* for generic inst and generic rename */
	{ self withStartToken: '1' return: (self builder functionSpecName: '2') }
	;

designator : 
	compound_name
	{  '1' }
	| <char_string>
	{ self builder stringDesignator: '1' value }
	;

formal_part_opt : 
	{ self builder stubEntity: (self builder noFormalPart) }
	| formal_part
	{ '1' }
	;

formal_part : 
	""("" param_s "")""
	{  self withStartToken: '1' endToken: '3' return: (self builder stubEntity: '2') }
	;

param_s : 
	param
	{ OrderedCollection with: '1' }
	| param_s semicolon param
	{ '1' add: '3'. '1' }
	;

param : 
	def_id_s "":"" mode qualified_name init_opt
	{ self builder paramIdentifiers: '1' mode: '3' domainName: '4' init: '5' }
	;

mode :
	{ self builder noMode }
	| IN
	{ self builder inMode }
	| OUT
	{ self builder outMode }
	| IN OUT
	{ self builder inOutMode }
	| ACCESS
	{ self builder accessMode }
	;

subprog_spec_is_push : 
	subprog_spec IS
	{ '1' }
	;

subprog_body : 
	subprog_spec_is_push decl_part block_body END id_opt semicolon
	{ self withStartToken: '1' endToken: '6' return: (self builder subProgBodySpec: '1' declPart: '2' body: '3') }
	;

procedure_call : 
	name semicolon
	{ self withStartToken: '1' endToken: '2' return: (self builder procedureCall: '1') }
	;

pkg_decl : 
	pkg_spec semicolon
	{ self withStartToken: '1' endToken: '2' return: '1' }
	| generic_pkg_inst semicolon
	{ self withStartToken: '1' endToken: '2' return: '1' }
	;

pkg_spec : 
	PACKAGE compound_name pkg_def 
	{ self withStartToken: '1' endToken: '3' return: (self builder package: '2' is: '3') }
	;

pkg_def : 
	IS pkg_part pkg_private_part_opt END c_id_opt
	{ self builder packagePublicPart: '2' privatePart: '3' } 
	;
	
pkg_part :
	decl_item*
	{ self builder packagePart: '1' }
	;

pkg_private_part_opt :
	{ self builder noPrivatePart }
	| PRIVATE pkg_part
	{ '2' }
	;

c_id_opt : 
	{ self builder noId }
	| compound_name
	{ '1' }
	;

pkg_body : 
	PACKAGE BODY compound_name IS decl_part body_opt END c_id_opt semicolon
	{ self withStartToken: '1' endToken: '9' return: (self builder packageBody: '3' declPart: '5' bodyOpt: '6') }
	;

body_opt :
	{ self builder noBodyPart }
	| block_body
	{ '1' }
	;

private_type : 
	tagged_opt limited_opt PRIVATE
	{ self builder privateTypeTaggedOpt: '1' limitedOpt: '2' }
	;

limited_opt :
	{ self builder unlimited }
	| LIMITED
	{ self builder limited }
	;

use_clause : 
	USE name_s semicolon
	{ self builder useClauseNames: '2' }
	| USE TYPE name_s semicolon
	{ self builder useTypesClauseNames: '3' }	
	;

name_s : 
	name
	{ OrderedCollection with: '1' }
	| name_s "","" name
	{ '1' add: '3'. '1' }
	;


rename_decl : 
	object_rename_decl
	{  '1' }
	| exception_rename_decl
	{  '1' }
	| rename_unit
	{  '1' }
	;

object_rename_decl :
	def_id_s "":"" object_qualifier_opt subtype_ind renames semicolon
	{ self builder objectNames: '1' optQualifier: '3' subTypeDef: '4' renames: '5' }
	;

exception_rename_decl :
	def_id_s "":"" EXCEPTION renames semicolon
	{ self builder exceptionNames: '1' renames: '4' }
	;

rename_unit : 
	PACKAGE compound_name renames semicolon
	{ self builder packageName: '2' renames: '3' genericFormalPart: self builder noGenericFormalPart }
	| subprog_spec renames semicolon
	{ self builder subProgSpec: '1' renames: '2' genericFormalPart: self builder noGenericFormalPart}
	| generic_formal_part PACKAGE compound_name renames semicolon
	{ self builder packageName: '3' renames: '4' genericFormalPart: '1' }
	| generic_formal_part subprog_spec renames semicolon
	{ self builder subProgSpec: '2' renames: '3' genericFormalPart: '1'}
	;

renames : 
	RENAMES name
	{ '2' }
	;

task_decl : 
	task_spec semicolon
	{ self withEndToken: '2' return: '1' }
	;

task_spec : 
	TASK simple_name task_def
	{ self withStartToken: '1' return: (self builder task: '2' value is: '3') }
	| TASK TYPE simple_name discrim_part_opt task_def
	{ self withStartToken: '1' return: (self builder taskType: '3' value discrimPart: '4' is: '5') }
	;

task_def :
	{ self builder noTaskDef }
	| IS task_part task_private_opt END id_opt
	{ self builder taskPublicPart: '2' privatePart: '3' }
	;
	
task_part :
	entry_decl_s rep_spec_s
	{ self builder taskEntries: '1' representations: '2' }
	;

task_private_opt :
	{ self builder noTaskPrivate }
	| PRIVATE task_part
	{  '2' }
	;

task_body : 
	TASK BODY simple_name IS decl_part block_body END id_opt semicolon
	{ self withStartToken: '1' endToken: '9' return: (self builder taskBody: '3' value declPart: '5' body: '6') }
	;

prot_decl : 
	prot_spec semicolon
	{ '1' }
	;

prot_spec : 
	PROTECTED identifier prot_def
	{ self builder protected: '2' value is: '3' }
	| PROTECTED TYPE simple_name discrim_part_opt prot_def
	{ self builder protectedType: '3' value discrimPart: '4' is: '5' }
	;

prot_def : 
	IS prot_public_part prot_private_opt END id_opt
	{ self builder protectedPublicPart: '2' privatePart: '3' }
	;

prot_public_part :
	prot_op_decl_s
	{ self builder publicProtectedPart: '1' }
	;

prot_private_opt :
	{ self builder noPrivatePart  }
	| PRIVATE prot_elem_decl_s 
	{ self builder privateProtectedPart: '2' }
	;

prot_op_decl_s : 
	prot_op_decl*
	{ self builder protectedElements: '1' }
	;

prot_op_decl : 
	entry_decl
	{ '1' }
	| subprog_spec semicolon
	{ '1' }
	| rep_spec
	{ '1' }
	| pragma
	{ '1' }
	;

prot_elem_decl_s : 
	prot_elem_decl *
	;

prot_elem_decl : 
	prot_op_decl 
	{ '1' }
	| comp_decl
	{ '1' }
	 ;

prot_body : 
	PROTECTED BODY simple_name IS prot_op_body_s END id_opt semicolon
	{ self builder protectedBody: '3' value elements: '5' }
	;

prot_op_body_s : 
	pragma_s
	{ OrderedCollection new }
	| prot_op_body_s prot_op_body pragma_s
	{ '1' add: '2'. '1' }
	;

prot_op_body : 
	entry_body
	{  '1' }
	| subprog_body
	{  '1' }
	| subprog_spec semicolon
	{  '1' }
	;

entry_decl_s : 
	pragma_s
	{ OrderedCollection new}
	| entry_decl_s entry_decl pragma_s
	{ '1' add: '2'. '1' }
	;

entry_decl : 
	ENTRY identifier formal_part_opt semicolon
	{ self builder entryDecl: '2' value discreteRange: self builder noDiscreteRange formalPart: '3' contents }
	| ENTRY identifier ""("" discrete_range "")"" formal_part_opt semicolon
	{ self builder entryDecl: '2' value discreteRange: '4' formalPart: '6' contents  }
	;

entry_body : 
	ENTRY identifier formal_part_opt WHEN condition entry_body_part
	{ self builder entryBodyName: '2' value iteration: self builder noIteration formalPart: '3' contents when: '5' body: '6' }
	| ENTRY identifier entry_iter_part formal_part_opt WHEN condition entry_body_part
	{ self builder entryBodyName: '2' value iteration: '3' formalPart: '4' contents when: '6' body: '7' }
	;

entry_iter_part :
	""("" iter_part discrete_range "")""
	{ self builder entryIterationPartName: '2' range: '3' }
	;
	
entry_body_part : 
	semicolon
	{ self builder noEntryBody }
	| IS decl_part block_body END id_opt semicolon
	{ self builder entryBodyDeclPart: '2' blockBody: '3' }
	;

rep_spec_s :
	{ OrderedCollection new }
	| rep_spec_s rep_spec pragma_s
	{ '1' add: '2'. '1' }
	;

entry_call : 
	name semicolon
	{ self builder entryCall: '1' }
	;

accept_stmt : 
	ACCEPT entry_name formal_part_opt semicolon
	{ self builder accept: '2' formalPart: '3' contents statements: OrderedCollection new handlers: self builder noHandler }
	| ACCEPT entry_name formal_part_opt DO handled_stmt_s END id_opt semicolon
	{ self builder accept: '2' formalPart: '3' contents statements: '5' first handlers: '5' second  }
	;

entry_name : 
	simple_name
	{ self builder entryName: '1' }
	| entry_name ""("" expression "")""
	{ self builder entryName: '1' argument: '3' }
	;

delay_stmt : 
	DELAY expression semicolon
	{ self builder delay: '2' }
	| DELAY UNTIL expression semicolon
	{ self builder delayUntil: '3' }
	;

select_stmt : 
	select_wait
	{ '1' }
	| async_select
	{ '1' }
	| timed_entry_call
	{ '1' }
	| cond_entry_call
	{ '1' }
	;

select_wait : 
	SELECT guarded_select_alt or_select else_opt END SELECT semicolon
	{ self builder select: '2' or: '3' else: '4' }
	;

guarded_select_alt : 
	select_alt
	{ '1' }
	| WHEN condition RIGHT_SHAFT select_alt
	{ self builder when: '2' select: '4' }
	;

or_select :
	{ OrderedCollection new }
	| or_select OR guarded_select_alt
	{ '1' add: '3'. '1' }
	;

select_alt : 
	accept_stmt stmts_opt
	{ self builder acceptAlternative: '1' statements: '2' }
	| delay_stmt stmts_opt
	{ self builder delayAlternative: '1' statements: '2' }
	| TERMINATE semicolon
	{ self builder terminateAlternative }
	;

delay_or_entry_alt : 
	delay_stmt stmts_opt
	{ Array with: '1' with: '2' }
	| 
	entry_call stmts_opt
	{ Array with: '1' with: '2' }
	;

async_select : 
	SELECT delay_or_entry_alt THEN ABORT statement_s END SELECT semicolon
	{ self builder asyncSelect: '2' first statements: '2' second thenAbortStatements: '5'  }
	;

timed_entry_call : 
	SELECT entry_call stmts_opt OR delay_stmt stmts_opt END SELECT semicolon
	{ self builder timedEntryCall: '2' statements: '3' orDelay: '5' statements: '6'   }
	;

cond_entry_call : 
	SELECT entry_call stmts_opt ELSE statement_s END SELECT semicolon
	{ self builder conditionalEntryCall: '2' statements: '3' else: '5' }
	;

stmts_opt :
	{ self builder noStatement }
	| statement_s
	{ '1' }
	;

abort_stmt : 
	ABORT name_s semicolon
	{ self builder abort: '2' }
	;

private_opt :
	{ self builder noPrivate }
	| PRIVATE
	{ self builder private }
	;

context_spec : 
	context_el
	{ OrderedCollection with:  '1' }
	| context_spec context_el
	{ '1' add: '2' . '1' }
	| context_spec pragma
	{ '1' }
	;

context_el : 
	with_clause use_clause_opt
	{ self builder withClause: '1' useClauses: '2' }
	;

with_clause : 
	WITH c_name_list semicolon
	{ self builder withClauseNames: '2' }
	;

use_clause_opt : 
	use_clause*
	;

unit : 
	pkg_decl
	{ '1' }
	| pkg_body
	{ '1' }
	| subprog_decl
	{ '1' }
	| subprog_body
	{ '1' }
	| subunit
	{ '1' }
	| generic_decl
	{ '1' }
	| rename_unit
	{ '1' }
	;

subunit : 
	SEPARATE ""("" compound_name "")"" subunit_body
	{ self builder separate: '3' body: '5' }
	;

subunit_body : 
	subprog_body
	{ '1' }
	| pkg_body
	{ '1' }
	| task_body
	{ '1' }
	| prot_body
	{ '1' }
	;
	
body_stub :
	TASK BODY simple_name IS SEPARATE semicolon
	{ self builder taskBodyStubName: '3' value }
	| PACKAGE BODY compound_name IS SEPARATE semicolon
	{ self builder packageBodyStubName: '3' }
	| subprog_spec IS SEPARATE semicolon
	{ self builder subprogramBodyStubSpec: '1' }
	| PROTECTED BODY simple_name IS SEPARATE semicolon
	{ self builder protectedUnitBodyStubName: '3' value }
	;

exception_decl : 
	def_id_s "":"" EXCEPTION semicolon
	{ self builder exceptionNames: '1' }
	;

except_handler_part : 
	EXCEPTION exception_handler
	{ OrderedCollection with: '2' }
	| except_handler_part exception_handler
	{ '1' add: '2'. '1' }
	;

exception_handler : 
	WHEN except_choice_s RIGHT_SHAFT statement_s
	{ self builder exceptionHandler: self builder noIdentifier choices: '2' statements: '4' }
	| WHEN identifier "":"" except_choice_s RIGHT_SHAFT statement_s
	{ self builder exceptionHandler: '2' value choices: '4' statements: '6' }
	;

except_choice_s : 
	except_choice
	{ OrderedCollection with: '1' }
	| except_choice_s ""|"" except_choice
	{ '1' add: '3'. '1' }
	;

except_choice : 
	name
	{ self builder namedExceptionChoice: '1' }
	| OTHERS
	{ self builder othersExceptionChoice }
	;

raise_stmt : 
	RAISE name_opt semicolon
	{ self builder raise: '2' }
	;

requeue_stmt : 
	REQUEUE name semicolon
	{ self builder requeue: '2' withAbort: false}
	| REQUEUE name WITH ABORT semicolon
	{ self builder requeue: '2' withAbort: true }
	;

generic_decl : 
	generic_formal_part subprog_spec semicolon
	{ self builder genericFormalPart: '1' subProcSpec: '2' }
	| generic_formal_part pkg_spec semicolon
	{ self builder genericFormalPart: '1' packageSpec: '2' }
	;

generic_formal_part : 
	GENERIC
	{ OrderedCollection new }
	| generic_formal_part generic_formal
	{ '1' add: '2'. '1' }
	;

generic_formal : 
	param semicolon
	{ self builder genericFormalParameter:  '1' }
	| TYPE simple_name discrim_part_opt IS generic_type_def semicolon
	{  self builder genericType: (self builder typeIdentifier: '2' value discrimPartOpt: '3' completion: '5') }
	| WITH PROCEDURE simple_name formal_part_opt subp_default semicolon
	{ self builder genericProcedure: (self builder procedureSpecName: (self builder compoundName:'3' value) formalPartOpt: '4' contents) default: '5' }
	| WITH FUNCTION designator formal_part_opt RETURN name subp_default semicolon
	{ self builder genericFunction: (self builder functionSpecName: '3' formalPartOpt: '4' contents return: '6') default: '7'  }
	| WITH PACKAGE simple_name IS NEW name parenthesized_box semicolon
	{ self builder genericPackage: '3' value isNew: '6' arg: self builder box  }
	| WITH PACKAGE simple_name IS NEW name semicolon
	{ self builder genericPackage: '3' value isNew: '6' arg: self builder noBox }
	| use_clause
	{ self builder genericUseClause: '1' }
	;


subp_default :
	{ self builder noGenericSubprogramDefault }
	| IS name
	{ self builder genericSubprogramDefault: '2' }
	| IS box
	{ self builder genericSubprogramDefault: self builder anyExpression }
	;

generic_type_def : 
	parenthesized_box
	{ self builder parenthesized: self builder anyType }
	| box
	{ self builder anyType }
	| RANGE BOX 
	{ self builder anyRangeType }
	| MOD BOX
	{ self builder integerTypeModSpec: self builder anyExpression }
	| DELTA BOX
	{ self builder deltaExpression: self builder anyExpression rangeSpecOpt: self builder noRangeSpec  }
	| DELTA BOX DIGITS BOX
	{ self builder deltaExpression: self builder anyExpression digits: self builder anyExpression rangeSpecOpt: self builder noRangeSpec }
	| DIGITS BOX
	{ self builder digitsExpression: self builder anyExpression rangeSpecOpt: self builder noRangeSpec }
	| array_type
	{ '1' }
	| access_type
	{ '1' }
	| private_type
	{ '1' }
	| generic_derived_type
	{ '1' }
	;

generic_derived_type : 
	NEW subtype_ind
	{ self builder newSubtypeInd: '2' with: self builder noWithPrivate abstract: self builder noAbstract }
	| NEW subtype_ind WITH PRIVATE
	{  self builder newSubtypeInd: '2' with: self builder withPrivate abstract: self builder noAbstract }
	| ABSTRACT NEW subtype_ind WITH PRIVATE
	{ self builder newSubtypeInd: '3' with: self builder withPrivate abstract: self builder abstract  }
	;

generic_subp_inst : 
	subprog_spec IS generic_inst
	{ self builder subProgSpec: '1' isNew: '3' }
	;

generic_pkg_inst : 
	PACKAGE compound_name IS generic_inst
	{ self withStartToken: '1' endToken: '4' return: (self builder genericPackageInstanciation: '2' isNew: '4') }
	;

generic_inst : 
	NEW name
	{ '2' }
	;

rep_spec : 
	attrib_def
	{ '1' }
	| record_type_spec
	{ '1' }
	| address_spec
	{ '1' }
	;

attrib_def : 
	FOR qualified_name USE expression semicolon
	{ self builder attributeDefFor: '2' use: '4' }
	;

record_type_spec : 
	FOR qualified_name USE RECORD align_opt comp_loc_s END RECORD semicolon
	{ self builder recordTypeSpecFor: '2' useRecordAlign: '5' compLocs: '6' }
	;

align_opt :
	{  self builder noAlign }
	| AT MOD expression semicolon
	{ self builder alignAtMod: '3' }
	;

comp_loc_s :
	{ OrderedCollection new }
	| comp_loc_s qualified_name AT expression RANGE range semicolon
	{ '1' add: (self builder componentLocationName: '2' at: '4' range: '6' ). '1' }
	;

address_spec : 
	FOR qualified_name USE AT expression semicolon
	{ self builder addressSpecFor: '2' useAt: '5' }
	;

code_stmt : 
	qualified semicolon
	{ self builder code: '1' }
	;

identifier : 
	<IDENTIFIER>
	{ '1' }
	;

character_lit : 
	char
	{ self builder characterLiteral: '1' asString}
	;
	
char :
	<char_lit>
	{ '1' value second }
	;	
	
numeric_lit : 
	decimal_lit
	{ '1' }
	| based_lit
	{ '1' }
	;

decimal_lit :
	<DECIMAL_LITERAL>
	{ self builder decimalLiteral: '1' }
	;
	
based_lit : 
	<BASED_LITERAL>
	{ self builder basedLiteral: '1' }
	;

TIC : ""'""  { '1' } ;
DOT_DOT : ""..""  { '1' } ;
LT_LT : ""<<""  { '1' } ; 
BOX : ""<>"" { '1' } ;
LT_EQ : ""<=""  { '1' } ;
EXPON : ""**""  { '1' } ;
NE : ""/=""  { '1' } ;
GT_GT : "">>""  { '1' } ;
GE : "">="" { '1' } ;
IS_ASSIGNED : "":=""  { '1' } ;
RIGHT_SHAFT : ""=>"" { '1' } ;

ABORT:                ""ABORT"" { '1' } ;
ABS:                ""ABS"" { '1' } ;
ABSTRACT:		""ABSTRACT"" { '1' } ;
ACCEPT:                ""ACCEPT"" { '1' } ;
ACCESS:                ""ACCESS"" { '1' } ;
ALIASED:		""ALIASED"" { '1' } ;
ALL:                ""ALL"" { '1' } ;
AND:               ""AND"" { '1' } ;
ARRAY:                ""ARRAY"" { '1' } ;
AT:                ""AT"" { '1' } ;
BEGiN:                ""BEGIN"" { '1' } ;
BODY:               ""BODY"" { '1' } ;
CASE:                ""CASE"" { '1' } ;
CONSTANT:                ""CONSTANT"" { '1' } ;
DECLARE:                ""DECLARE"" { '1' } ;
DELAY:                ""DELAY"" { '1' } ;
DELTA:                ""DELTA"" { '1' } ;
DIGITS:                ""DIGITS"" { '1' } ;
DO:                ""DO"" { '1' } ;
ELSE:                ""ELSE"" { '1' } ;
ELSIF:                ""ELSIF"" { '1' } ;
END:                ""END"" { '1' } ;
ENTRY:               ""ENTRY"" { '1' } ;
EXCEPTION:                ""EXCEPTION"" { '1' } ;
EXIT:                ""EXIT"" { '1' } ;
FOR:                ""FOR"" { '1' } ;
FUNCTION:                ""FUNCTION"" { '1' } ;
GENERIC:                ""GENERIC"" { '1' } ;
GOTO:                ""GOTO"" { '1' } ;
IF:                ""IF"" { '1' } ;
IN:                ""IN"" { '1' } ;
IS:                ""IS"" { '1' } ;
LIMITED:                ""LIMITED"" { '1' } ;
LOOP:                ""LOOP"" { '1' } ;
MOD:                ""MOD"" { '1' } ;
NEW:                ""NEW"" { '1' } ;
NOT:                ""NOT"" { '1' } ;
NuLL:                ""NULL"" { '1' } ;
OF:                ""OF"" { '1' } ;
OR:                ""OR"" { '1' } ;
OTHERS:                ""OTHERS"" { '1' } ;
OUT:                ""OUT"" { '1' } ;
PACKAGE:                ""PACKAGE"" { '1' } ;
PRAGMA:                ""PRAGMA"" { '1' } ;
PRIVATE:                ""PRIVATE"" { '1' } ;
PROCEDURE:                ""PROCEDURE"" { '1' } ;
PROTECTED:		""PROTECTED"" { '1' } ;
RAISE:                ""RAISE"" { '1' } ;
RANGE:                ""RANGE"" { '1' } ;
RECORD:                ""RECORD"" { '1' } ;
REM:                ""REM"" { '1' } ;
RENAMES:                ""RENAMES"" { '1' } ;
REQUEUE:		""REQUEUE"" { '1' } ;
RETURN:                ""RETURN"" { '1' } ;
REVERSE:                ""REVERSE"" { '1' } ;
SELECT:                ""SELECT"" { '1' } ;
SEPARATE:                ""SEPARATE"" { '1' } ;
SUBTYPE:                ""SUBTYPE"" { '1' } ;
TAGGED:		""TAGGED"" { '1' } ;
TASK:                ""TASK"" { '1' } ;
TERMINATE:                ""TERMINATE"" { '1' } ;
THEN:                ""THEN"" { '1' } ;
TYPE:                ""TYPE"" { '1' } ;
UNTIL:		""UNTIL"" { '1' } ;
USE:                ""USE"" { '1' } ;
WHEN:                ""WHEN"" { '1' } ;
WHILE:                ""WHILE"" { '1' } ;
WITH:                ""WITH"" { '1' } ;
XOR:                ""XOR"" { '1' } ;"

]

{ #category : #'generated-accessing' }
Ada95Parser class >> scannerClass [
	^Ada95Scanner
]

{ #category : #generated }
Ada95Parser class >> startingStateForbodyEntry [
	^ 12
]

{ #category : #generated }
Ada95Parser class >> startingStateForcontextSpecEntry [
	^ 9
]

{ #category : #generated }
Ada95Parser class >> startingStateFordeclEntry [
	^ 10
]

{ #category : #generated }
Ada95Parser class >> startingStateForexpressionEntry [
	^ 6
]

{ #category : #generated }
Ada95Parser class >> startingStateForgenericTypeDefEntry [
	^ 8
]

{ #category : #generated }
Ada95Parser class >> startingStateForliteralEntry [
	^ 3
]

{ #category : #generated }
Ada95Parser class >> startingStateFornameEntry [
	^ 4
]

{ #category : #generated }
Ada95Parser class >> startingStateForparser_result [
	^ 1
]

{ #category : #generated }
Ada95Parser class >> startingStateForrangeEntry [
	^ 5
]

{ #category : #generated }
Ada95Parser class >> startingStateForstatementEntry [
	^ 7
]

{ #category : #generated }
Ada95Parser class >> startingStateFortypeDefEntry [
	^ 2
]

{ #category : #generated }
Ada95Parser class >> startingStateForunitEntry [
	^ 11
]

{ #category : #accessing }
Ada95Parser >> builder [
	^ self defaultBuilder
]

{ #category : #accessing }
Ada95Parser >> defaultBuilder [
	^ Ada95TreeBuilder new
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForPRAGMA1: nodes [
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForabort_stmt1: nodes [
	^ self builder abort: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaccept_stmt1: nodes [
	^ self builder
		accept: (nodes at: 2)
		formalPart: (nodes at: 3) contents
		statements: OrderedCollection new
		handlers: self builder noHandler
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaccept_stmt2: nodes [
	^ self builder
		accept: (nodes at: 2)
		formalPart: (nodes at: 3) contents
		statements: (nodes at: 5) first
		handlers: (nodes at: 5) second
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaccess1: nodes [
	^ self builder access
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaccess_opt1: nodes [
	^ self builder noAccess
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForadding1: nodes [
	^ self builder plus
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForadding2: nodes [
	^ self builder substract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForadding3: nodes [
	^ self builder concat
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaddress_spec1: nodes [
	^ self builder addressSpecFor: (nodes at: 2) useAt: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate1: nodes [
	^ self builder aggregate: (Array with: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate2: nodes [
	^ self builder aggregate: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate3: nodes [
	^ self builder expression: (nodes at: 2) withIndexList: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate4: nodes [
	^ self builder expression: (nodes at: 2) withIndexList: self builder nullRecord
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate5: nodes [
	^ self builder expression: self builder noExpression withIndexList: self builder nullRecord
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaggregate_element_s1: nodes [
	^ OrderedCollection with: (nodes at: 1) with: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaliased_opt1: nodes [
	^ self builder noAlias
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForaliased_opt2: nodes [
	^ self builder aliased
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForalign_opt1: nodes [
	^ self builder noAlign
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForalign_opt2: nodes [
	^ self builder alignAtMod: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForallocator1: nodes [
	^ self builder newName: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForalternative1: nodes [
	^ self builder when: (nodes at: 2) do: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForand1: nodes [
	^ self builder and
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForassign_stmt1: nodes [
	^ self builder assign: (nodes at: 3) to: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForasync_select1: nodes [
	^ self builder asyncSelect: (nodes at: 2) first statements: (nodes at: 2) second thenAbortStatements: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForattrib_def1: nodes [
	^ self builder attributeDefFor: (nodes at: 2) use: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForattribute1: nodes [
	^ self builder name: (nodes at: 1) attribute: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbased_lit1: nodes [
	^ self builder basedLiteral: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForblock1: nodes [
	^ self builder labelOpt: (nodes at: 1) declare: (nodes at: 2) body: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForblock_body1: nodes [
	^ self builder blockBodyStatements: (nodes at: 2) first exceptionHandlers: (nodes at: 2) second
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForblock_decl1: nodes [
	^ self builder noBlockDecl
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbody_opt1: nodes [
	^ self builder noBodyPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbody_stub1: nodes [
	^ self builder taskBodyStubName: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbody_stub2: nodes [
	^ self builder packageBodyStubName: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbody_stub3: nodes [
	^ self builder subprogramBodyStubSpec: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbody_stub4: nodes [
	^ self builder protectedUnitBodyStubName: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForbox1: nodes [
	^ self builder box
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcase_stmt1: nodes [
	^ self builder case: (nodes at: 1) alternatives: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForchar1: nodes [
	^ (nodes at: 1) value second
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcharacter_lit1: nodes [
	^ self builder characterLiteral: (nodes at: 1) asString
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForchoice1: nodes [
	^ self builder expressionChoice: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForchoice2: nodes [
	^ self builder rangeChoice: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForchoice3: nodes [
	^ self builder otherChoice
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcode_stmt1: nodes [
	^ self builder code: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_assoc1: nodes [
	^ self builder componentAssociationChoices: (nodes at: 1) expression: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_decl1: nodes [
	^ self builder componentIdentifiers: (nodes at: 1) compSubtypeDef: (nodes at: 3) initOpt: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_list1: nodes [
	^ self builder componentDecls: (nodes at: 1) variantPartOpt: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_list2: nodes [
	^ self builder componentDecls: self builder noComponent variantPartOpt: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_list3: nodes [
	^ self builder componentDecls: self builder noComponent variantPartOpt: self builder noVariantPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomp_loc_s2: nodes [
	(nodes at: 1) add: (self builder componentLocationName: (nodes at: 2) at: (nodes at: 4) range: (nodes at: 6)).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcomponent_subtype_def1: nodes [
	^ self builder aliasedOpt: (nodes at: 1) subtypeInd: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcompound_name1: nodes [
	^ self builder compoundName: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcompound_name2: nodes [
	^ self builder compoundName: (nodes at: 1) suffix: (nodes at: 3) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcond_clause1: nodes [
	^ OrderedCollection with: (nodes at: 1) with: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcond_clause_s1: nodes [
	^ OrderedCollection with: (self builder ifCondition: (nodes at: 1) first statements: (nodes at: 1) second)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcond_clause_s2: nodes [
	(nodes at: 1) add: (self builder ifCondition: (nodes at: 3) first statements: (nodes at: 3) second).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcond_entry_call1: nodes [
	^ self builder conditionalEntryCall: (nodes at: 2) statements: (nodes at: 3) else: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForconstr_array_type1: nodes [
	^ self builder arrayTypeIndexes: (nodes at: 2) of: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForcontext_el1: nodes [
	^ self builder withClause: (nodes at: 1) useClauses: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordecimal_digits_constraint1: nodes [
	^ self builder decimalDigitConstraintExpression: (nodes at: 2) rangeConstraintOpt: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordecimal_lit1: nodes [
	^ self builder decimalLiteral: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordecl_part1: nodes [
	^ self builder noDeclPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordecl_part2: nodes [
	^ self builder declPart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordef_id1: nodes [
	^ (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordef_id_s2: nodes [
	(nodes at: 1) add: (nodes at: 3).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordelay_or_entry_alt1: nodes [
	^ Array with: (nodes at: 1) with: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordelay_stmt1: nodes [
	^ self builder delay: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordelay_stmt2: nodes [
	^ self builder delayUntil: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordelta1: nodes [
	^ self builder delta
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForderived_type1: nodes [
	^ self builder newSubtypeInd: (nodes at: 2) with: self builder noWithPrivate abstract: self builder noAbstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForderived_type2: nodes [
	^ self builder newSubtypeInd: (nodes at: 2) with: self builder withPrivate abstract: self builder noAbstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForderived_type3: nodes [
	^ self builder newSubtypeInd: (nodes at: 2) with: (nodes at: 4) abstract: self builder noAbstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForderived_type4: nodes [
	^ self builder newSubtypeInd: (nodes at: 3) with: self builder withPrivate abstract: self builder abstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForderived_type5: nodes [
	^ self builder newSubtypeInd: (nodes at: 3) with: (nodes at: 5) abstract: self builder abstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordesignator2: nodes [
	^ self builder stringDesignator: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordigits1: nodes [
	^ self builder digits
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrete_with_range1: nodes [
	^ self builder discreteRangeName: (nodes at: 1) constraintOpt: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrim_part1: nodes [
	^ self builder discrimSpecs: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrim_part_opt1: nodes [
	^ self builder noDiscrimPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrim_part_opt2: nodes [
	^ self builder discrimPart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrim_part_opt3: nodes [
	^ self builder genericDiscriminant
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFordiscrim_spec1: nodes [
	^ self builder
		discrimSpecIdentifiers: (nodes at: 1)
		accessOpt: (nodes at: 3)
		mark: (nodes at: 4)
		initOpt: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForelse_opt1: nodes [
	^ self builder noElse
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_body1: nodes [
	^ self builder
		entryBodyName: (nodes at: 2) value
		iteration: self builder noIteration
		formalPart: (nodes at: 3) contents
		when: (nodes at: 5)
		body: (nodes at: 6)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_body2: nodes [
	^ self builder
		entryBodyName: (nodes at: 2) value
		iteration: (nodes at: 3)
		formalPart: (nodes at: 4) contents
		when: (nodes at: 6)
		body: (nodes at: 7)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_body_part1: nodes [
	^ self builder noEntryBody
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_body_part2: nodes [
	^ self builder entryBodyDeclPart: (nodes at: 2) blockBody: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_call1: nodes [
	^ self builder entryCall: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_decl1: nodes [
	^ self builder
		entryDecl: (nodes at: 2) value
		discreteRange: self builder noDiscreteRange
		formalPart: (nodes at: 3) contents
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_decl2: nodes [
	^ self builder entryDecl: (nodes at: 2) value discreteRange: (nodes at: 4) formalPart: (nodes at: 6) contents
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_iter_part1: nodes [
	^ self builder entryIterationPartName: (nodes at: 2) range: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_name1: nodes [
	^ self builder entryName: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForentry_name2: nodes [
	^ self builder entryName: (nodes at: 1) argument: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForenum_id1: nodes [
	^ self builder stringEnumerationId: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForenum_id2: nodes [
	^ self builder characterEnumerationId: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForenumeration_type1: nodes [
	^ self builder enumerationTypeElements: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexcept_choice1: nodes [
	^ self builder namedExceptionChoice: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexcept_choice2: nodes [
	^ self builder othersExceptionChoice
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexcept_handler_part1: nodes [
	^ OrderedCollection with: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexcept_handler_part_opt1: nodes [
	^ self builder noHandler
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexcept_handler_part_opt2: nodes [
	^ self builder exceptionHandler: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexception_decl1: nodes [
	^ self builder exceptionNames: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexception_handler1: nodes [
	^ self builder exceptionHandler: self builder noIdentifier choices: (nodes at: 2) statements: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexception_handler2: nodes [
	^ self builder exceptionHandler: (nodes at: 2) value choices: (nodes at: 4) statements: (nodes at: 6)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexception_rename_decl1: nodes [
	^ self builder exceptionNames: (nodes at: 1) renames: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexit_stmt1: nodes [
	^ self builder exit: (nodes at: 2) whenOpt: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexpression2: nodes [
	^ self builder expression: (nodes at: 1) logical: (nodes at: 2) relation: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForexpression3: nodes [
	^ self builder expression: (nodes at: 1) shortCircuit: (nodes at: 2) relation: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfactor2: nodes [
	^ self builder not: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfactor3: nodes [
	^ self builder abs: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfactor4: nodes [
	^ self builder primary: (nodes at: 1) expon: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfixed_type1: nodes [
	^ self builder deltaExpression: (nodes at: 2) rangeSpecOpt: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfixed_type2: nodes [
	^ self builder deltaExpression: (nodes at: 2) digits: (nodes at: 4) rangeSpecOpt: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForfloat_type1: nodes [
	^ self builder digitsExpression: (nodes at: 2) rangeSpecOpt: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForformal_part1: nodes [
	^ self withStartToken: (nodes at: 1) endToken: (nodes at: 3) return: (self builder stubEntity: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForformal_part_opt1: nodes [
	^ self builder stubEntity: self builder noFormalPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_decl1: nodes [
	^ self builder genericFormalPart: (nodes at: 1) subProcSpec: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_decl2: nodes [
	^ self builder genericFormalPart: (nodes at: 1) packageSpec: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal1: nodes [
	^ self builder genericFormalParameter: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal2: nodes [
	^ self builder
		genericType:
			(self builder typeIdentifier: (nodes at: 2) value discrimPartOpt: (nodes at: 3) completion: (nodes at: 5))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal3: nodes [
	^ self builder
		genericProcedure:
			(self builder procedureSpecName: (self builder compoundName: (nodes at: 3) value) formalPartOpt: (nodes at: 4) contents)
		default: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal4: nodes [
	^ self builder
		genericFunction:
			(self builder functionSpecName: (nodes at: 3) formalPartOpt: (nodes at: 4) contents return: (nodes at: 6))
		default: (nodes at: 7)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal5: nodes [
	^ self builder genericPackage: (nodes at: 3) value isNew: (nodes at: 6) arg: self builder box
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal6: nodes [
	^ self builder genericPackage: (nodes at: 3) value isNew: (nodes at: 6) arg: self builder noBox
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_formal7: nodes [
	^ self builder genericUseClause: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_pkg_inst1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 4)
		return: (self builder genericPackageInstanciation: (nodes at: 2) isNew: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_subp_inst1: nodes [
	^ self builder subProgSpec: (nodes at: 1) isNew: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def1: nodes [
	^ self builder parenthesized: self builder anyType
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def2: nodes [
	^ self builder anyType
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def3: nodes [
	^ self builder anyRangeType
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def4: nodes [
	^ self builder integerTypeModSpec: self builder anyExpression
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def5: nodes [
	^ self builder deltaExpression: self builder anyExpression rangeSpecOpt: self builder noRangeSpec
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def6: nodes [
	^ self builder
		deltaExpression: self builder anyExpression
		digits: self builder anyExpression
		rangeSpecOpt: self builder noRangeSpec
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgeneric_type_def7: nodes [
	^ self builder digitsExpression: self builder anyExpression rangeSpecOpt: self builder noRangeSpec
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForgoto_stmt1: nodes [
	^ self builder goto: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForguarded_select_alt2: nodes [
	^ self builder when: (nodes at: 2) select: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForhandled_stmt_s1: nodes [
	^ self builder statements: (nodes at: 1) handlerPartOpt: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForid_opt1: nodes [
	^ self builder noId
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForidentifier_attribute1: nodes [
	^ self builder identifierAttribute: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForif_stmt1: nodes [
	^ self builder if: (nodes at: 2) else: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForindex1: nodes [
	^ self builder index: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForindexed_comp1: nodes [
	^ self builder name: (nodes at: 1) indexes: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForinit_opt1: nodes [
	^ self builder noInit
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForinteger_type1: nodes [
	^ self builder integerTypeRangeSpec: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForinteger_type2: nodes [
	^ self builder integerTypeModSpec: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForiter_part1: nodes [
	^ (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForiteration1: nodes [
	^ self builder noIteration
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForiteration2: nodes [
	^ self builder while: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForiteration3: nodes [
	^ self builder for: (nodes at: 1) reverseOpt: (nodes at: 2) in: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlabel1: nodes [
	^ self builder label: (nodes at: 2) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlabel_1: nodes [
	^ OrderedCollection with: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlabel_2: nodes [
	^ (nodes at: 1)
		add: (nodes at: 2);
		yourself
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlabel_opt1: nodes [
	^ self builder noLabel
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlabel_opt2: nodes [
	^ self builder label: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlex_string1: nodes [
	^ (nodes at: 1) value copyFrom: 2 to: (nodes at: 1) value size - 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlimited_opt1: nodes [
	^ self builder unlimited
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForlimited_opt2: nodes [
	^ self builder limited
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForliteralEntry3: nodes [
	^ self builder parserResult: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForloop_stmt1: nodes [
	^ self builder labelOpt: (nodes at: 1) iteration: (nodes at: 2) basicLoop: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormembership1: nodes [
	^ self builder in
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormembership2: nodes [
	^ self builder notIn
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormode1: nodes [
	^ self builder noMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormode2: nodes [
	^ self builder inMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormode3: nodes [
	^ self builder outMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormode4: nodes [
	^ self builder inOutMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormode5: nodes [
	^ self builder accessMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormultiplying1: nodes [
	^ self builder mult
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormultiplying2: nodes [
	^ self builder div
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormultiplying3: nodes [
	^ self builder mod
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFormultiplying4: nodes [
	^ self builder rem
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForname1: nodes [
	^ self builder identifier: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForname5: nodes [
	^ self builder stringAsName: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForname_opt1: nodes [
	^ self builder noName
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFornull_lit1: nodes [
	^ self builder nullLiteral: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFornull_stmt1: nodes [
	^ self builder nullStatement
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFornumber_decl1: nodes [
	^ self builder numberDeclarationIdentifiers: (nodes at: 1) init: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_access_type1: nodes [
	^ self builder accessToObject: (nodes at: 2) accessMode: self builder constantAccessMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_access_type2: nodes [
	^ self builder accessToObject: (nodes at: 2) accessMode: self builder allAccessMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_access_type3: nodes [
	^ self builder accessToObject: (nodes at: 1) accessMode: self builder noAccessMode
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_decl1: nodes [
	^ self builder
		objectNames: (nodes at: 1)
		optQualifier: (nodes at: 3)
		subTypeDef: (nodes at: 4)
		optInit: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_qualifier_opt1: nodes [
	^ self builder noQualifier
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_qualifier_opt2: nodes [
	^ self builder aliasedQualifier
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_qualifier_opt3: nodes [
	^ self builder constantQualifier
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_qualifier_opt4: nodes [
	^ self builder aliasedConstantQualifier
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForobject_rename_decl1: nodes [
	^ self builder
		objectNames: (nodes at: 1)
		optQualifier: (nodes at: 3)
		subTypeDef: (nodes at: 4)
		renames: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForor1: nodes [
	^ self builder or
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForparam1: nodes [
	^ self builder
		paramIdentifiers: (nodes at: 1)
		mode: (nodes at: 3)
		domainName: (nodes at: 4)
		init: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForparenthesized_primary2: nodes [
	^ self builder parenthesized: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForparser_result1: nodes [
	^ self builder parserResult: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpkg_body1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 9)
		return: (self builder packageBody: (nodes at: 3) declPart: (nodes at: 5) bodyOpt: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpkg_decl1: nodes [
	^ self withStartToken: (nodes at: 1) endToken: (nodes at: 2) return: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpkg_def1: nodes [
	^ self builder packagePublicPart: (nodes at: 2) privatePart: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpkg_part1: nodes [
	^ self builder packagePart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpkg_spec1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 3)
		return: (self builder package: (nodes at: 2) is: (nodes at: 3))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpragma1: nodes [
	^ self builder pragma: (nodes at: 2) value arguments: self builder noArgument
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpragma2: nodes [
	^ self builder pragma: (nodes at: 2) value arguments: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpragma_arg1: nodes [
	^ self builder pragmaArgument: (nodes at: 1) named: self builder noName
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForpragma_arg2: nodes [
	^ self builder pragmaArgument: (nodes at: 3) named: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprivate_opt1: nodes [
	^ self builder noPrivate
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprivate_opt2: nodes [
	^ self builder private
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprivate_type1: nodes [
	^ self builder privateTypeTaggedOpt: (nodes at: 1) limitedOpt: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprocedure_call1: nodes [
	^ self withStartToken: (nodes at: 1) endToken: (nodes at: 2) return: (self builder procedureCall: (nodes at: 1))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_body1: nodes [
	^ self builder protectedBody: (nodes at: 3) value elements: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_def1: nodes [
	^ self builder protectedPublicPart: (nodes at: 2) privatePart: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_op_decl_s1: nodes [
	^ self builder protectedElements: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_private_opt1: nodes [
	^ self builder noPrivatePart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_private_opt2: nodes [
	^ self builder privateProtectedPart: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_public_part1: nodes [
	^ self builder publicProtectedPart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_spec1: nodes [
	^ self builder protected: (nodes at: 2) value is: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForprot_spec2: nodes [
	^ self builder protectedType: (nodes at: 3) value discrimPart: (nodes at: 4) is: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForqualified1: nodes [
	^ self builder name: (nodes at: 1) primary: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForqualified_name1: nodes [
	^ self withStartToken: (nodes at: 1) endToken: (nodes at: 1) return: (self builder qualifiedName: (nodes at: 1))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForqualified_name2: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 3)
		return: (self builder name: (nodes at: 1) attribute: (nodes at: 3))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForqualified_name3: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 3)
		return: (self builder selected: (nodes at: 1) selector: (self builder simpleNameSelector: (nodes at: 3) value))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForraise_stmt1: nodes [
	^ self builder raise: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange1: nodes [
	^ self builder rangeFrom: (nodes at: 1) to: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange2: nodes [
	^ self builder rangeNamed: (nodes at: 1) argument: nil
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange3: nodes [
	^ self builder rangeNamed: (nodes at: 1) argument: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange_constraint1: nodes [
	^ self builder rangeConstraintRange: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange_constraint_opt1: nodes [
	^ self builder noRangeConstraint
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange_spec_opt1: nodes [
	^ self builder noRangeSpec
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrange_spec_opt2: nodes [
	^ self builder rangeSpec: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrecord_def1: nodes [
	^ self builder recordComponents: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrecord_def2: nodes [
	^ self builder nullRecord
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrecord_type1: nodes [
	^ self builder recordTypeTaggedOpt: (nodes at: 1) limitedOpt: (nodes at: 2) recordDef: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrecord_type_spec1: nodes [
	^ self builder recordTypeSpecFor: (nodes at: 2) useRecordAlign: (nodes at: 5) compLocs: (nodes at: 6)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelation1: nodes [
	^ self builder simpleExpression: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelation2: nodes [
	^ self builder expression: (nodes at: 1) relational: (nodes at: 2) expression: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelation4: nodes [
	^ self builder expression: (nodes at: 1) memberShip: (nodes at: 2) expression: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational1: nodes [
	^ self builder equal
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational2: nodes [
	^ self builder nonEqual
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational3: nodes [
	^ self builder lessThan
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational4: nodes [
	^ self builder lessThanOrEqual
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational5: nodes [
	^ self builder greaterThan
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrelational6: nodes [
	^ self builder greaterThanOrEqual
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrename_unit1: nodes [
	^ self builder packageName: (nodes at: 2) renames: (nodes at: 3) genericFormalPart: self builder noGenericFormalPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrename_unit2: nodes [
	^ self builder subProgSpec: (nodes at: 1) renames: (nodes at: 2) genericFormalPart: self builder noGenericFormalPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrename_unit3: nodes [
	^ self builder packageName: (nodes at: 3) renames: (nodes at: 4) genericFormalPart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrename_unit4: nodes [
	^ self builder subProgSpec: (nodes at: 2) renames: (nodes at: 3) genericFormalPart: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrequeue_stmt1: nodes [
	^ self builder requeue: (nodes at: 2) withAbort: false
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForrequeue_stmt2: nodes [
	^ self builder requeue: (nodes at: 2) withAbort: true
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForreturn_stmt1: nodes [
	^ self builder return
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForreturn_stmt2: nodes [
	^ self builder return: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForreverse_opt1: nodes [
	^ self builder noReverse
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForreverse_opt2: nodes [
	^ self builder reverse
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselect_alt1: nodes [
	^ self builder acceptAlternative: (nodes at: 1) statements: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselect_alt2: nodes [
	^ self builder delayAlternative: (nodes at: 1) statements: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselect_alt3: nodes [
	^ self builder terminateAlternative
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselect_wait1: nodes [
	^ self builder select: (nodes at: 2) or: (nodes at: 3) else: (nodes at: 4)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselected_comp1: nodes [
	^ self builder selected: (nodes at: 1) selector: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselector1: nodes [
	^ self builder simpleNameSelector: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselector2: nodes [
	^ self builder charSelector: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselector3: nodes [
	^ self builder stringSelector: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForselector4: nodes [
	^ self builder allSelector
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForshort_circuit1: nodes [
	^ self builder andThen
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForshort_circuit2: nodes [
	^ self builder orElse
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsimple_expression1: nodes [
	^ self builder unary: (nodes at: 1) term: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsimple_expression2: nodes [
	^ self builder term: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsimple_expression3: nodes [
	^ self builder expression: (nodes at: 1) adding: (nodes at: 2) term: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsimple_identifier1: nodes [
	^ self builder simpleIdentifier: (nodes at: 1) value
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsource_unit1: nodes [
	^ self builder unit: (nodes at: 3) private: (nodes at: 2) interfaces: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsource_unit2: nodes [
	^ self builder unit: (nodes at: 2) private: (nodes at: 1) interfaces: self builder noInterface
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsource_unit_s1: nodes [
	^ OrderedCollection new
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsource_unit_s2: nodes [
	(nodes at: 1) add: (nodes at: 2).
	^ nodes at: 1
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForstatement2: nodes [
	^ self builder labels: (nodes at: 1) statement: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForstatement_s1: nodes [
	^ self builder statements: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForstmts_opt1: nodes [
	^ self builder noStatement
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForstring1: nodes [
	^ self builder stringLiteral: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubp_default1: nodes [
	^ self builder noGenericSubprogramDefault
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubp_default2: nodes [
	^ self builder genericSubprogramDefault: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubp_default3: nodes [
	^ self builder genericSubprogramDefault: self builder anyExpression
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_access_type1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return:
			(self builder
				accessToSubprogram: (nodes at: 2) contents
				accessMode: self builder noAccessMode
				return: self builder noReturn)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_access_type2: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return:
			(self builder
				accessToSubprogram: (nodes at: 3) contents
				accessMode: self builder protectedAccessMode
				return: self builder noReturn)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_access_type3: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return:
			(self builder accessToSubprogram: (nodes at: 2) contents accessMode: self builder noAccessMode return: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_access_type4: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return:
			(self builder
				accessToSubprogram: (nodes at: 3) contents
				accessMode: self builder protectedAccessMode
				return: (nodes at: 5))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_body1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 6)
		return: (self builder subProgBodySpec: (nodes at: 1) declPart: (nodes at: 2) body: (nodes at: 3))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_decl1: nodes [
	^ self withEndToken: (nodes at: 2) return: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_decl3: nodes [
	^ self withEndToken: (nodes at: 2) return: (self builder abstractSubprogram: (nodes at: 1))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_spec1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return: (self builder procedureSpecName: (nodes at: 2) formalPartOpt: (nodes at: 3) contents)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_spec2: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return: (self builder functionSpecName: (nodes at: 2) formalPartOpt: (nodes at: 3) contents return: (nodes at: 5))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubprog_spec3: nodes [
	^ self withStartToken: (nodes at: 1) return: (self builder functionSpecName: (nodes at: 2))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubtype_decl1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 5)
		return: (self builder subtypeIdentifier: (nodes at: 2) value subTypeInd: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubtype_ind1: nodes [
	^ self builder name: (nodes at: 1) constraint: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubtype_ind2: nodes [
	^ self builder name: (nodes at: 1) constraint: self builder noConstraint
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForsubunit1: nodes [
	^ self builder separate: (nodes at: 3) body: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortagged_opt1: nodes [
	^ self builder notTagged
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortagged_opt2: nodes [
	^ self builder tagged
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortagged_opt3: nodes [
	^ self builder taggedAbstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_body1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 9)
		return: (self builder taskBody: (nodes at: 3) value declPart: (nodes at: 5) body: (nodes at: 6))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_def1: nodes [
	^ self builder noTaskDef
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_def2: nodes [
	^ self builder taskPublicPart: (nodes at: 2) privatePart: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_part1: nodes [
	^ self builder taskEntries: (nodes at: 1) representations: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_private_opt1: nodes [
	^ self builder noTaskPrivate
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_spec1: nodes [
	^ self withStartToken: (nodes at: 1) return: (self builder task: (nodes at: 2) value is: (nodes at: 3))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortask_spec2: nodes [
	^ self
		withStartToken: (nodes at: 1)
		return: (self builder taskType: (nodes at: 3) value discrimPart: (nodes at: 4) is: (nodes at: 5))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForterm2: nodes [
	^ self builder term: (nodes at: 1) multiply: (nodes at: 2) factor: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortimed_entry_call1: nodes [
	^ self builder
		timedEntryCall: (nodes at: 2)
		statements: (nodes at: 3)
		orDelay: (nodes at: 5)
		statements: (nodes at: 6)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortype_completion1: nodes [
	^ self builder noTypeCompletion
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionFortype_decl1: nodes [
	^ self
		withStartToken: (nodes at: 1)
		endToken: (nodes at: 5)
		return: (self builder typeIdentifier: (nodes at: 2) value discrimPartOpt: (nodes at: 3) completion: (nodes at: 4))
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForunary1: nodes [
	^ self builder unaryPlus
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForunary2: nodes [
	^ self builder unarySubstract
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForunconstr_array_type1: nodes [
	^ self builder arrayTypeIndexes: (nodes at: 3) of: (nodes at: 6)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForunlabeled1: nodes [
	^ self builder simpleStatement: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForunlabeled2: nodes [
	^ self builder compoundStatement: (nodes at: 1)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForuse_clause1: nodes [
	^ self builder useClauseNames: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForuse_clause2: nodes [
	^ self builder useTypesClauseNames: (nodes at: 3)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForvariant1: nodes [
	^ self builder variantPartElementWhen: (nodes at: 2) componentList: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForvariant_part1: nodes [
	^ self builder variantPartCase: (nodes at: 2) elements: (nodes at: 5)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForvariant_part_opt1: nodes [
	^ self builder noVariantPart
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForwhen_opt1: nodes [
	^ self builder noCondition
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForwith_clause1: nodes [
	^ self builder withClauseNames: (nodes at: 2)
]

{ #category : #'generated-reduction actions' }
Ada95Parser >> reduceActionForxor1: nodes [
	^ self builder xor
]

{ #category : #generated }
Ada95Parser >> reduceTable [
^#(
	#(108 0 #reduceActionForsource_unit_s1:) 
	#(207 0 #reduceActionFortagged_opt1:) 
	#(342 0 #reduceActionForlabel_opt1:) 
	#(129 1 #reduceActionForPRAGMA1:) 
	#(115 0 #reduceActionForprivate_opt1:) 
	#(109 1 #reduceActionForparser_result1:) 
	#(134 0 #reduceActionForsource_unit_s1:) 
	#(182 1 #reduceActionForPRAGMA1:) 
	#(222 1 #reduceActionForPRAGMA1:) 
	#(198 1 #reduceActionForPRAGMA1:) 
	#(176 1 #reduceActionForPRAGMA1:) 
	#(195 1 #reduceActionForPRAGMA1:) 
	#(183 1 #reduceActionForPRAGMA1:) 
	#(213 1 #reduceActionForPRAGMA1:) 
	#(178 1 #reduceActionForPRAGMA1:) 
	#(191 1 #reduceActionForPRAGMA1:) 
	#(458 1 #reduceActionForparser_result1:) 
	#(117 1 #reduceActionForPRAGMA1:) 
	#(190 1 #reduceActionForPRAGMA1:) 
	#(166 1 #reduceActionForinteger_type1:) 
	#(167 1 #reduceActionForPRAGMA1:) 
	#(155 1 #reduceActionForPRAGMA1:) 
	#(208 0 #reduceActionForlimited_opt1:) 
	#(207 1 #reduceActionFortagged_opt2:) 
	#(212 1 #reduceActionForPRAGMA1:) 
	#(189 1 #reduceActionForchar1:) 
	#(258 1 #reduceActionForlex_string1:) 
	#(459 1 #reduceActionFordecimal_lit1:) 
	#(460 1 #reduceActionForbased_lit1:) 
	#(120 1 #reduceActionForPRAGMA1:) 
	#(259 1 #reduceActionForparser_result1:) 
	#(259 1 #reduceActionForliteralEntry3:) 
	#(269 1 #reduceActionForcharacter_lit1:) 
	#(270 1 #reduceActionFornull_lit1:) 
	#(119 1 #reduceActionForstring1:) 
	#(118 1 #reduceActionForPRAGMA1:) 
	#(271 1 #reduceActionForPRAGMA1:) 
	#(121 1 #reduceActionForname5:) 
	#(121 1 #reduceActionForname1:) 
	#(231 1 #reduceActionForparser_result1:) 
	#(121 1 #reduceActionForPRAGMA1:) 
	#(300 1 #reduceActionForPRAGMA1:) 
	#(293 1 #reduceActionForunary2:) 
	#(293 1 #reduceActionForunary1:) 
	#(292 1 #reduceActionForPRAGMA1:) 
	#(299 1 #reduceActionForPRAGMA1:) 
	#(457 1 #reduceActionForparser_result1:) 
	#(304 1 #reduceActionForPRAGMA1:) 
	#(184 1 #reduceActionForsimple_expression2:) 
	#(294 1 #reduceActionForPRAGMA1:) 
	#(296 1 #reduceActionForPRAGMA1:) 
	#(101 1 #reduceActionForparser_result1:) 
	#(275 1 #reduceActionForrelation1:) 
	#(122 1 #reduceActionForPRAGMA1:) 
	#(433 1 #reduceActionForPRAGMA1:) 
	#(417 1 #reduceActionForPRAGMA1:) 
	#(224 1 #reduceActionForPRAGMA1:) 
	#(420 1 #reduceActionForPRAGMA1:) 
	#(329 1 #reduceActionForPRAGMA1:) 
	#(445 1 #reduceActionForPRAGMA1:) 
	#(240 1 #reduceActionForPRAGMA1:) 
	#(426 1 #reduceActionForPRAGMA1:) 
	#(444 1 #reduceActionForPRAGMA1:) 
	#(363 1 #reduceActionForPRAGMA1:) 
	#(360 1 #reduceActionForPRAGMA1:) 
	#(331 1 #reduceActionForPRAGMA1:) 
	#(307 1 #reduceActionForPRAGMA1:) 
	#(102 1 #reduceActionForparser_result1:) 
	#(123 1 #reduceActionForPRAGMA1:) 
	#(309 1 #reduceActionForlabel_1:) 
	#(307 1 #reduceActionForunlabeled1:) 
	#(307 1 #reduceActionForunlabeled2:) 
	#(310 1 #reduceActionForPRAGMA1:) 
	#(311 1 #reduceActionForPRAGMA1:) 
	#(353 0 #reduceActionForblock_decl1:) 
	#(343 0 #reduceActionForiteration1:) 
	#(361 0 #reduceActionForname_opt1:) 
	#(328 1 #reduceActionForPRAGMA1:) 
	#(163 1 #reduceActionForPRAGMA1:) 
	#(103 1 #reduceActionForparser_result1:) 
	#(125 1 #reduceActionForPRAGMA1:) 
	#(125 1 #reduceActionForgeneric_type_def1:) 
	#(125 1 #reduceActionForgeneric_type_def2:) 
	#(162 1 #reduceActionForbox1:) 
	#(179 1 #reduceActionForPRAGMA1:) 
	#(104 1 #reduceActionForparser_result1:) 
	#(114 1 #reduceActionForlabel_1:) 
	#(437 0 #reduceActionForsource_unit_s1:) 
	#(236 1 #reduceActionForPRAGMA1:) 
	#(239 1 #reduceActionForPRAGMA1:) 
	#(238 1 #reduceActionForPRAGMA1:) 
	#(172 1 #reduceActionForPRAGMA1:) 
	#(157 1 #reduceActionForPRAGMA1:) 
	#(393 1 #reduceActionForPRAGMA1:) 
	#(446 1 #reduceActionForPRAGMA1:) 
	#(374 1 #reduceActionForPRAGMA1:) 
	#(151 1 #reduceActionFordef_id1:) 
	#(105 1 #reduceActionForparser_result1:) 
	#(126 1 #reduceActionForPRAGMA1:) 
	#(147 1 #reduceActionForlabel_1:) 
	#(144 1 #reduceActionForPRAGMA1:) 
	#(390 1 #reduceActionForsource_unit_s1:) 
	#(439 1 #reduceActionForPRAGMA1:) 
	#(106 1 #reduceActionForparser_result1:) 
	#(116 1 #reduceActionForPRAGMA1:) 
	#(244 0 #reduceActionFordecl_part1:) 
	#(107 1 #reduceActionForparser_result1:) 
	#(127 1 #reduceActionForPRAGMA1:) 
	#(180 1 #reduceActionForPRAGMA1:) 
	#(108 2 #reduceActionForsource_unit_s2:) 
	#(115 1 #reduceActionForprivate_opt2:) 
	#(108 2 #reduceActionForsource_unit_s1:) 
	#(113 1 #reduceFor:) 
	#(130 1 #reduceActionForPRAGMA1:) 
	#(188 1 #reduceActionForenum_id1:) 
	#(187 1 #reduceActionForlabel_1:) 
	#(188 1 #reduceActionForenum_id2:) 
	#(192 0 #reduceActionForrange_spec_opt1:) 
	#(154 1 #reduceActionForsubtype_ind2:) 
	#(170 2 #reduceActionForderived_type1:) 
	#(207 2 #reduceActionFortagged_opt3:) 
	#(174 2 #reduceActionForrange_constraint1:) 
	#(166 2 #reduceActionForinteger_type2:) 
	#(382 1 #reduceActionForPRAGMA1:) 
	#(208 1 #reduceActionForlimited_opt2:) 
	#(153 1 #reduceActionForPRAGMA1:) 
	#(241 1 #reduceActionForPRAGMA1:) 
	#(235 1 #reduceActionForobject_access_type3:) 
	#(169 2 #liftSecondValue:) 
	#(233 1 #reduceActionForPRAGMA1:) 
	#(237 0 #reduceActionForformal_part_opt1:) 
	#(186 1 #reduceActionForPRAGMA1:) 
	#(232 1 #reduceActionForPRAGMA1:) 
	#(230 1 #reduceActionForchoice1:) 
	#(274 1 #reduceActionForPRAGMA1:) 
	#(462 1 #reduceActionForPRAGMA1:) 
	#(229 1 #reduceActionForlabel_1:) 
	#(230 1 #reduceActionForchoice3:) 
	#(230 1 #reduceActionForchoice2:) 
	#(302 2 #reduceActionForallocator1:) 
	#(185 1 #reduceActionForPRAGMA1:) 
	#(295 1 #reduceActionForadding2:) 
	#(295 1 #reduceActionForadding3:) 
	#(295 1 #reduceActionForadding1:) 
	#(296 2 #reduceActionForfactor2:) 
	#(184 2 #reduceActionForsimple_expression1:) 
	#(297 1 #reduceActionFormultiplying1:) 
	#(297 1 #reduceActionFormultiplying2:) 
	#(298 1 #reduceActionForPRAGMA1:) 
	#(297 1 #reduceActionFormultiplying3:) 
	#(297 1 #reduceActionFormultiplying4:) 
	#(301 1 #reduceActionForPRAGMA1:) 
	#(296 2 #reduceActionForfactor3:) 
	#(283 1 #reduceActionForPRAGMA1:) 
	#(281 1 #reduceActionForPRAGMA1:) 
	#(282 1 #reduceActionForPRAGMA1:) 
	#(276 1 #reduceActionForPRAGMA1:) 
	#(278 1 #reduceActionForand1:) 
	#(279 1 #reduceActionForor1:) 
	#(280 1 #reduceActionForxor1:) 
	#(290 1 #reduceActionForPRAGMA1:) 
	#(289 1 #reduceActionForPRAGMA1:) 
	#(288 1 #reduceActionForPRAGMA1:) 
	#(286 1 #reduceActionForrelational1:) 
	#(286 1 #reduceActionForrelational3:) 
	#(286 1 #reduceActionForrelational5:) 
	#(291 1 #reduceActionForPRAGMA1:) 
	#(286 1 #reduceActionForrelational2:) 
	#(286 1 #reduceActionForrelational4:) 
	#(286 1 #reduceActionForrelational6:) 
	#(287 1 #reduceActionFormembership1:) 
	#(342 2 #reduceActionForlabel_opt2:) 
	#(156 1 #reduceActionForPRAGMA1:) 
	#(128 1 #reduceActionForPRAGMA1:) 
	#(317 2 #reduceActionForprocedure_call1:) 
	#(312 2 #reduceActionFornull_stmt1:) 
	#(315 2 #reduceActionForreturn_stmt1:) 
	#(321 2 #reduceActionForcode_stmt1:) 
	#(123 2 #reduceActionForstatement2:) 
	#(309 2 #reduceActionForlabel_2:) 
	#(337 1 #reduceActionForPRAGMA1:) 
	#(333 0 #reduceActionForelse_opt1:) 
	#(332 1 #reduceActionForcond_clause_s1:) 
	#(341 0 #reduceActionForsource_unit_s1:) 
	#(355 1 #reduceActionForPRAGMA1:) 
	#(346 1 #reduceActionForPRAGMA1:) 
	#(349 1 #reduceActionForPRAGMA1:) 
	#(348 0 #reduceActionForreverse_opt1:) 
	#(361 1 #reduceActionForPRAGMA1:) 
	#(362 0 #reduceActionForwhen_opt1:) 
	#(418 1 #reduceActionForentry_name1:) 
	#(421 1 #reduceActionForPRAGMA1:) 
	#(228 1 #reduceActionForPRAGMA1:) 
	#(431 1 #reduceActionForPRAGMA1:) 
	#(430 0 #reduceActionForstmts_opt1:) 
	#(428 0 #reduceActionForsource_unit_s1:) 
	#(427 1 #reduceActionForPRAGMA1:) 
	#(384 1 #reduceActionForlabel_1:) 
	#(125 2 #reduceActionForgeneric_type_def7:) 
	#(449 2 #reduceActionForderived_type1:) 
	#(125 2 #reduceActionForgeneric_type_def3:) 
	#(125 2 #reduceActionForgeneric_type_def4:) 
	#(125 2 #reduceActionForgeneric_type_def5:) 
	#(114 2 #reduceActionForPRAGMA1:) 
	#(114 2 #reduceActionForsource_unit_s2:) 
	#(256 1 #reduceActionForcompound_name1:) 
	#(257 1 #reduceActionForlabel_1:) 
	#(434 2 #reduceActionForcontext_el1:) 
	#(436 1 #reduceFor:) 
	#(148 0 #reduceActionForobject_qualifier_opt1:) 
	#(158 0 #reduceActionFordiscrim_part_opt1:) 
	#(380 1 #reduceActionForPRAGMA1:) 
	#(352 1 #reduceActionFordesignator2:) 
	#(352 1 #reduceActionForPRAGMA1:) 
	#(364 2 #reduceActionForsubprog_spec3:) 
	#(391 1 #reduceActionForPRAGMA1:) 
	#(164 1 #reduceActionForPRAGMA1:) 
	#(139 2 #reduceActionForsubprog_decl1:) 
	#(366 2 #reduceActionForPRAGMA1:) 
	#(140 2 #reduceActionForpkg_decl1:) 
	#(383 1 #reduceActionForPRAGMA1:) 
	#(447 1 #reduceActionForgeneric_formal7:) 
	#(390 2 #reduceActionForsource_unit_s2:) 
	#(141 2 #reduceActionForsubprog_decl1:) 
	#(394 0 #reduceActionFortask_def1:) 
	#(142 2 #reduceActionForPRAGMA1:) 
	#(247 1 #reduceActionForPRAGMA1:) 
	#(242 1 #reduceActionForPRAGMA1:) 
	#(243 1 #reduceActionForlabel_1:) 
	#(244 1 #reduceActionFordecl_part2:) 
	#(246 1 #reduceActionForPRAGMA1:) 
	#(134 2 #reduceActionForlabel_2:) 
	#(112 3 #reduceActionForpragma1:) 
	#(165 3 #reduceActionForenumeration_type1:) 
	#(192 1 #reduceActionForrange_spec_opt2:) 
	#(193 3 #reduceActionForfloat_type1:) 
	#(154 2 #reduceActionForsubtype_ind1:) 
	#(173 1 #reduceActionForPRAGMA1:) 
	#(194 3 #reduceActionForfixed_type1:) 
	#(177 0 #reduceActionForrange_constraint_opt1:) 
	#(206 1 #reduceActionForPRAGMA1:) 
	#(199 1 #reduceActionForlabel_1:) 
	#(205 1 #reduceActionForlabel_1:) 
	#(200 1 #reduceActionForPRAGMA1:) 
	#(203 0 #reduceActionForaliased_opt1:) 
	#(209 1 #reduceActionForPRAGMA1:) 
	#(171 3 #reduceActionForprivate_type1:) 
	#(168 3 #reduceActionForrecord_type1:) 
	#(235 2 #reduceActionForobject_access_type1:) 
	#(234 2 #reduceActionForsubprog_access_type1:) 
	#(237 1 #reduceActionForPRAGMA1:) 
	#(235 2 #reduceActionForobject_access_type2:) 
	#(262 1 #reduceActionForPRAGMA1:) 
	#(260 1 #reduceActionForPRAGMA1:) 
	#(261 1 #reduceActionForlabel_1:) 
	#(264 1 #reduceActionForselector1:) 
	#(264 1 #reduceActionForselector2:) 
	#(264 1 #reduceActionForselector4:) 
	#(264 1 #reduceActionForselector3:) 
	#(253 3 #reduceActionForselected_comp1:) 
	#(265 1 #reduceActionForidentifier_attribute1:) 
	#(266 1 #reduceActionFordigits1:) 
	#(267 1 #reduceActionFordelta1:) 
	#(268 1 #reduceActionForaccess1:) 
	#(254 3 #reduceActionForattribute1:) 
	#(255 1 #reduceActionForPRAGMA1:) 
	#(462 2 #reduceActionFordiscrete_with_range1:) 
	#(304 3 #reduceActionForparenthesized_primary2:) 
	#(133 1 #reduceActionForPRAGMA1:) 
	#(273 3 #reduceActionForaggregate1:) 
	#(273 3 #reduceActionForaggregate2:) 
	#(124 3 #reduceActionForrange2:) 
	#(303 3 #reduceActionForqualified1:) 
	#(124 3 #reduceActionForrange1:) 
	#(184 3 #reduceActionForsimple_expression3:) 
	#(294 3 #reduceActionForterm2:) 
	#(296 3 #reduceActionForfactor4:) 
	#(122 3 #reduceActionForexpression2:) 
	#(122 3 #reduceActionForexpression3:) 
	#(284 1 #reduceActionForPRAGMA1:) 
	#(277 2 #reduceActionForshort_circuit1:) 
	#(285 1 #reduceActionForPRAGMA1:) 
	#(277 2 #reduceActionForshort_circuit2:) 
	#(275 3 #reduceActionForrelation2:) 
	#(275 3 #reduceActionForrelation4:) 
	#(287 2 #reduceActionFormembership2:) 
	#(338 3 #liftSecondValue:) 
	#(315 3 #reduceActionForreturn_stmt2:) 
	#(330 1 #reduceActionForPRAGMA1:) 
	#(308 3 #reduceActionForlabel1:) 
	#(335 1 #reduceActionForPRAGMA1:) 
	#(305 1 #reduceActionForlabel_1:) 
	#(306 1 #reduceActionForstatement_s1:) 
	#(334 2 #reduceActionForcond_clause1:) 
	#(336 2 #reduceActionForPRAGMA1:) 
	#(339 1 #reduceFor:) 
	#(351 1 #reduceActionForPRAGMA1:) 
	#(345 0 #reduceActionForid_opt1:) 
	#(343 2 #reduceActionForiteration2:) 
	#(350 1 #reduceActionForPRAGMA1:) 
	#(348 1 #reduceActionForreverse_opt2:) 
	#(356 1 #reduceActionForPRAGMA1:) 
	#(353 2 #liftSecondValue:) 
	#(316 3 #reduceActionForgoto_stmt1:) 
	#(318 3 #reduceActionFordelay_stmt1:) 
	#(416 2 #reduceActionForentry_call1:) 
	#(430 1 #reduceActionForPRAGMA1:) 
	#(432 2 #reduceActionFordelay_or_entry_alt1:) 
	#(429 2 #reduceActionForselect_alt2:) 
	#(429 2 #reduceActionForselect_alt1:) 
	#(429 2 #reduceActionForselect_alt3:) 
	#(319 3 #reduceActionForabort_stmt1:) 
	#(320 3 #reduceActionForraise_stmt1:) 
	#(322 3 #reduceActionForrequeue_stmt1:) 
	#(161 3 #liftSecondValue:) 
	#(435 3 #reduceActionForwith_clause1:) 
	#(437 2 #reduceActionForlabel_2:) 
	#(147 3 #reduceActionFordef_id_s2:) 
	#(152 1 #reduceActionForPRAGMA1:) 
	#(389 1 #reduceActionForPRAGMA1:) 
	#(148 1 #reduceActionForobject_qualifier_opt2:) 
	#(148 1 #reduceActionForobject_qualifier_opt3:) 
	#(159 0 #reduceActionFortype_completion1:) 
	#(158 1 #reduceActionFordiscrim_part_opt2:) 
	#(158 1 #reduceActionFordiscrim_part_opt3:) 
	#(364 3 #reduceActionForsubprog_spec1:) 
	#(406 0 #reduceActionForsource_unit_s1:) 
	#(399 3 #reduceActionForprot_spec1:) 
	#(365 3 #reduceActionForgeneric_subp_inst1:) 
	#(387 3 #reduceActionForrename_unit2:) 
	#(388 2 #liftSecondValue:) 
	#(139 3 #reduceActionForsubprog_decl3:) 
	#(379 0 #reduceActionForsource_unit_s1:) 
	#(372 3 #reduceActionForpkg_spec1:) 
	#(370 0 #reduceActionFormode1:) 
	#(145 3 #reduceActionForgeneric_decl1:) 
	#(447 2 #reduceActionForgeneric_formal1:) 
	#(145 3 #reduceActionForgeneric_decl2:) 
	#(392 3 #reduceActionFortask_spec1:) 
	#(243 2 #reduceActionForlabel_2:) 
	#(221 1 #reduceActionForqualified_name1:) 
	#(111 3 #reduceActionForsource_unit2:) 
	#(132 1 #reduceActionForpragma_arg1:) 
	#(131 1 #reduceActionForlabel_1:) 
	#(187 3 #reduceActionFordef_id_s2:) 
	#(170 4 #reduceActionForderived_type2:) 
	#(170 4 #reduceActionForderived_type3:) 
	#(177 1 #reduceActionForPRAGMA1:) 
	#(206 2 #reduceActionFordiscrete_with_range1:) 
	#(202 3 #liftSecondValue:) 
	#(203 1 #reduceActionForaliased_opt2:) 
	#(197 4 #reduceActionForconstr_array_type1:) 
	#(181 2 #reduceActionForrecord_def2:) 
	#(368 1 #reduceActionForlabel_1:) 
	#(234 3 #reduceActionForsubprog_access_type2:) 
	#(252 4 #reduceActionForindexed_comp1:) 
	#(273 4 #reduceActionForaggregate5:) 
	#(229 3 #reduceActionFordef_id_s2:) 
	#(263 3 #reduceActionForcomp_assoc1:) 
	#(272 3 #reduceActionFordef_id_s2:) 
	#(272 3 #reduceActionForaggregate_element_s1:) 
	#(313 4 #reduceActionForassign_stmt1:) 
	#(333 2 #liftSecondValue:) 
	#(211 1 #reduceActionForPRAGMA1:) 
	#(332 3 #reduceActionForcond_clause_s2:) 
	#(305 2 #reduceActionForsource_unit_s2:) 
	#(341 2 #reduceActionForlabel_2:) 
	#(345 1 #reduceActionForPRAGMA1:) 
	#(343 3 #reduceActionForiteration3:) 
	#(347 3 #reduceActionForiter_part1:) 
	#(358 0 #reduceActionForexcept_handler_part_opt1:) 
	#(354 2 #reduceActionForblock_body1:) 
	#(362 2 #liftSecondValue:) 
	#(314 4 #reduceActionForexit_stmt1:) 
	#(419 1 #reduceActionForPRAGMA1:) 
	#(327 4 #reduceActionForaccept_stmt1:) 
	#(318 4 #reduceActionFordelay_stmt2:) 
	#(384 3 #reduceActionFordef_id_s2:) 
	#(449 4 #reduceActionForderived_type2:) 
	#(125 4 #reduceActionForgeneric_type_def6:) 
	#(256 3 #reduceActionForcompound_name2:) 
	#(257 3 #reduceActionFordef_id_s2:) 
	#(150 0 #reduceActionForinit_opt1:) 
	#(149 1 #reduceActionForPRAGMA1:) 
	#(148 2 #reduceActionForobject_qualifier_opt4:) 
	#(143 4 #reduceActionForexception_decl1:) 
	#(218 1 #reduceActionForlabel_1:) 
	#(402 0 #reduceActionForprot_private_opt1:) 
	#(401 1 #reduceActionForprot_public_part1:) 
	#(403 1 #reduceActionForprot_op_decl_s1:) 
	#(450 2 #liftSecondValue:) 
	#(146 4 #reduceActionForbody_stub3:) 
	#(377 0 #reduceActionForprot_private_opt1:) 
	#(376 1 #reduceActionForpkg_part1:) 
	#(373 4 #reduceActionForgeneric_pkg_inst1:) 
	#(387 4 #reduceActionForrename_unit1:) 
	#(371 1 #reduceActionForPRAGMA1:) 
	#(370 1 #reduceActionFormode5:) 
	#(370 1 #reduceActionFormode2:) 
	#(370 1 #reduceActionFormode3:) 
	#(387 4 #reduceActionForrename_unit4:) 
	#(245 3 #reduceActionForuse_clause1:) 
	#(397 1 #reduceActionForsource_unit_s1:) 
	#(396 0 #reduceActionFortask_private_opt1:) 
	#(398 0 #reduceActionForsource_unit_s1:) 
	#(111 4 #reduceActionForsource_unit1:) 
	#(175 3 #reduceActionFordecimal_digits_constraint1:) 
	#(170 5 #reduceActionForderived_type4:) 
	#(170 5 #reduceActionForderived_type5:) 
	#(194 5 #reduceActionForfixed_type2:) 
	#(204 3 #reduceActionForindex1:) 
	#(199 3 #reduceActionFordef_id_s2:) 
	#(205 3 #reduceActionFordef_id_s2:) 
	#(201 2 #reduceActionForcomponent_subtype_def1:) 
	#(214 1 #reduceActionForlabel_1:) 
	#(367 3 #reduceActionForformal_part1:) 
	#(234 4 #reduceActionForsubprog_access_type3:) 
	#(261 3 #reduceActionFordef_id_s2:) 
	#(273 5 #reduceActionForaggregate3:) 
	#(325 5 #reduceActionForloop_stmt1:) 
	#(357 2 #reduceActionForhandled_stmt_s1:) 
	#(358 1 #reduceActionForexcept_handler_part_opt2:) 
	#(418 4 #reduceActionForentry_name2:) 
	#(427 4 #reduceActionForguarded_select_alt2:) 
	#(428 3 #reduceActionFordef_id_s2:) 
	#(322 5 #reduceActionForrequeue_stmt2:) 
	#(449 5 #reduceActionForderived_type4:) 
	#(386 5 #reduceActionForexception_rename_decl1:) 
	#(220 0 #reduceActionForaccess_opt1:) 
	#(160 3 #reduceActionFordiscrim_part1:) 
	#(137 5 #reduceActionFortype_decl1:) 
	#(159 2 #liftSecondValue:) 
	#(138 5 #reduceActionForsubtype_decl1:) 
	#(409 0 #reduceActionForsource_unit_s1:) 
	#(413 1 #reduceActionForPRAGMA1:) 
	#(405 1 #reduceActionForPRAGMA1:) 
	#(406 2 #reduceActionForlabel_2:) 
	#(399 5 #reduceActionForprot_spec2:) 
	#(364 5 #reduceActionForsubprog_spec2:) 
	#(379 2 #reduceActionForlabel_2:) 
	#(370 2 #reduceActionFormode4:) 
	#(448 0 #reduceActionForsubp_default1:) 
	#(387 5 #reduceActionForrename_unit3:) 
	#(245 4 #reduceActionForuse_clause2:) 
	#(395 2 #reduceActionFortask_part1:) 
	#(392 5 #reduceActionFortask_spec2:) 
	#(221 3 #reduceActionForqualified_name3:) 
	#(221 3 #reduceActionForqualified_name2:) 
	#(456 1 #reduceActionForPRAGMA1:) 
	#(454 0 #reduceActionForalign_opt1:) 
	#(381 0 #reduceActionForbody_opt1:) 
	#(440 1 #reduceActionForPRAGMA1:) 
	#(438 5 #reduceActionForsubunit1:) 
	#(410 1 #reduceActionForsource_unit_s1:) 
	#(132 3 #reduceActionForpragma_arg2:) 
	#(112 6 #reduceActionForpragma2:) 
	#(131 3 #reduceActionFordef_id_s2:) 
	#(196 6 #reduceActionForunconstr_array_type1:) 
	#(215 1 #reduceActionForvariant_part_opt1:) 
	#(210 2 #reduceActionForcomp_list1:) 
	#(210 2 #reduceActionForcomp_list2:) 
	#(223 1 #reduceActionForsimple_identifier1:) 
	#(368 3 #reduceActionFordef_id_s2:) 
	#(234 5 #reduceActionForsubprog_access_type4:) 
	#(273 6 #reduceActionForaggregate4:) 
	#(124 6 #reduceActionForrange3:) 
	#(323 6 #reduceActionForif_stmt1:) 
	#(324 6 #reduceActionForcase_stmt1:) 
	#(344 4 #liftSecondValue:) 
	#(326 6 #reduceActionForblock1:) 
	#(359 2 #reduceActionForsource_unit_s2:) 
	#(359 2 #reduceActionForexcept_handler_part1:) 
	#(135 6 #reduceActionForobject_decl1:) 
	#(150 2 #liftSecondValue:) 
	#(385 6 #reduceActionForobject_rename_decl1:) 
	#(136 6 #reduceActionFornumber_decl1:) 
	#(220 1 #reduceActionForaccess1:) 
	#(218 3 #reduceActionFordef_id_s2:) 
	#(402 2 #reduceActionForprot_private_opt2:) 
	#(404 1 #reduceFor:) 
	#(405 2 #reduceActionForPRAGMA1:) 
	#(146 6 #reduceActionForbody_stub4:) 
	#(377 2 #liftSecondValue:) 
	#(378 0 #reduceActionForid_opt1:) 
	#(146 6 #reduceActionForbody_stub2:) 
	#(369 5 #reduceActionForparam1:) 
	#(396 2 #liftSecondValue:) 
	#(397 3 #reduceActionForsource_unit_s2:) 
	#(146 6 #reduceActionForbody_stub1:) 
	#(248 6 #reduceActionForsubprog_body1:) 
	#(451 5 #reduceActionForattrib_def1:) 
	#(455 0 #reduceActionForsource_unit_s1:) 
	#(381 1 #reduceActionForPRAGMA1:) 
	#(411 1 #reduceActionForPRAGMA1:) 
	#(181 5 #reduceActionForrecord_def1:) 
	#(210 3 #reduceActionForcomp_list3:) 
	#(214 3 #reduceActionFordef_id_s2:) 
	#(340 4 #reduceActionForalternative1:) 
	#(443 1 #reduceActionForexcept_choice1:) 
	#(443 1 #reduceActionForexcept_choice2:) 
	#(442 1 #reduceActionForlabel_1:) 
	#(422 7 #reduceActionForselect_wait1:) 
	#(408 1 #reduceActionForPRAGMA1:) 
	#(409 2 #reduceActionForlabel_2:) 
	#(400 5 #reduceActionForprot_def1:) 
	#(378 1 #reduceActionForPRAGMA1:) 
	#(375 5 #reduceActionForpkg_def1:) 
	#(447 6 #reduceActionForgeneric_formal2:) 
	#(448 2 #reduceActionForsubp_default2:) 
	#(448 2 #reduceActionForsubp_default3:) 
	#(447 6 #reduceActionForgeneric_formal3:) 
	#(394 5 #reduceActionFortask_def2:) 
	#(398 3 #reduceActionForsource_unit_s2:) 
	#(453 6 #reduceActionForaddress_spec1:) 
	#(411 2 #reduceActionForPRAGMA1:) 
	#(410 3 #reduceActionForsource_unit_s2:) 
	#(215 3 #liftSecondValue:) 
	#(227 0 #reduceActionForsource_unit_s1:) 
	#(327 8 #reduceActionForaccept_stmt2:) 
	#(425 8 #reduceActionForcond_entry_call1:) 
	#(423 8 #reduceActionForasync_select1:) 
	#(219 5 #reduceActionFordiscrim_spec1:) 
	#(407 4 #reduceActionForentry_decl1:) 
	#(447 7 #reduceActionForgeneric_formal6:) 
	#(251 8 #reduceActionForprot_body1:) 
	#(217 5 #reduceActionForcomp_decl1:) 
	#(225 1 #reduceFor:) 
	#(442 3 #reduceActionFordef_id_s2:) 
	#(441 4 #reduceActionForexception_handler1:) 
	#(424 9 #reduceActionFortimed_entry_call1:) 
	#(447 8 #reduceActionForgeneric_formal4:) 
	#(447 8 #reduceActionForgeneric_formal5:) 
	#(454 4 #reduceActionForalign_opt2:) 
	#(249 9 #reduceActionForpkg_body1:) 
	#(250 9 #reduceActionFortask_body1:) 
	#(227 2 #reduceActionForlabel_2:) 
	#(452 9 #reduceActionForrecord_type_spec1:) 
	#(441 6 #reduceActionForexception_handler2:) 
	#(407 7 #reduceActionForentry_decl2:) 
	#(415 4 #reduceActionForentry_iter_part1:) 
	#(414 1 #reduceActionForentry_body_part1:) 
	#(412 6 #reduceActionForentry_body1:) 
	#(216 8 #reduceActionForvariant_part1:) 
	#(412 7 #reduceActionForentry_body2:) 
	#(455 7 #reduceActionForcomp_loc_s2:) 
	#(226 5 #reduceActionForvariant1:) 
	#(414 6 #reduceActionForentry_body_part2:)
	).

]

{ #category : #generated }
Ada95Parser >> transitionTable [
^#(
#[1 0 6 0 31 0 6 0 32 0 6 0 59 0 6 0 64 0 6 0 71 0 53 0 72 0 6 0 74 0 6 0 76 0 57 0 108 0 61 0 109 0 65 0 112 0 69 0 129 0 6 1 207] 
#[1 0 73 0 4 0 77 0 12 0 81 0 21 0 85 0 25 0 89 0 47 0 93 0 48 0 97 0 57 0 10 0 58 0 101 0 67 0 10 0 71 0 10 0 90 0 10 0 93 0 105 0 94 0 109 0 95 0 113 0 117 0 117 0 155 0 121 0 165 0 125 0 166 0 129 0 167 0 133 0 168 0 137 0 169 0 141 0 170 0 145 0 171 0 149 0 174 0 153 0 176 0 157 0 178 0 161 0 182 0 165 0 183 0 169 0 190 0 173 0 191 0 177 0 193 0 181 0 194 0 185 0 195 0 189 0 196 0 193 0 197 0 197 0 198 0 201 0 207 0 205 0 213 0 209 0 222 0 213 1 202] 
#[1 0 217 0 90 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 0 241 0 118 0 245 0 119 0 249 0 120 0 253 0 189 1 1 0 212 1 5 1 2 1 9 1 3 1 13 1 13 1 17 1 14 1 21 1 15 1 25 1 203 1 29 1 204] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 1 41 0 121 1 45 0 231 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 85 0 121 1 89 0 124 1 93 0 178 1 97 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 141 1 201 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 145 0 101 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 153 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 213 0 102 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 1 229 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 0 73 0 4 0 77 0 12 0 81 0 21 2 145 0 24 2 149 0 25 0 89 0 47 0 93 0 48 0 97 0 57 0 101 0 67 0 10 0 71 0 10 0 93 0 105 0 94 0 109 0 95 2 153 0 103 2 157 0 125 2 161 0 155 2 165 0 161 2 169 0 162 2 173 0 163 2 177 0 169 2 181 0 171 2 185 0 176 2 189 0 178 2 193 0 182 2 197 0 183 2 201 0 191 2 205 0 195 0 189 0 196 0 193 0 197 0 197 0 198 2 209 0 207 0 205 0 213 0 209 0 222 2 213 1 193] 
#[1 2 217 0 64 2 221 0 104 2 225 0 114 2 229 0 179 2 233 1 178 2 237 1 179] 
#[1 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 3 1 0 65 3 5 0 68 3 9 0 74 3 13 0 76 0 237 0 100 3 17 0 105 3 21 0 120 3 25 0 126 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 3 97 0 238 3 101 0 239 3 105 1 108 3 109 1 109 3 113 1 110 3 117 1 116 3 121 1 117 3 125 1 118 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 3 149 1 137 3 153 1 143 3 157 1 190] 
#[1 2 241 0 31 2 245 0 32 3 161 0 59 3 9 0 74 3 13 0 76 3 165 0 106 3 169 0 116 3 173 0 139 3 177 0 140 3 181 0 145 3 93 0 236 3 101 0 239 3 185 0 248 3 189 0 249 3 193 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 3 201 1 118 3 205 1 131 3 141 1 134 3 209 1 182 3 213 1 183 3 157 1 190] 
#[1 2 241 0 31 2 245 0 32 2 249 0 33 3 5 0 68 3 13 0 76 3 217 0 107 3 221 0 127 3 93 0 236 3 225 0 238 3 101 0 239 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 3 245 1 108 3 249 1 110 3 253 1 118 4 1 1 137] 
#[0 0 18 0 100] 
#[1 0 22 0 31 0 22 0 32 0 22 0 59 2 217 0 64 4 5 0 71 0 22 0 74 0 22 0 76 4 9 0 111 4 13 0 114 4 17 0 115 2 229 0 179 4 21 0 180 2 233 1 178 2 237 1 179 0 26 1 207] 
#[0 0 0 1 207] 
#[1 0 30 0 31 0 30 0 32 0 30 0 59 0 30 0 64 0 30 0 71 0 30 0 72 0 30 0 74 0 30 0 76 4 25 0 113 4 29 0 134 0 30 1 207] 
#[1 0 237 0 100 4 33 0 120 4 37 0 130] 
#[0 0 34 0 30 0 67 0 94] 
#[0 0 38 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 29 0 30 0 31 0 32 0 33 0 34 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 0 97 0 100 1 207] 
#[0 0 42 0 25] 
#[1 0 221 0 96 0 237 0 100 4 41 0 120 4 45 0 187 4 49 0 188 4 53 0 189] 
#[0 0 46 0 1 0 3 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 24 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 96 0 97 0 98 0 99 0 100 1 207] 
#[0 0 50 0 1 0 3 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 24 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 90 0 91 0 92 0 94 0 95 0 96 0 97 0 98 0 99 0 100 1 207] 
#[0 0 54 0 1 0 3 0 6 0 16 0 20 0 24 0 25 0 26 0 27 0 30 0 35 0 41 0 46 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 90 0 91 0 92 0 94 0 96 0 97 0 98 0 99 0 100 1 207] 
#[0 0 58 0 58 0 71 0 90 0 93] 
#[0 0 62 0 97 0 100] 
#[0 0 66 0 3 0 24 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 70 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 74 0 30 1 207] 
#[0 0 78 0 30 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 4 57 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 4 65 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 0 101 0 67 0 105 0 94 4 69 0 178 4 73 0 213] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 85 0 121 4 77 0 124 1 93 0 178 1 97 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 0 82 0 30 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 4 81 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 0 86 0 30 1 207] 
#[0 0 86 0 30 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 4 85 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 0 90 0 6 0 30 1 207] 
#[0 0 90 0 6 0 30 1 207] 
#[1 4 89 0 25 4 93 0 202] 
#[1 0 94 0 58 0 94 0 71 0 94 0 90 4 97 0 93 4 101 0 208 4 105 1 126] 
#[0 0 98 0 58 0 71 0 90 0 93] 
#[1 4 109 0 29 2 241 0 31 2 245 0 32 2 249 0 33 4 113 0 34 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 4 117 0 153 4 121 0 154 4 125 0 233 4 129 0 234 4 133 0 235 4 137 0 236 4 141 0 238 4 145 0 239 4 149 0 241 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 0 0 1 207] 
#[0 0 102 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 58 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 106 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 110 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 114 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 118 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 122 0 1 0 5 0 6 0 7 0 8 0 9 0 10 0 16 0 20 0 22 0 25 0 26 0 27 0 28 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 50 0 53 0 54 0 55 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 126 1 207] 
#[0 0 126 1 207] 
#[0 0 130 1 207] 
#[0 0 134 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 138 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 142 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 0 1 207] 
#[0 0 146 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 146 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 146 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 150 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 150 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 154 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 158 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 4 153 0 25 4 157 0 36 4 161 0 39 4 165 0 186 0 162 1 207] 
#[0 0 0 1 207] 
#[0 0 166 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 166 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 166 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 170 0 25 0 90 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 4 177 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 4 189 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 4 205 1 7 1 13 1 13 1 17 1 14 1 21 1 15 4 209 1 16 1 101 1 17 4 213 1 18 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 4 217 1 206] 
#[0 0 174 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 178 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 182 0 25 0 83 0 90 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 186 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 0 186 0 8 4 153 0 25 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 46 0 186 0 53 0 186 0 95 4 221 0 186] 
#[0 0 190 1 207] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 225 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 4 229 1 47] 
#[1 4 233 0 40 4 237 0 41 4 241 0 42 4 245 0 46 4 249 0 185 4 253 1 39] 
#[0 0 194 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 1 65 0 25 0 217 0 90 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 5 1 1 43 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 5 5 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 0 198 0 1 0 198 0 5 0 198 0 6 0 198 0 7 0 198 0 9 0 198 0 16 0 198 0 20 0 198 0 26 0 198 0 27 0 198 0 30 0 198 0 35 5 9 0 37 5 13 0 38 0 198 0 40 0 198 0 41 0 198 0 42 0 198 0 43 0 198 0 44 0 198 0 45 0 198 0 46 0 198 0 47 5 17 0 53 0 198 0 54 0 198 0 57 0 198 0 64 0 198 0 70 0 198 0 83 0 198 0 85 0 198 0 86 0 198 0 91 0 198 0 92 0 109 0 95 5 21 0 191 5 25 1 41 5 29 1 42 0 198 1 207] 
#[0 0 202 0 1 0 5 0 6 0 7 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 0 206 0 1 0 206 0 5 0 206 0 6 0 206 0 7 5 33 0 8 0 206 0 9 0 206 0 16 0 206 0 20 0 206 0 26 0 206 0 27 0 206 0 30 0 206 0 35 0 206 0 37 0 206 0 38 0 206 0 40 0 206 0 41 0 206 0 42 0 206 0 43 0 206 0 44 0 206 0 45 0 206 0 46 0 206 0 47 0 206 0 53 0 206 0 54 0 206 0 57 0 206 0 64 0 206 0 70 0 206 0 83 0 206 0 85 0 206 0 86 0 206 0 91 0 206 0 92 0 206 0 95 5 37 1 45 0 206 1 207] 
#[1 1 65 0 25 0 217 0 90 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 5 41 1 43 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 0 186 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 186 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 186 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 0 0 1 207] 
#[0 0 0 1 207] 
#[1 0 186 0 1 0 186 0 5 0 186 0 6 0 186 0 7 0 186 0 8 0 186 0 9 0 186 0 16 0 186 0 20 4 153 0 25 0 186 0 26 0 186 0 27 0 186 0 30 0 186 0 35 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 43 0 186 0 44 0 186 0 45 0 186 0 46 0 186 0 47 0 186 0 53 0 186 0 54 0 186 0 57 0 186 0 64 0 186 0 70 0 186 0 83 0 186 0 85 0 186 0 86 0 186 0 91 0 186 0 92 0 186 0 95 5 45 0 186 0 186 1 207] 
#[1 5 49 0 16 5 53 0 20 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 0 210 1 207] 
#[1 0 214 0 1 5 93 0 5 0 214 0 6 5 97 0 7 5 101 0 9 0 214 0 16 0 214 0 20 0 214 0 26 0 214 0 27 0 214 0 30 0 214 0 35 4 237 0 41 4 241 0 42 5 105 0 43 5 109 0 44 5 113 0 45 4 245 0 46 0 214 0 47 0 214 0 54 0 214 0 57 0 214 0 64 0 214 0 70 5 117 0 83 0 214 0 85 0 214 0 86 1 77 0 91 0 214 0 92 5 121 1 30 5 125 1 31 5 129 1 32 5 133 1 33 5 137 1 34 5 141 1 35 5 145 1 36 4 253 1 39 0 214 1 207] 
#[0 0 218 0 1 0 6 0 16 0 20 0 26 0 27 0 30 0 35 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 92 1 207] 
#[0 0 222 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 30 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[0 0 226 0 100] 
#[0 0 230 0 3 0 25 0 30 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 234 0 3 0 25 0 41 0 46 0 66 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 238 0 100] 
#[0 0 242 0 97 0 100] 
#[0 0 246 0 3 0 25 0 30 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 250 0 11 0 15 0 30 0 62 0 69 0 97 0 100] 
#[0 0 254 0 30 0 97 0 100] 
#[0 1 2 0 100] 
#[0 1 6 0 30 0 62 0 97 0 100] 
#[0 1 10 0 3 0 25 0 30 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 0 1 207] 
#[0 1 14 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 0 158 0 6 0 158 0 25 5 149 0 28 0 158 0 30 0 158 0 36 0 158 0 39] 
#[1 5 153 0 6 4 153 0 25 5 157 0 30 4 157 0 36 4 161 0 39 5 161 0 128 5 165 0 156 5 45 0 186] 
#[0 1 18 1 207] 
#[1 5 157 0 30 5 169 0 128] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 173 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 5 157 0 30 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 177 0 122 5 181 0 128 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 5 185 0 128] 
#[0 1 22 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 26 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 5 189 1 51 5 193 1 52 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 1 30 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 34 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 42 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 0 237 0 100 5 197 0 120] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 5 205 1 76 5 209 1 78 5 213 1 80 5 217 1 81 1 25 1 203 1 29 1 204] 
#[1 0 30 0 62 0 30 0 72 0 30 0 81 5 221 0 113 4 29 0 134] 
#[1 5 225 0 14 1 46 0 17 5 229 0 63 5 233 0 73 1 50 0 92 5 237 1 87 5 241 1 90 5 245 1 91 5 249 1 93 5 253 1 97 6 1 1 99] 
#[1 1 54 0 30 1 54 0 62 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 5 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 6 9 1 105] 
#[1 0 237 0 100 6 13 0 120] 
#[1 0 237 0 100 6 17 0 120 6 21 0 130 6 25 1 162] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 6 29 0 66 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 6 33 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 6 37 1 165 1 25 1 203 1 29 1 204] 
#[0 1 58 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 58 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 58 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 1 58 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 169 0 11 1 177 0 15 6 41 0 62 6 45 0 69 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 49 0 121 6 53 0 228 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 6 57 1 62 6 61 1 71 6 65 1 160 2 105 1 161 2 109 1 164 6 69 1 171 6 73 1 173 6 77 1 175 6 81 1 176] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 85 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 6 89 1 128] 
#[1 1 54 0 30 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 5 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 6 93 1 105] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 97 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 1 62 0 26 0 27 0 30 0 47 1 207] 
#[1 2 145 0 24 6 101 0 162 2 173 0 163] 
#[0 0 0 1 207] 
#[0 1 66 1 207] 
#[0 1 70 0 30 1 207] 
#[0 1 74 0 30 1 207] 
#[0 1 78 0 30 1 207] 
#[0 1 82 0 26 0 27 0 30 1 207] 
#[0 1 70 0 30 1 207] 
#[0 1 70 0 30 1 207] 
#[1 2 145 0 24 6 105 0 163] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 6 109 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 0 101 0 67 0 105 0 94 6 113 0 178 4 73 0 213] 
#[1 2 145 0 24 6 117 0 163] 
#[1 2 145 0 24 6 121 0 163] 
#[1 2 145 0 24 6 125 0 163] 
#[1 0 94 0 71 4 97 0 93 6 129 0 208 4 105 1 126] 
#[0 1 70 0 30 1 207] 
#[0 1 86 0 2 0 3 0 25 0 31 0 32 0 41 0 46 0 58 0 71 0 76 0 87 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 0 0 1 207] 
#[1 2 217 0 64 0 53 0 72 6 133 0 112 0 69 0 129 2 229 0 179 6 137 1 178 2 237 1 179 1 90 1 207] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 6 145 1 0 6 149 1 1] 
#[0 1 94 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[1 1 98 0 31 1 98 0 32 1 98 0 59 1 98 0 61 1 98 0 64 1 98 0 71 1 98 0 72 1 98 0 74 1 98 0 76 6 153 1 180 6 157 1 181 1 98 1 207] 
#[0 1 102 0 25 0 30 0 100 1 207] 
#[0 1 106 0 25 0 50 0 97 0 100] 
#[0 1 110 0 18 0 31 0 32 0 65 0 100] 
#[0 1 114 0 100] 
#[0 1 118 0 97 0 100] 
#[0 1 122 0 18 0 65 0 100] 
#[0 1 126 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[0 1 130 0 18 0 100] 
#[0 0 0 1 207] 
#[0 1 134 0 27 0 28] 
#[0 1 138 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 6 161 0 27 6 165 0 28] 
#[0 1 146 0 27 0 28] 
#[1 0 237 0 100 6 169 0 120] 
#[1 0 237 0 100 6 173 0 120] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 6 177 1 0] 
#[1 6 181 0 18 3 1 0 65 0 237 0 100 6 185 0 120 6 189 0 157 6 193 1 124] 
#[1 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 6 205 1 96] 
#[1 5 157 0 30 6 209 0 54 6 213 0 85 6 217 0 128 6 221 0 164 6 225 1 132 6 229 1 135] 
#[1 5 157 0 30 6 233 0 128] 
#[1 0 73 0 4 6 237 0 182] 
#[1 5 157 0 30 6 241 0 128] 
#[1 5 157 0 30 6 245 0 128] 
#[1 6 181 0 18 0 237 0 100 6 17 0 120 6 141 0 130 6 249 1 0 6 253 1 124] 
#[0 1 150 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 150 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 150 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 2 241 0 31 2 245 0 32 7 1 0 61 2 217 0 64 3 1 0 65 3 13 0 76 0 237 0 100 3 21 0 120 7 5 0 147 3 81 0 151 7 9 0 157 7 13 0 179 3 93 0 236 3 101 0 239 7 17 0 245 7 21 1 108 7 25 1 113 7 29 1 116 7 33 1 118 7 37 1 127 7 41 1 191] 
#[1 5 157 0 30 7 45 0 128] 
#[1 6 181 0 18 3 1 0 65 0 237 0 100 6 17 0 120 7 49 0 130 7 53 0 157 7 57 1 124] 
#[1 5 157 0 30 7 61 0 128] 
#[0 1 154 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[0 1 158 0 25 0 30] 
#[0 0 0 1 207] 
#[0 1 162 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[1 5 157 0 30 6 209 0 54 6 213 0 85 6 217 0 128 7 65 0 164 6 225 1 132 6 229 1 135] 
#[1 0 73 0 4 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 6 237 0 182 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 7 93 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 6 181 0 18 0 237 0 100 6 17 0 120 6 141 0 130 6 249 1 0 7 133 1 124] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 1 166 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 137 0 25] 
#[0 0 0 1 207] 
#[0 1 174 1 207] 
#[1 6 181 0 18 7 141 1 124] 
#[0 1 178 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 178 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 178 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 1 178 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 6 213 0 85 7 145 0 164] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 7 93 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 6 181 0 18 7 133 1 124] 
#[1 6 181 0 18 7 149 1 124] 
#[0 1 182 0 30 0 31 0 32 0 33 0 59 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 82 0 100 1 207] 
#[0 1 186 0 31 0 32 0 59 0 64 0 71 0 74 0 76 1 207] 
#[1 0 22 0 31 0 22 0 32 0 22 0 59 2 217 0 64 4 5 0 71 0 53 0 72 0 22 0 74 0 22 0 76 6 133 0 112 7 153 0 115 0 69 0 129 2 229 0 179 4 21 0 180 6 137 1 178 2 237 1 179] 
#[1 2 241 0 31 2 245 0 32 3 161 0 59 3 9 0 74 3 13 0 76 7 157 0 116 3 173 0 139 3 177 0 140 3 181 0 145 3 93 0 236 3 101 0 239 3 185 0 248 3 189 0 249 3 193 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 3 201 1 118 3 205 1 131 3 141 1 134 3 209 1 182 3 213 1 183 3 157 1 190] 
#[0 1 190 0 31 0 32 0 59 0 74 0 76] 
#[0 1 194 0 31 0 32 0 59 0 64 0 71 0 74 0 76 1 207] 
#[1 1 198 0 13 1 198 0 31 1 198 0 32 1 198 0 59 1 198 0 62 1 198 0 64 1 198 0 71 0 53 0 72 1 198 0 73 1 198 0 74 1 198 0 76 1 198 0 81 1 198 0 82 1 198 0 90 1 198 0 100 7 161 0 112 0 69 0 129 1 198 1 207] 
#[1 1 202 0 25 7 165 0 30] 
#[0 7 169 0 25] 
#[0 1 206 0 26 0 27] 
#[1 7 173 0 26 7 177 0 27] 
#[0 1 210 0 26 0 27] 
#[0 1 214 0 26 0 27] 
#[1 5 49 0 16 5 53 0 20 1 218 0 30 0 97 0 57 5 57 0 86 0 149 0 174 0 165 0 183 7 181 0 190 7 185 0 192 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 1 218 1 207] 
#[1 1 222 0 6 4 153 0 25 1 222 0 30 4 157 0 36 4 161 0 39 0 89 0 47 1 222 0 54 0 97 0 57 1 222 0 64 7 189 0 173 7 193 0 174 7 197 0 175 7 201 0 176 0 165 0 183 4 165 0 186 1 222 1 207] 
#[1 1 226 0 30 2 217 0 64 7 205 0 179 1 226 1 207] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 7 209 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 1 230 0 58 0 71 0 90 0 93] 
#[0 1 234 0 1 0 6 0 26 0 27 0 30 0 35 0 54 0 64 0 92 1 207] 
#[1 5 49 0 16 5 53 0 20 1 238 0 30 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 1 238 1 207] 
#[1 5 49 0 16 5 53 0 20 1 218 0 30 0 89 0 47 0 97 0 57 5 57 0 86 0 149 0 174 7 213 0 176 0 165 0 183 7 181 0 190 7 217 0 192 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 1 218 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 7 221 0 121 7 225 0 124 1 93 0 178 1 97 0 184 0 253 0 189 7 229 0 199 7 233 0 204 7 237 0 205 7 241 0 206 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 7 245 0 89 7 249 0 200] 
#[0 1 242 0 58 0 71 0 90] 
#[1 7 253 0 58 4 5 0 71 0 217 0 90 8 1 0 180 8 5 0 181 8 9 0 209 8 13 0 212] 
#[0 1 246 0 58 0 71 0 90] 
#[0 1 250 0 6 0 21 0 97 0 100] 
#[0 1 254 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 0 97 0 100 1 207] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 8 17 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 2 2 0 30 1 207] 
#[0 2 6 0 30 1 207] 
#[0 2 10 0 30 1 207] 
#[0 2 10 0 30 1 207] 
#[1 8 21 0 25 2 14 0 30 8 25 0 237 8 29 1 111 2 14 1 207] 
#[1 2 241 0 31 2 245 0 32 8 33 0 236 8 37 0 239] 
#[1 8 21 0 25 2 14 0 50 8 41 0 237 8 29 1 111] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 8 45 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 8 49 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 8 53 1 4 8 57 1 5 8 61 1 6 8 65 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 8 69 1 206] 
#[1 4 113 0 34 0 221 0 96 0 225 0 97 0 237 0 100 6 17 0 120 8 73 0 130 8 77 0 189 8 81 0 241 8 85 1 2 8 89 1 8] 
#[0 2 18 0 12 0 25 0 47 0 48 0 57 0 100] 
#[1 0 77 0 12 0 89 0 47 0 93 0 48 0 237 0 100 8 93 0 120 8 97 0 176 8 101 0 195 8 105 0 222 8 109 0 255 8 113 1 9 8 117 1 10 8 121 1 11 8 125 1 12] 
#[0 2 22 0 1 0 35] 
#[1 0 186 0 1 0 186 0 5 0 186 0 7 0 186 0 8 0 186 0 9 0 186 0 16 0 186 0 20 4 153 0 25 0 186 0 26 0 186 0 27 0 186 0 35 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 43 0 186 0 44 0 186 0 45 0 186 0 46 0 186 0 53 0 97 0 57 0 186 0 64 0 186 0 83 0 186 0 86 0 186 0 91 0 186 0 95 8 129 0 174 0 165 0 183 4 221 0 186] 
#[1 2 26 0 1 5 49 0 16 5 53 0 20 8 133 0 26 2 30 0 27 2 26 0 35 2 217 0 64 5 57 0 86 8 137 0 179 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 2 34 0 1 0 26 0 27 0 35] 
#[1 0 214 0 1 5 93 0 5 5 97 0 7 5 101 0 9 0 214 0 16 0 214 0 20 0 214 0 26 0 214 0 27 0 214 0 35 4 233 0 40 4 237 0 41 4 241 0 42 5 105 0 43 5 109 0 44 5 113 0 45 4 245 0 46 0 214 0 64 5 117 0 83 0 214 0 86 1 77 0 91 4 249 0 185 5 121 1 30 5 125 1 31 5 129 1 32 5 133 1 33 5 137 1 34 5 141 1 35 5 145 1 36 4 253 1 39] 
#[1 0 138 0 1 0 138 0 5 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 16 0 138 0 20 0 138 0 26 0 138 0 27 0 138 0 35 0 138 0 37 0 138 0 38 0 138 0 40 0 138 0 41 0 138 0 42 0 138 0 43 0 138 0 44 0 138 0 45 0 138 0 46 0 138 0 53 7 253 0 58 0 138 0 64 0 138 0 83 0 138 0 86 0 138 0 91 0 138 0 95 8 141 0 209] 
#[1 8 145 0 1 8 149 0 35 8 153 0 133] 
#[0 2 38 0 1 0 35] 
#[0 2 42 0 1 0 35] 
#[1 8 157 0 26 2 30 0 27] 
#[1 8 161 0 26 8 165 0 27] 
#[0 8 169 0 27] 
#[1 2 46 0 1 2 30 0 26 2 30 0 27 2 46 0 35] 
#[1 0 77 0 12 1 65 0 25 0 89 0 47 0 93 0 48 0 97 0 57 0 237 0 100 8 93 0 120 8 97 0 176 8 173 0 183 8 101 0 195 8 105 0 222 8 109 0 255 8 113 1 9 8 117 1 10 8 121 1 11 8 125 1 12 1 101 1 17 8 177 1 48] 
#[1 2 50 0 1 2 50 0 5 2 50 0 6 2 50 0 7 2 50 0 8 2 50 0 9 2 50 0 16 2 50 0 20 4 153 0 25 2 50 0 26 2 50 0 27 2 50 0 30 2 50 0 35 4 157 0 36 2 50 0 37 2 50 0 38 4 161 0 39 2 50 0 40 2 50 0 41 2 50 0 42 2 50 0 43 2 50 0 44 2 50 0 45 2 50 0 46 2 50 0 47 2 50 0 53 2 50 0 54 2 50 0 57 2 50 0 64 2 50 0 70 2 50 0 83 2 50 0 85 2 50 0 86 2 50 0 91 2 50 0 92 2 50 0 95 5 45 0 186 2 50 1 207] 
#[0 2 50 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 2 54 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 58 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 62 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 66 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 8 181 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 8 185 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 70 0 1 0 5 0 6 0 7 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 2 74 0 1 2 74 0 5 2 74 0 6 2 74 0 7 2 74 0 9 2 74 0 16 2 74 0 20 2 74 0 26 2 74 0 27 2 74 0 30 2 74 0 35 5 9 0 37 5 13 0 38 2 74 0 40 2 74 0 41 2 74 0 42 2 74 0 43 2 74 0 44 2 74 0 45 2 74 0 46 2 74 0 47 5 17 0 53 2 74 0 54 2 74 0 57 2 74 0 64 2 74 0 70 2 74 0 83 2 74 0 85 2 74 0 86 2 74 0 91 2 74 0 92 0 109 0 95 5 21 0 191 5 25 1 41 5 29 1 42 2 74 1 207] 
#[0 2 78 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 82 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 86 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 90 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 8 189 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 94 0 3 0 25 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 98 0 25 0 90 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 65 0 25 0 217 0 90 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 8 193 1 43 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 102 0 1 0 5 0 6 0 7 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 0 77 0 12 1 65 0 25 0 89 0 47 0 93 0 48 0 237 0 100 8 93 0 120 8 97 0 176 8 101 0 195 8 105 0 222 8 109 0 255 8 113 1 9 8 117 1 10 8 121 1 11 8 125 1 12 1 101 1 17 8 177 1 48] 
#[0 2 106 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 110 0 3 0 25 0 41 0 46 0 70 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 114 0 3 0 11 0 15 0 25 0 41 0 46 0 62 0 69 0 79 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 8 197 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 8 201 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 118 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 118 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 118 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 2 122 0 3 2 122 0 25 2 122 0 41 2 122 0 46 8 205 0 70 2 122 0 90 2 122 0 91 2 122 0 94 2 122 0 96 2 122 0 97 2 122 0 98 2 122 0 99 2 122 0 100 8 209 1 28] 
#[1 2 126 0 3 2 126 0 25 2 126 0 41 2 126 0 46 8 213 0 79 2 126 0 90 2 126 0 91 2 126 0 94 2 126 0 96 2 126 0 97 2 126 0 98 2 126 0 99 2 126 0 100 8 217 1 29] 
#[0 2 130 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 134 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 138 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 142 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 146 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 150 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 154 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 158 0 3 0 25 0 41 0 46 0 51 0 88 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 1 93 0 178 8 221 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 8 225 0 121 8 229 0 124 1 93 0 178 1 97 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 162 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 166 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 170 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 174 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 5 117 0 83 8 233 1 35] 
#[0 2 178 0 14 0 17 0 63 0 73 0 92] 
#[0 2 182 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 186 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 31 0 32 0 33 0 49 0 50 0 52 0 56 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 68 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 2 190 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 8 237 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 2 194 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 5 49 0 16 5 53 0 20 6 213 0 85 5 57 0 86 8 241 0 164 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 8 245 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 2 198 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 2 202 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 2 206 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 2 210 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[1 8 249 0 10 8 253 1 74] 
#[1 2 214 0 1 5 49 0 16 5 53 0 20 2 214 0 30 2 214 0 70 2 214 0 85 5 57 0 86 2 214 0 92 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 8 213 0 79 9 1 0 80 2 218 0 81 9 5 1 29 9 9 1 77 9 13 1 79] 
#[0 2 222 0 79 0 80 0 81] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 25 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 8 205 0 70 9 29 1 28] 
#[1 2 226 0 62 2 226 0 81 9 33 1 83 9 37 1 85] 
#[0 2 230 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 100] 
#[0 2 234 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 2 238 0 100] 
#[1 9 41 0 92 9 45 1 88 9 49 1 95] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 9 53 1 81 1 25 1 203 1 29 1 204] 
#[1 2 242 0 3 2 242 0 25 2 242 0 41 2 242 0 46 9 57 0 51 2 242 0 90 2 242 0 91 2 242 0 94 2 242 0 96 2 242 0 97 2 242 0 98 2 242 0 99 2 242 0 100 9 61 1 92 9 65 1 94] 
#[1 0 237 0 100 9 69 0 120] 
#[1 9 73 0 17 9 77 1 98 9 81 1 100] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 9 85 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 4 153 0 25 2 246 0 30 4 157 0 36 4 161 0 39 2 246 0 62 4 165 0 186] 
#[1 2 250 0 30 6 41 0 62 9 89 0 228 9 93 1 106] 
#[1 5 157 0 30 9 97 0 128] 
#[0 1 202 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 50 0 53 0 54 0 55 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 2 254 0 25 0 30 0 55] 
#[1 9 101 0 25 2 14 0 30 2 14 0 55 9 105 0 237 8 29 1 111] 
#[0 3 2 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 9 109 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 9 113 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 3 6 0 3 0 25 0 41 0 46 0 87 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 3 10 0 30] 
#[1 4 153 0 25 5 157 0 30 4 157 0 36 4 161 0 39 9 117 0 128 4 165 0 186] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 9 121 1 81 1 25 1 203 1 29 1 204] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 3 14 0 70 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 3 14 0 79 3 14 0 81 1 209 0 84 3 14 0 86 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 125 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 9 129 1 174 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 3 14 0 79 3 14 0 81 1 209 0 84 3 14 0 86 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 125 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 9 133 1 174 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 3 14 0 70 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 3 14 0 79 1 209 0 84 3 14 0 86 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 125 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 9 137 1 174 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 3 18 0 79 3 18 0 81 3 18 0 86 9 141 1 172] 
#[0 3 22 0 79 0 81 0 86] 
#[1 5 157 0 30 9 145 0 128] 
#[1 8 205 0 70 9 149 1 28] 
#[1 4 153 0 25 3 26 0 27 3 26 0 30 4 157 0 36 4 161 0 39 4 165 0 186] 
#[1 9 153 0 27 5 157 0 30 9 157 0 128] 
#[1 5 157 0 30 9 161 0 128] 
#[1 4 153 0 25 5 157 0 30 4 157 0 36 4 161 0 39 2 217 0 64 9 165 0 128 9 169 0 179 4 165 0 186] 
#[0 9 173 0 26] 
#[0 3 30 0 30 1 207] 
#[1 3 34 0 30 2 217 0 64 9 177 0 179 3 34 1 207] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 9 181 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 3 38 0 30 1 207] 
#[0 3 42 0 30 1 207] 
#[1 3 46 0 30 0 89 0 47 9 185 0 176 3 46 1 207] 
#[1 4 5 0 71 8 1 0 180] 
#[0 3 50 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 3 54 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 3 58 0 25 0 26 0 27 0 30 0 36 0 50 0 54 0 85] 
#[1 3 62 0 27 3 62 0 30 9 189 0 36] 
#[1 9 193 0 27 5 157 0 30 9 197 0 128] 
#[0 3 66 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[1 3 70 0 31 3 70 0 32 3 70 0 59 7 1 0 61 3 70 0 64 3 70 0 71 3 70 0 72 3 70 0 74 3 70 0 76 9 201 0 245 7 37 1 127 3 70 1 207] 
#[1 0 237 0 100 3 21 0 120 9 205 0 151] 
#[1 9 209 0 19 3 74 0 21 4 109 0 29 9 213 0 77 3 74 0 97 3 74 0 100 9 217 0 148 9 221 0 152 9 225 0 153 9 229 1 133] 
#[1 9 233 0 25 3 78 0 30 3 78 0 85 9 237 0 158 9 241 0 160 9 245 0 161] 
#[1 6 213 0 85 9 249 0 164] 
#[1 8 21 0 25 2 14 0 30 9 189 0 36 2 14 0 54 2 14 0 85 9 253 0 237 8 29 1 111] 
#[0 3 82 0 100] 
#[1 6 213 0 85 10 1 0 164 10 5 1 144] 
#[1 0 237 0 100 6 17 0 120 10 9 0 130] 
#[1 0 237 0 100 6 17 0 120 10 13 0 130] 
#[0 3 86 0 25 0 30 0 50 0 54 0 85] 
#[1 3 90 0 25 3 90 0 30 9 189 0 36 3 90 0 50 3 90 0 54 3 90 0 85] 
#[1 8 21 0 25 3 94 0 30 2 14 0 50 3 94 0 54 3 94 0 85 10 17 0 237 8 29 1 111] 
#[0 3 98 0 97 0 100] 
#[0 3 102 0 4 0 12 0 17 0 21 0 24 0 25 0 31 0 32 0 33 0 47 0 48 0 57 0 58 0 59 0 60 0 61 0 62 0 65 0 67 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 90 0 93 0 94 0 95 0 97 0 100] 
#[0 3 106 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 3 110 0 4 3 110 0 17 3 110 0 31 3 110 0 32 3 110 0 33 3 161 0 59 3 110 0 60 3 110 0 61 3 110 0 65 3 110 0 68 3 110 0 72 3 110 0 73 3 110 0 74 3 110 0 76 0 105 0 94 3 110 0 100 10 21 0 178 10 25 1 183 10 29 1 194] 
#[1 5 157 0 30 10 33 0 128] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 10 37 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 3 106 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 157 0 30 10 41 0 128] 
#[0 3 114 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 3 114 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 9 189 0 36 6 209 0 54 6 213 0 85 10 45 0 164 10 49 1 119 10 53 1 132 6 229 1 135] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 10 57 1 0] 
#[0 3 118 0 3 0 22 0 25 0 41 0 46 0 58 0 65 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 6 161 0 27 10 61 0 28] 
#[1 0 237 0 100 6 17 0 120 10 65 0 130] 
#[1 2 241 0 31 2 245 0 32 3 13 0 76 10 69 0 236 10 73 0 239 10 77 1 118] 
#[0 3 122 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[1 5 157 0 30 6 209 0 54 10 81 0 128 10 85 1 132 6 229 1 135] 
#[1 5 157 0 30 10 89 0 128] 
#[1 5 157 0 30 10 93 0 128] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 10 97 1 0] 
#[1 3 1 0 65 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 85 0 121 10 101 0 157 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 10 105 1 128] 
#[0 3 126 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[0 3 130 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 3 134 0 30 6 213 0 85 10 109 0 164 10 113 1 138] 
#[1 0 237 0 100 6 17 0 120 10 117 0 130] 
#[1 0 237 0 100 6 17 0 120 10 121 0 130] 
#[0 3 138 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 3 110 0 4 3 110 0 17 3 110 0 31 3 110 0 32 3 110 0 33 3 110 0 60 3 110 0 61 3 110 0 65 3 110 0 68 3 110 0 72 3 110 0 73 3 110 0 74 3 110 0 76 0 105 0 94 3 110 0 100 10 21 0 178 10 29 1 194] 
#[0 3 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100] 
#[0 3 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100] 
#[0 3 146 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100] 
#[1 6 181 0 18 3 1 0 65 0 237 0 100 6 185 0 120 6 189 0 157 10 125 1 124] 
#[0 3 150 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100] 
#[1 3 154 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 3 154 0 81 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 10 129 0 242 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 9 73 0 17 10 133 1 98 9 81 1 100] 
#[0 3 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100] 
#[0 3 142 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100] 
#[0 3 146 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100] 
#[1 0 237 0 100 6 17 0 120 10 137 0 130 10 141 0 221] 
#[1 6 181 0 18 0 237 0 100 6 17 0 120 6 141 0 130 6 249 1 0 10 145 1 124] 
#[1 6 181 0 18 3 1 0 65 0 237 0 100 6 17 0 120 7 49 0 130 7 53 0 157 10 149 1 124] 
#[0 3 158 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[0 3 158 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[0 3 158 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 10 153 1 0] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 10 157 1 0] 
#[1 0 237 0 100 6 17 0 120 10 161 0 130] 
#[0 3 110 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 100] 
#[1 0 237 0 100 6 17 0 120 10 165 0 130] 
#[1 2 241 0 31 2 245 0 32 3 161 0 59 3 9 0 74 3 13 0 76 10 169 0 116 3 173 0 139 3 177 0 140 3 181 0 145 3 93 0 236 3 101 0 239 3 185 0 248 3 189 0 249 3 193 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 3 201 1 118 3 205 1 131 3 141 1 134 3 209 1 182 3 213 1 183 3 157 1 190] 
#[1 0 30 0 31 0 30 0 32 0 30 0 59 0 30 0 64 0 30 0 71 0 30 0 72 0 30 0 74 0 30 0 76 10 173 0 113 4 29 0 134 0 30 1 207] 
#[0 3 162 0 13 0 31 0 32 0 59 0 62 0 64 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 90 0 100 1 207] 
#[0 3 166 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 31 0 32 0 33 0 49 0 50 0 52 0 56 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 68 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 10 177 0 120 1 149 0 121 10 181 0 122 10 185 0 130 10 189 0 131 10 193 0 132 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 3 170 0 30 1 207] 
#[1 0 221 0 96 0 237 0 100 4 41 0 120 10 197 0 188 4 53 0 189] 
#[0 3 174 0 30 1 207] 
#[0 3 178 0 30 1 207] 
#[0 3 182 0 6 0 30 0 54 0 64 1 207] 
#[0 3 186 0 6 0 30 0 54 0 64 1 207] 
#[0 3 186 0 6 0 30 0 54 0 64 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 10 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 7 253 0 58 4 5 0 71 0 217 0 90 10 205 0 180 10 209 0 181 8 9 0 209 8 13 0 212] 
#[1 2 217 0 64 10 213 0 179] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 10 217 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 3 190 0 30 1 207] 
#[1 0 186 0 8 4 153 0 25 3 194 0 26 3 194 0 27 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 46 0 186 0 53 0 97 0 57 0 186 0 95 10 221 0 174 10 225 0 177 10 229 0 183 4 221 0 186] 
#[0 3 198 0 26 0 27 0 92] 
#[1 10 233 0 26 10 237 0 27] 
#[0 3 202 0 26 0 27] 
#[1 10 241 0 26 10 245 0 27] 
#[0 3 206 0 26 0 27] 
#[0 3 210 0 19 0 97 0 100] 
#[1 9 209 0 19 3 214 0 97 3 214 0 100 10 249 0 152 10 253 0 201 11 1 0 203] 
#[0 3 218 0 13 0 22 0 26 0 30 0 72 0 81 0 90 0 100 1 207] 
#[0 3 222 0 30 1 207] 
#[0 3 226 0 30 1 207] 
#[1 0 30 0 13 0 30 0 72 0 30 0 90 0 30 0 100 11 5 0 113 4 29 0 134] 
#[1 7 253 0 58 11 9 0 209] 
#[0 3 230 0 30 1 207] 
#[1 0 237 0 100 3 21 0 120 7 5 0 147 3 81 0 151 11 13 1 112 11 17 1 113] 
#[0 3 234 0 30 1 207] 
#[0 3 238 0 30 0 50 0 54 0 55 0 62 0 85 1 207] 
#[1 8 21 0 25 2 14 0 30 11 21 0 237 8 29 1 111 2 14 1 207] 
#[1 8 21 0 25 2 14 0 50 11 25 0 237 8 29 1 111] 
#[1 1 189 0 50 11 29 0 240] 
#[0 3 242 0 30 1 207] 
#[1 2 26 0 1 5 49 0 16 5 53 0 20 3 246 0 26 3 246 0 27 2 26 0 35 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 11 33 0 26] 
#[1 3 250 0 26 11 37 0 27] 
#[0 3 254 0 26 0 27] 
#[0 3 246 0 26 0 27] 
#[1 2 46 0 1 3 246 0 26 3 246 0 27 2 46 0 35] 
#[0 4 2 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 6 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 10 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 14 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 18 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 22 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 26 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 30 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 34 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 38 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 42 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 42 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 42 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 42 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 22 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 61 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 46 0 1 0 26 0 27 0 35] 
#[0 4 50 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 8 49 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 11 41 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 11 45 1 4 8 57 1 5 8 61 1 6 8 65 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 8 69 1 206] 
#[0 11 49 0 26] 
#[0 4 54 0 2 0 3 0 11 0 13 0 14 0 15 0 17 0 23 0 25 0 41 0 46 0 49 0 50 0 52 0 56 0 63 0 69 0 72 0 73 0 75 0 78 0 84 0 90 0 91 0 92 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 11 53 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 11 57 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 11 61 1 206] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 11 65 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 4 58 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 62 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 11 69 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 11 73 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 11 77 1 18 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 4 217 1 206] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 11 69 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 11 73 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 11 81 1 18 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 4 217 1 206] 
#[1 4 66 0 1 4 66 0 6 4 66 0 16 4 66 0 20 11 85 0 25 4 66 0 26 4 66 0 27 4 66 0 30 4 66 0 35 4 66 0 47 4 66 0 54 4 66 0 57 4 66 0 64 4 66 0 70 4 66 0 85 4 66 0 86 4 66 0 92 4 66 1 207] 
#[0 4 70 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 4 74 0 1 4 74 0 6 4 74 0 16 4 74 0 20 4 74 0 26 4 74 0 27 4 74 0 30 4 74 0 35 4 237 0 41 4 241 0 42 4 245 0 46 4 74 0 47 4 74 0 54 4 74 0 57 4 74 0 64 4 74 0 70 4 74 0 85 4 74 0 86 4 74 0 92 4 253 1 39 4 74 1 207] 
#[1 4 78 0 1 4 78 0 5 4 78 0 6 4 78 0 7 4 78 0 9 4 78 0 16 4 78 0 20 4 78 0 26 4 78 0 27 4 78 0 30 4 78 0 35 5 9 0 37 5 13 0 38 4 78 0 40 4 78 0 41 4 78 0 42 4 78 0 43 4 78 0 44 4 78 0 45 4 78 0 46 4 78 0 47 5 17 0 53 4 78 0 54 4 78 0 57 4 78 0 64 4 78 0 70 4 78 0 83 4 78 0 85 4 78 0 86 4 78 0 91 4 78 0 92 0 109 0 95 5 21 0 191 5 25 1 41 5 29 1 42 4 78 1 207] 
#[0 4 82 0 1 0 5 0 6 0 7 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 86 0 1 0 5 0 6 0 7 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 4 90 0 1 0 6 0 16 0 20 0 26 0 27 0 30 0 35 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 92 1 207] 
#[0 4 94 0 1 0 6 0 16 0 20 0 26 0 27 0 30 0 35 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 92 1 207] 
#[0 4 98 0 2 0 3 0 11 0 13 0 14 0 15 0 17 0 23 0 25 0 41 0 46 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 91 0 92 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 4 102 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 4 106 0 2 0 3 0 11 0 13 0 14 0 15 0 17 0 23 0 25 0 41 0 46 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 91 0 92 0 94 0 96 0 97 0 98 0 99 0 100] 
#[0 4 110 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 4 114 0 1 4 114 0 6 4 114 0 16 4 114 0 20 4 114 0 26 4 114 0 27 4 114 0 30 4 114 0 35 4 237 0 41 4 241 0 42 4 245 0 46 4 114 0 47 4 114 0 54 4 114 0 57 4 114 0 64 4 114 0 70 4 114 0 85 4 114 0 86 4 114 0 92 4 253 1 39 4 114 1 207] 
#[1 4 118 0 1 4 118 0 6 0 186 0 8 4 118 0 16 4 118 0 20 4 153 0 25 4 118 0 26 4 118 0 27 4 118 0 30 4 118 0 35 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 46 4 118 0 47 0 186 0 53 4 118 0 54 4 118 0 57 4 118 0 64 4 118 0 70 4 118 0 85 4 118 0 86 4 118 0 92 0 186 0 95 4 221 0 186 4 118 1 207] 
#[0 4 118 0 1 0 6 0 16 0 20 0 26 0 27 0 30 0 35 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 92 1 207] 
#[0 4 122 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 11 89 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 4 126 0 62 0 72 0 81] 
#[0 4 130 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 4 134 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[0 4 138 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[0 4 142 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 11 93 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 11 97 0 81 11 101 0 211] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 11 105 1 78 5 213 1 80 5 217 1 81 1 25 1 203 1 29 1 204] 
#[0 4 146 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 4 150 0 62 0 14 0 63 4 150 0 70 0 53 0 72 0 14 0 73 1 201 0 75 4 150 0 77 1 205 0 78 4 150 0 79 4 150 0 80 4 150 0 81 1 209 0 84 4 150 0 86 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 11 109 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 4 154 0 79 0 80 0 81] 
#[0 4 158 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[1 11 97 0 81 11 113 0 211] 
#[1 6 41 0 62 4 162 0 81 11 117 0 228 11 121 1 84] 
#[0 4 166 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 30 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 11 125 1 89 11 129 1 96] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 11 133 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 4 174 0 92] 
#[0 4 178 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 11 137 0 121 7 225 0 124 1 93 0 178 1 97 0 184 0 253 0 189 11 141 0 206 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 4 182 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 5 117 0 83 11 145 1 35] 
#[0 4 186 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[1 11 97 0 81 11 149 0 211] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 11 153 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 11 157 1 101 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 4 190 0 17] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 11 161 1 81 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 11 165 0 128] 
#[0 4 194 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 11 169 0 120 1 149 0 121 11 173 0 122 7 5 0 147 3 81 0 151 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 11 13 1 112 11 17 1 113 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 11 177 0 55 11 181 0 128 11 185 1 163] 
#[0 4 198 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 11 189 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 4 202 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 70 0 72 0 73 0 75 0 78 0 79 0 84 0 86 0 90 0 92 0 97 0 100] 
#[1 8 145 0 1 11 193 0 133] 
#[0 4 206 0 70 0 79 0 81 0 86] 
#[1 4 210 0 70 4 214 0 79 4 214 0 81 4 214 0 86] 
#[0 4 218 0 79 0 81 0 86] 
#[1 4 210 0 70 8 213 0 79 5 57 0 86 11 197 1 26 11 201 1 29] 
#[1 8 213 0 79 2 218 0 81 5 57 0 86 11 205 1 26 9 5 1 29 11 209 1 77] 
#[0 4 222 0 79 0 81 0 86] 
#[1 1 165 0 2 11 213 1 177] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 11 217 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 4 226 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 4 230 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 4 234 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 165 0 2 11 221 1 177] 
#[0 4 238 0 30 0 85 1 207] 
#[1 4 5 0 71 11 225 0 180] 
#[1 2 217 0 64 11 229 0 179] 
#[1 2 145 0 24 11 233 0 163] 
#[1 0 237 0 100 6 17 0 120 11 237 0 130] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 11 241 1 0] 
#[0 4 242 0 31 0 32 0 59 0 61 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 4 246 0 31 0 32 0 59 0 61 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 4 250 0 27 0 28] 
#[0 4 254 0 21 0 29 0 97 0 100] 
#[0 5 2 0 30 0 54 0 62] 
#[1 0 81 0 21 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 11 245 0 149 11 249 0 154 11 253 0 155 0 189 0 196 0 193 0 197 0 197 0 198 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 5 6 0 21 4 109 0 29 5 6 0 97 5 6 0 100 12 1 0 153] 
#[1 5 153 0 6 5 10 0 21 5 10 0 97 5 10 0 100 12 5 0 156] 
#[1 5 157 0 30 6 209 0 54 12 9 0 128 12 13 1 132 6 229 1 135] 
#[1 2 145 0 24 0 237 0 100 3 21 0 120 12 17 0 147 3 81 0 151 6 101 0 162 2 173 0 163 12 21 0 218 12 25 0 219] 
#[1 5 14 0 30 6 213 0 85 12 29 0 159 12 33 0 164] 
#[0 5 18 0 30 0 85] 
#[0 5 22 0 30 0 85] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 12 37 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 5 26 0 30 0 54 0 85] 
#[1 5 30 0 31 5 30 0 32 5 30 0 71 5 30 0 72 5 30 0 73 5 30 0 81 5 30 0 82 12 41 1 145 12 45 1 147 12 49 1 150] 
#[0 5 34 0 30] 
#[1 9 233 0 25 3 78 0 85 12 53 0 158 9 241 0 160 9 245 0 161] 
#[1 6 213 0 85 12 57 0 164] 
#[1 1 189 0 50 12 61 0 240] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 12 65 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 5 157 0 30 12 69 0 128] 
#[0 5 38 0 30] 
#[0 5 42 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 4 153 0 25 5 46 0 30 4 157 0 36 4 161 0 39 4 165 0 186] 
#[0 5 50 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 54 0 31 5 54 0 32 5 54 0 33 5 54 0 60 5 54 0 61 5 54 0 65 5 54 0 68 5 54 0 71 5 54 0 72 5 54 0 73 5 54 0 74 5 54 0 76 5 54 0 81 0 105 0 94 5 54 0 100 10 21 0 178 12 73 1 120 12 77 1 123 12 81 1 194] 
#[0 5 58 0 30] 
#[1 5 157 0 30 12 85 0 128] 
#[1 9 189 0 36 6 213 0 85 12 89 0 164] 
#[1 0 77 0 12 5 117 0 83 12 93 0 88 5 62 0 100 12 97 0 222 12 101 1 35 12 105 1 114 12 109 1 115] 
#[1 9 233 0 25 3 78 0 85 12 113 0 158 9 241 0 160 9 245 0 161] 
#[1 0 237 0 100 6 17 0 120 12 117 0 130] 
#[1 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 12 121 1 96] 
#[1 0 237 0 100 6 17 0 120 12 125 0 130] 
#[0 5 66 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 157 0 30 12 129 0 128] 
#[0 5 70 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[0 5 74 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 9 189 0 36 6 209 0 54 6 213 0 85 12 133 0 164 10 49 1 119 12 137 1 132 6 229 1 135] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 6 85 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 12 141 1 128] 
#[1 9 153 0 27 5 157 0 30 12 145 0 128] 
#[1 0 30 0 71 0 30 0 72 0 30 0 73 0 30 0 81 0 30 0 82 12 149 0 113 4 29 0 134 12 153 1 139 12 157 1 141] 
#[0 5 78 0 30] 
#[1 9 233 0 25 3 78 0 30 3 78 0 85 12 161 0 158 9 241 0 160 9 245 0 161] 
#[1 6 213 0 85 12 165 0 164] 
#[1 0 237 0 100 6 17 0 120 12 169 0 130] 
#[0 5 82 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 72 0 73 0 74 0 76 0 81 0 100] 
#[1 11 97 0 81 12 173 0 211] 
#[0 5 86 0 6 0 22 0 26 0 30 0 36 0 39 0 61 1 207] 
#[1 12 177 0 36 4 161 0 39 7 1 0 61 12 181 0 186 12 185 1 127] 
#[1 0 237 0 100 6 17 0 120 6 141 0 130 12 189 1 0] 
#[1 0 237 0 100 6 17 0 120 12 193 0 130] 
#[1 9 189 0 36 6 213 0 85 12 197 0 164] 
#[1 12 201 0 26 9 189 0 36] 
#[1 6 213 0 85 12 205 0 164] 
#[1 6 213 0 85 12 209 0 164] 
#[1 0 30 0 31 0 30 0 32 0 30 0 59 0 30 0 64 0 30 0 71 0 30 0 72 0 30 0 74 0 30 0 76 12 213 0 113 4 29 0 134 0 30 1 207] 
#[0 5 90 0 31 0 32 0 59 0 64 0 71 0 74 0 76 1 207] 
#[1 1 202 0 1 0 158 0 5 0 158 0 7 0 158 0 8 0 158 0 9 0 158 0 16 0 158 0 20 0 158 0 25 0 158 0 26 0 158 0 27 0 158 0 36 0 158 0 37 0 158 0 38 0 158 0 39 0 158 0 41 0 158 0 42 0 158 0 43 0 158 0 44 0 158 0 45 0 158 0 46 0 158 0 53 0 158 0 83 0 158 0 86 0 158 0 91 0 158 0 95] 
#[1 5 49 0 16 5 53 0 20 5 94 0 26 5 94 0 27 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 8 145 0 1 12 217 0 133] 
#[1 12 221 0 26 12 225 0 27] 
#[0 5 98 0 26 0 27] 
#[0 5 102 0 26 0 27] 
#[1 3 194 0 6 5 49 0 16 5 53 0 20 3 194 0 30 3 194 0 54 0 97 0 57 3 194 0 64 5 57 0 86 10 221 0 174 12 229 0 177 0 165 0 183 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 3 194 1 207] 
#[0 5 106 0 30 1 207] 
#[0 5 110 0 30 1 207] 
#[1 7 253 0 58 4 5 0 71 0 217 0 90 12 233 0 180 12 237 0 181 8 9 0 209 8 13 0 212] 
#[1 5 49 0 16 5 53 0 20 1 218 0 30 0 97 0 57 5 57 0 86 0 149 0 174 0 165 0 183 7 181 0 190 12 241 0 192 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27 1 218 1 207] 
#[0 5 114 0 6 0 26 0 27 0 30 0 54 0 64 0 92 1 207] 
#[0 5 118 0 26 0 27 0 92] 
#[1 1 61 0 3 2 145 0 24 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 85 0 121 4 77 0 124 12 245 0 162 2 173 0 163 1 93 0 178 1 97 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 7 245 0 89 12 249 0 200] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 12 253 0 121 13 1 0 204 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 5 122 0 89] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 11 137 0 121 7 225 0 124 1 93 0 178 1 97 0 184 0 253 0 189 13 5 0 206 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 5 126 0 97 0 100] 
#[0 5 130 0 6 0 30 1 207] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 4 61 0 121 13 9 0 154 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 1 173 0 13 0 217 0 90 0 237 0 100 3 21 0 120 13 13 0 147 3 81 0 151 13 17 0 210 13 21 0 212 13 25 0 214 13 29 0 216 13 33 0 217 13 37 0 224] 
#[0 5 134 0 30 1 207] 
#[1 13 41 0 26 5 157 0 30 13 45 0 128] 
#[0 5 138 0 26 0 30] 
#[0 5 142 0 30 1 207] 
#[1 1 189 0 50 13 49 0 240] 
#[1 0 237 0 100 6 17 0 120 10 137 0 130 13 53 0 221] 
#[0 5 146 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 25 0 26 0 27 0 30 0 35 0 36 0 37 0 38 0 39 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 62 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 8 49 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 13 57 1 6 8 65 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 8 69 1 206] 
#[1 0 138 0 1 0 138 0 5 0 138 0 7 0 138 0 8 0 138 0 9 0 138 0 16 0 138 0 20 0 138 0 26 0 138 0 27 0 138 0 35 0 138 0 37 0 138 0 38 0 138 0 40 0 138 0 41 0 138 0 42 0 138 0 43 0 138 0 44 0 138 0 45 0 138 0 46 0 138 0 53 7 253 0 58 0 138 0 83 0 138 0 86 0 138 0 91 0 138 0 95 13 61 0 209] 
#[0 13 65 0 26] 
#[0 5 150 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 2 26 0 1 5 49 0 16 5 53 0 20 2 26 0 35 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 5 154 0 1 0 35] 
#[0 2 46 0 1 0 35] 
#[1 5 49 0 16 5 53 0 20 5 158 0 26 5 158 0 27 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 2 26 0 1 5 49 0 16 5 53 0 20 2 30 0 26 2 30 0 27 2 26 0 35 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 2 30 0 26 0 27] 
#[0 5 162 0 26 0 27] 
#[0 5 166 0 26 0 27] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 13 69 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 5 170 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 5 174 0 81] 
#[0 5 178 0 13 0 30 0 52 0 58 0 84 0 92 0 97 0 100] 
#[1 1 209 0 84 13 73 1 75] 
#[0 5 182 0 79 0 80 0 81] 
#[0 5 186 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100] 
#[1 1 173 0 13 13 77 0 224] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 11 53 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 13 81 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 11 61 1 206] 
#[0 5 190 0 62 0 81] 
#[1 5 157 0 30 13 85 0 128] 
#[0 5 194 0 30] 
#[1 11 97 0 81 13 89 0 211] 
#[1 0 186 0 8 4 153 0 25 3 194 0 26 3 194 0 27 4 157 0 36 0 186 0 37 0 186 0 38 4 161 0 39 0 186 0 40 0 186 0 41 0 186 0 42 0 186 0 46 0 186 0 53 0 97 0 57 3 194 0 92 0 186 0 95 10 221 0 174 10 225 0 177 0 165 0 183 4 221 0 186] 
#[0 5 198 0 92] 
#[0 5 202 0 3 0 25 0 41 0 46 0 51 0 90 0 91 0 94 0 96 0 97 0 98 0 99 0 100] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 13 93 1 89 11 129 1 96] 
#[1 9 213 0 77 5 206 0 81 13 97 1 102 13 101 1 103 13 105 1 133] 
#[0 5 210 0 81] 
#[0 5 214 0 30] 
#[0 5 218 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 0 158 0 5 0 158 0 7 0 158 0 8 0 158 0 9 0 158 0 16 0 158 0 20 0 158 0 25 0 158 0 26 1 134 0 27 1 134 0 28 0 158 0 36 0 158 0 37 0 158 0 38 0 158 0 39 0 158 0 40 0 158 0 41 0 158 0 42 0 158 0 43 0 158 0 44 0 158 0 45 0 158 0 46 0 158 0 53 0 158 0 57 0 158 0 83 0 158 0 86 0 158 0 91 0 158 0 95] 
#[1 5 49 0 16 5 53 0 20 13 109 0 26 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 5 222 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 63 0 72 0 73 0 75 0 78 0 84 0 90 0 92 0 97 0 100] 
#[0 5 226 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 11 153 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 13 113 1 101 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 5 230 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 169 0 11 1 177 0 15 6 45 0 69 13 117 1 62 6 61 1 71 2 105 1 161 2 109 1 164 13 121 1 173 6 77 1 175] 
#[1 1 177 0 15 13 125 1 62 2 109 1 164] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 13 129 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 1 169 0 11 1 177 0 15 6 41 0 62 6 45 0 69 6 53 0 228 13 117 1 62 6 61 1 71 2 105 1 161 2 109 1 164 13 133 1 171 6 73 1 173 6 77 1 175] 
#[1 11 97 0 81 13 137 0 211] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 13 141 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 4 153 0 25 5 234 0 27 5 234 0 30 4 157 0 36 4 161 0 39 4 165 0 186] 
#[1 5 157 0 30 13 145 0 128] 
#[0 5 238 0 30 1 207] 
#[1 4 5 0 71 13 149 0 180] 
#[0 5 242 0 30 1 207] 
#[0 5 246 0 25 0 26 0 27 0 30 0 36 0 50 0 54 0 85] 
#[1 5 250 0 27 5 250 0 30 9 189 0 36] 
#[1 5 153 0 6 5 254 0 30 13 153 0 150 13 157 0 156] 
#[1 6 2 0 6 6 2 0 30 6 209 0 54 13 161 1 132 6 229 1 135] 
#[0 6 2 0 6 0 30] 
#[0 6 6 0 21 0 97 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 13 165 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 6 10 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 157 0 30 13 169 0 128] 
#[1 6 161 0 27 13 173 0 28] 
#[1 13 177 0 26 5 157 0 30 13 181 0 128] 
#[0 6 14 0 26 0 30] 
#[1 5 157 0 30 13 185 0 128] 
#[1 0 73 0 4 0 77 0 12 0 81 0 21 0 85 0 25 0 89 0 47 0 93 0 48 0 97 0 57 0 10 0 58 0 101 0 67 0 10 0 71 0 10 0 90 0 10 0 93 0 105 0 94 0 109 0 95 13 189 0 117 0 117 0 155 0 121 0 165 0 125 0 166 0 129 0 167 0 133 0 168 0 137 0 169 0 141 0 170 0 145 0 171 0 149 0 174 0 153 0 176 0 157 0 178 0 161 0 182 0 165 0 183 0 169 0 190 0 173 0 191 0 177 0 193 0 181 0 194 0 185 0 195 0 189 0 196 0 193 0 197 0 197 0 198 0 201 0 207 0 205 0 213 0 209 0 222] 
#[1 5 157 0 30 13 193 0 128] 
#[1 4 5 0 71 6 18 0 81 13 197 0 180 13 201 1 146] 
#[0 6 22 0 71 0 81] 
#[1 2 241 0 31 2 245 0 32 6 26 0 71 0 53 0 72 5 233 0 73 6 26 0 81 13 205 0 82 13 209 0 112 0 69 0 129 3 93 0 236 3 101 0 239 13 213 0 246 7 109 1 93 13 217 1 108 13 221 1 149 13 225 1 151 13 229 1 157 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 6 213 0 85 10 1 0 164 13 233 1 144] 
#[1 3 161 0 59 13 237 1 183] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 13 241 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 4 153 0 25 6 30 0 30 4 157 0 36 4 161 0 39 4 165 0 186] 
#[0 6 34 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 4 5 0 71 6 38 0 81 13 245 0 180 13 249 1 121] 
#[1 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 6 42 0 71 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 6 42 0 81 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 3 97 0 238 3 101 0 239 7 97 0 245 7 101 0 246 13 253 0 247 7 109 1 93 3 105 1 108 3 109 1 109 3 113 1 110 3 117 1 116 3 121 1 117 3 125 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 3 149 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[0 6 46 0 30] 
#[0 6 50 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 3 161 0 59 14 1 1 183] 
#[0 6 54 0 100] 
#[0 6 58 0 100] 
#[1 12 93 0 88 6 62 0 100 14 5 1 115] 
#[1 0 237 0 100 6 17 0 120 10 137 0 130 14 9 0 221] 
#[0 6 66 0 100] 
#[1 6 213 0 85 14 13 0 164] 
#[1 8 21 0 25 2 14 0 30 2 14 0 85 14 17 0 237 8 29 1 111] 
#[1 8 21 0 25 2 14 0 50 14 21 0 237 8 29 1 111] 
#[1 6 213 0 85 14 25 0 164] 
#[0 6 70 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 54 0 31 5 54 0 32 5 54 0 33 5 54 0 60 5 54 0 61 5 54 0 65 5 54 0 68 5 54 0 71 5 54 0 72 5 54 0 73 5 54 0 74 5 54 0 76 5 54 0 81 5 54 0 100 12 73 1 120 12 77 1 123] 
#[1 5 157 0 30 14 29 0 128] 
#[1 9 153 0 27 5 157 0 30 14 33 0 128] 
#[0 6 74 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 6 78 0 71 0 73 0 81 0 82] 
#[1 4 5 0 71 6 82 0 81 14 37 0 180 14 41 1 140] 
#[1 6 86 0 71 6 86 0 73 6 86 0 81 13 205 0 82 14 45 1 142 14 49 1 151 13 229 1 157] 
#[1 3 134 0 30 6 213 0 85 10 109 0 164 14 53 1 138] 
#[1 3 161 0 59 14 57 1 183] 
#[1 6 213 0 85 14 61 0 164] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 14 65 1 89 11 129 1 96] 
#[1 0 237 0 100 6 17 0 120 14 69 0 130] 
#[1 0 77 0 12 0 89 0 47 0 93 0 48 0 237 0 100 8 93 0 120 8 97 0 176 8 101 0 195 8 105 0 222 14 73 0 255 8 113 1 9 8 117 1 10 8 121 1 11 8 125 1 12] 
#[1 1 61 0 3 14 77 0 22 1 65 0 25 1 69 0 41 1 73 0 46 7 253 0 58 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 14 81 0 122 1 93 0 178 1 157 0 184 0 253 0 189 14 85 0 209 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 14 89 1 200 1 25 1 203 1 29 1 204] 
#[1 9 189 0 36 6 213 0 85 14 93 0 164] 
#[1 6 213 0 85 14 97 0 164] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 1 170 0 81 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 14 101 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 2 241 0 31 2 245 0 32 2 249 0 33 3 5 0 68 3 13 0 76 3 93 0 236 3 225 0 238 3 101 0 239 14 105 0 248 14 109 0 249 14 113 0 250 14 117 0 251 3 245 1 108 3 249 1 110 3 253 1 118 4 1 1 137 14 121 1 184] 
#[1 0 30 0 31 0 30 0 32 0 30 0 72 0 30 0 81 0 30 0 82 14 125 0 113 4 29 0 134 14 129 1 154] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 14 133 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[0 6 90 0 31 0 32 0 59 0 64 0 71 0 74 0 76 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 14 137 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 14 141 0 30] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 10 177 0 120 1 149 0 121 10 181 0 122 10 185 0 130 14 145 0 132 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 6 94 0 6 0 30 0 54 0 64 1 207] 
#[0 6 98 0 30 1 207] 
#[0 6 102 0 30 1 207] 
#[0 6 106 0 30 1 207] 
#[0 6 110 0 26 0 27] 
#[1 9 209 0 19 3 214 0 97 3 214 0 100 10 249 0 152 14 149 0 201 11 1 0 203] 
#[1 4 153 0 25 4 157 0 36 4 161 0 39 0 97 0 57 14 153 0 183 4 165 0 186] 
#[0 6 114 0 26 0 27] 
#[0 6 118 0 26 0 27] 
#[0 6 122 0 6 0 30 1 207] 
#[1 6 161 0 27 14 157 0 28] 
#[1 11 97 0 81 14 161 0 211] 
#[1 5 157 0 30 14 165 0 128] 
#[1 0 30 0 13 0 30 0 62 0 30 0 72 0 30 0 81 0 30 0 100 14 169 0 113 4 29 0 134 14 173 0 215] 
#[1 0 30 0 62 0 30 0 72 0 30 0 81 14 177 0 113 4 29 0 134] 
#[0 6 126 0 13 0 62 0 72 0 81 0 100] 
#[1 0 237 0 100 14 181 0 120 14 185 0 223] 
#[0 6 130 0 30 0 50 0 54 0 55 0 62 0 85 1 207] 
#[1 0 237 0 100 3 21 0 120 7 5 0 147 3 81 0 151 14 189 1 113] 
#[1 0 237 0 100 6 17 0 120 10 137 0 130 14 193 0 221] 
#[1 6 134 0 30 12 177 0 36 4 161 0 39 12 181 0 186 6 134 1 207] 
#[0 6 138 0 26 0 27] 
#[0 14 197 0 26] 
#[0 6 142 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[1 5 49 0 16 5 53 0 20 14 201 0 26 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 5 157 0 30 14 205 0 128] 
#[1 5 157 0 30 14 209 0 128] 
#[1 8 145 0 1 8 149 0 35 14 213 0 133] 
#[0 6 146 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 9 41 0 92 14 217 1 95] 
#[1 5 157 0 30 14 221 0 128] 
#[0 6 150 0 81] 
#[1 6 41 0 62 6 154 0 81 14 225 0 228 14 229 1 185] 
#[1 6 41 0 62 14 225 0 228 14 233 1 185] 
#[0 6 158 0 25 0 30 0 55] 
#[1 11 97 0 81 14 237 0 211] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 3 14 0 79 3 14 0 81 1 209 0 84 3 14 0 86 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 125 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 14 241 1 174 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 6 162 0 79 0 81 0 86] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 3 14 0 81 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 9 125 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 14 245 1 174 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 11 97 0 81 14 249 0 211] 
#[0 6 166 0 79 0 81 0 86] 
#[1 1 193 0 52 14 253 1 170] 
#[1 11 97 0 81 15 1 0 211] 
#[0 6 170 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 6 174 0 30 1 207] 
#[1 5 157 0 30 15 5 0 128] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 15 9 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 15 13 0 128] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 15 17 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 6 178 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 0 77 0 12 6 182 0 100 15 21 0 220 15 25 0 222] 
#[0 6 186 0 30 0 85] 
#[1 0 237 0 100 3 21 0 120 12 17 0 147 3 81 0 151 15 29 0 219] 
#[0 6 190 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 6 194 0 30] 
#[0 6 198 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 6 202 0 31 6 202 0 32 6 202 0 72 6 202 0 73 6 202 0 81 6 202 0 82 6 202 0 100 15 33 1 148 15 37 1 153] 
#[1 11 97 0 81 15 41 0 211] 
#[0 6 206 0 100] 
#[0 6 210 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[0 6 210 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[1 5 157 0 30 15 45 0 128] 
#[0 6 214 0 31 0 32 0 71 0 72 0 73 0 81 0 82] 
#[0 6 210 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[1 0 237 0 100 15 49 0 120] 
#[0 6 218 0 30] 
#[1 5 157 0 30 15 53 0 128] 
#[1 4 153 0 25 6 222 0 30 4 157 0 36 4 161 0 39 6 222 0 54 6 222 0 85 4 165 0 186] 
#[1 5 54 0 31 5 54 0 32 5 54 0 33 5 54 0 60 5 54 0 61 5 54 0 65 5 54 0 68 5 54 0 72 5 54 0 73 5 54 0 74 5 54 0 76 5 54 0 81 5 54 0 100 15 57 1 120 12 77 1 123] 
#[1 11 97 0 81 15 61 0 211] 
#[0 6 226 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100] 
#[1 5 157 0 30 15 65 0 128] 
#[0 6 230 0 100] 
#[1 5 153 0 6 5 254 0 26 5 254 0 30 12 177 0 36 4 161 0 39 15 69 0 150 13 157 0 156 12 181 0 186] 
#[1 0 73 0 4 0 77 0 12 0 81 0 21 2 145 0 24 2 149 0 25 0 89 0 47 0 93 0 48 0 97 0 57 0 101 0 67 0 10 0 71 0 10 0 93 0 105 0 94 0 109 0 95 15 73 0 125 2 161 0 155 2 165 0 161 2 169 0 162 2 173 0 163 2 177 0 169 2 181 0 171 2 185 0 176 2 189 0 178 2 193 0 182 2 197 0 183 2 201 0 191 2 205 0 195 0 189 0 196 0 193 0 197 0 197 0 198 2 209 0 207 0 205 0 213 0 209 0 222 2 213 1 193] 
#[1 6 234 0 30 6 213 0 85 15 77 0 164 15 81 1 192] 
#[1 1 189 0 50 15 85 0 240] 
#[1 0 105 0 94 15 89 0 178] 
#[0 6 238 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 6 242 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 0 30 0 72 0 30 0 73 0 30 0 81 0 30 0 82 12 149 0 113 4 29 0 134 15 93 1 139 12 157 1 141] 
#[1 11 97 0 81 15 97 0 211] 
#[1 6 246 0 71 5 233 0 73 6 246 0 81 15 101 0 246 7 109 1 93 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 0 30 0 71 0 30 0 72 0 30 0 73 0 30 0 81 0 30 0 82 15 105 0 113 4 29 0 134] 
#[0 6 250 0 30] 
#[1 5 157 0 30 15 109 0 128] 
#[1 0 30 0 31 0 30 0 32 3 161 0 59 0 30 0 72 0 30 0 81 0 30 0 82 14 125 0 113 4 29 0 134 14 129 1 154 13 237 1 183] 
#[1 5 157 0 30 15 113 0 128] 
#[0 6 254 0 6 0 22 0 26 0 30 0 36 0 39 0 61 1 207] 
#[0 7 2 0 6 0 22 0 26 0 30 0 36 0 39 0 61 1 207] 
#[0 7 6 0 3 0 25 0 41 0 46 0 90 0 91 0 94 0 95 0 96 0 97 0 98 0 99 0 100] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 15 117 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 14 77 0 22 7 10 0 81 7 10 0 100 15 121 1 198 15 125 1 200] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 15 129 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 3 161 0 59 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 1 170 0 81 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 14 101 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 14 1 1 183 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 3 161 0 59 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 14 133 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 14 57 1 183 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 9 73 0 17 7 14 0 81 15 133 1 98 9 81 1 100 15 137 1 125] 
#[0 7 18 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 18 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 18 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 18 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 22 0 31 0 32 0 59 0 64 0 71 0 72 0 74 0 76 1 207] 
#[0 7 26 0 31 0 32 0 81 0 82] 
#[1 2 241 0 31 2 245 0 32 11 97 0 81 13 205 0 82 15 141 0 211 3 93 0 236 3 101 0 239 15 145 0 248 15 149 1 108 3 249 1 110 15 153 1 155 15 157 1 156 15 161 1 157] 
#[1 9 73 0 17 15 165 1 98 9 81 1 100] 
#[1 5 49 0 16 5 53 0 20 7 30 0 26 7 30 0 27 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 7 34 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 31 0 32 0 33 0 49 0 50 0 52 0 56 0 59 0 60 0 61 0 62 0 63 0 64 0 65 0 68 0 70 0 71 0 72 0 73 0 74 0 75 0 76 0 77 0 78 0 79 0 80 0 81 0 82 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 7 38 0 26 0 27] 
#[0 7 42 0 6 0 30 1 207] 
#[1 2 145 0 24 12 245 0 162 2 173 0 163] 
#[1 9 209 0 19 3 214 0 97 3 214 0 100 10 249 0 152 15 169 0 201 11 1 0 203] 
#[1 7 253 0 58 15 173 0 209] 
#[1 0 30 0 62 0 30 0 72 0 30 0 81 15 177 0 113 4 29 0 134] 
#[1 1 173 0 13 7 46 0 62 7 46 0 81 0 237 0 100 3 21 0 120 13 13 0 147 3 81 0 151 15 181 0 216 15 185 0 217 13 37 0 224] 
#[0 7 50 0 62 0 81] 
#[0 7 54 0 62 0 81] 
#[0 7 58 0 85] 
#[1 6 213 0 85 15 189 0 164] 
#[0 7 62 0 26 0 30] 
#[1 7 66 0 30 12 177 0 36 4 161 0 39 12 181 0 186 7 66 1 207] 
#[0 7 70 0 1 0 5 0 6 0 7 0 8 0 9 0 16 0 20 0 26 0 27 0 30 0 35 0 37 0 38 0 40 0 41 0 42 0 43 0 44 0 45 0 46 0 47 0 53 0 54 0 57 0 64 0 70 0 83 0 85 0 86 0 91 0 92 0 95 1 207] 
#[0 7 74 0 1 0 6 0 16 0 20 0 26 0 27 0 30 0 35 0 47 0 54 0 57 0 64 0 70 0 85 0 86 0 92 1 207] 
#[0 7 78 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 7 82 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 15 193 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 7 86 0 30 0 97 0 100] 
#[0 7 90 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 4 169 0 87 0 225 0 97 0 237 0 100 1 33 0 119 15 197 0 120 15 201 0 121 15 205 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 15 209 1 186 15 213 1 187] 
#[0 7 94 0 62 0 81] 
#[0 7 98 0 62 0 81] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 15 217 1 89 11 129 1 96] 
#[0 4 214 0 79 0 81 0 86] 
#[1 11 97 0 81 15 221 0 211] 
#[1 1 193 0 52 15 225 1 170] 
#[1 5 157 0 30 15 229 0 128] 
#[1 1 193 0 52 15 233 1 170] 
#[0 7 102 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 49 0 16 5 53 0 20 7 106 0 26 7 106 0 30 5 57 0 86 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 7 110 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 7 114 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 0 237 0 100 6 17 0 120 10 137 0 130 15 237 0 221] 
#[0 7 118 0 100] 
#[0 7 122 0 26 0 30] 
#[0 7 126 0 81] 
#[1 2 241 0 31 2 245 0 32 0 53 0 72 5 233 0 73 7 130 0 81 13 205 0 82 0 237 0 100 13 209 0 112 3 21 0 120 0 69 0 129 13 13 0 147 3 81 0 151 15 241 0 217 3 93 0 236 3 101 0 239 13 213 0 246 7 109 1 93 13 217 1 108 15 245 1 149 13 225 1 151 15 249 1 152 13 229 1 157 7 121 1 195 7 125 1 196 7 129 1 197] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 15 253 1 89 11 129 1 96] 
#[0 7 134 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[1 16 1 0 25 2 14 0 30 16 5 0 237 8 29 1 111] 
#[0 7 138 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 7 142 0 81] 
#[1 7 146 0 30 0 237 0 100 6 17 0 120 6 141 0 130 16 9 1 0 16 13 1 122] 
#[0 7 150 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 7 154 0 26 0 30] 
#[1 5 157 0 30 16 17 0 128] 
#[1 2 145 0 24 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 16 21 0 121 16 25 0 162 2 173 0 163 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 5 157 0 30 16 29 0 128] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 16 33 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[1 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 16 37 0 121 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2] 
#[0 7 158 0 81] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 16 41 1 89 11 129 1 96] 
#[1 0 30 0 71 0 30 0 72 0 30 0 73 0 30 0 81 16 45 0 113 4 29 0 134] 
#[0 7 162 0 71 0 73 0 81 0 82] 
#[0 7 166 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[0 7 170 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100 1 207] 
#[0 7 174 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[1 7 178 0 81 7 178 0 100 16 49 1 199] 
#[1 0 109 0 95 16 53 0 191] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 16 57 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 7 182 0 81] 
#[1 11 97 0 81 16 61 0 211] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 16 65 1 89 11 129 1 96] 
#[0 7 186 0 31 0 32 0 72 0 81 0 82] 
#[1 5 157 0 30 6 213 0 85 16 69 0 128 7 145 0 164] 
#[1 0 30 0 31 0 30 0 32 0 30 0 72 0 30 0 81 0 30 0 82 16 73 0 113 4 29 0 134] 
#[0 7 186 0 31 0 32 0 72 0 81 0 82] 
#[1 0 237 0 100 16 77 0 120] 
#[1 11 97 0 81 16 81 0 211] 
#[1 5 153 0 6 5 254 0 30 16 85 0 150 13 157 0 156] 
#[0 7 190 0 30 1 207] 
#[0 7 194 0 62 0 81] 
#[1 0 30 0 62 0 30 0 72 0 30 0 81 16 89 0 113 4 29 0 134] 
#[0 7 198 0 13 0 62 0 72 0 81 0 100] 
#[1 0 30 0 62 0 30 0 72 0 30 0 81 16 93 0 113 4 29 0 134] 
#[0 7 202 0 62 0 81] 
#[1 0 158 0 1 0 158 0 25 16 97 0 28 0 158 0 35 0 158 0 36 0 158 0 39] 
#[1 7 206 0 1 4 153 0 25 7 206 0 35 4 157 0 36 4 161 0 39 4 165 0 186] 
#[0 7 210 0 1 0 35] 
#[1 8 145 0 1 16 101 0 35 16 105 0 133] 
#[0 7 214 0 1 0 35] 
#[1 5 157 0 30 16 109 0 128] 
#[1 1 193 0 52 16 113 1 170] 
#[1 5 157 0 30 16 117 0 128] 
#[0 7 218 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 5 157 0 30 16 121 0 128] 
#[1 5 153 0 6 5 254 0 26 5 254 0 30 12 177 0 36 4 161 0 39 16 125 0 150 13 157 0 156 12 181 0 186] 
#[0 7 222 0 31 0 32 0 72 0 73 0 81 0 82 0 100] 
#[0 7 222 0 31 0 32 0 72 0 73 0 81 0 82 0 100] 
#[0 7 226 0 31 0 32 0 72 0 73 0 81 0 82 0 100] 
#[0 7 230 0 30] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 11 169 0 120 11 137 0 121 7 225 0 124 7 5 0 147 3 81 0 151 1 93 0 178 1 97 0 184 0 253 0 189 16 129 0 206 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 11 13 1 112 11 17 1 113 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 16 133 0 128] 
#[1 7 234 0 30 9 189 0 36] 
#[0 7 238 0 30] 
#[0 7 242 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[1 4 153 0 25 7 246 0 30 4 157 0 36 4 161 0 39 4 165 0 186] 
#[0 7 250 0 30] 
#[0 7 254 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[1 4 153 0 25 6 234 0 30 4 157 0 36 4 161 0 39 6 213 0 85 15 77 0 164 4 165 0 186 16 137 1 192] 
#[1 16 141 0 25 5 157 0 30 4 157 0 36 4 161 0 39 16 145 0 128 16 149 0 161 4 165 0 186] 
#[0 8 2 0 30] 
#[0 8 6 0 71 0 73 0 81] 
#[1 11 97 0 81 0 237 0 100 6 17 0 120 10 137 0 130 16 153 0 211 16 157 0 221] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 16 161 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 8 10 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[1 7 146 0 30 0 237 0 100 6 17 0 120 6 141 0 130 16 9 1 0 16 165 1 122] 
#[1 5 157 0 30 16 169 0 128] 
#[0 8 14 0 31 0 32 0 72 0 81 0 82] 
#[0 8 18 0 31 0 32 0 81 0 82] 
#[1 16 173 0 25 2 14 0 62 16 177 0 237 8 29 1 111 16 181 1 159] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 16 185 1 89 11 129 1 96] 
#[1 5 157 0 30 16 189 0 128] 
#[0 8 22 0 62 0 81] 
#[1 8 26 0 62 8 26 0 81 16 193 0 225 16 197 0 227] 
#[1 4 169 0 87 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 15 201 0 121 15 205 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 16 201 1 186 15 213 1 187] 
#[1 4 169 0 87 0 225 0 97 0 237 0 100 1 33 0 119 1 37 0 120 15 201 0 121 15 205 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 16 205 1 187] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 16 209 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[0 8 30 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 5 157 0 30 16 213 0 128] 
#[0 8 34 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 8 38 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[0 8 42 0 26 0 30] 
#[0 16 217 0 26] 
#[0 8 46 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[1 5 157 0 30 16 221 0 128] 
#[1 1 61 0 3 2 145 0 24 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 8 49 0 122 4 181 0 124 6 101 0 162 2 173 0 163 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 4 193 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 8 53 1 4 8 57 1 5 8 61 1 6 8 65 1 7 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 8 69 1 206] 
#[0 8 50 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[1 5 157 0 30 16 225 0 128] 
#[1 7 253 0 58 16 229 0 209] 
#[1 14 77 0 22 12 177 0 36 4 161 0 39 12 181 0 186 16 233 1 200] 
#[1 5 49 0 16 5 53 0 20 5 157 0 30 5 57 0 86 16 237 0 128 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[1 5 157 0 30 16 241 0 128] 
#[0 8 54 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 5 233 0 73 0 237 0 100 3 21 0 120 7 5 0 147 3 81 0 151 16 245 1 91 5 249 1 93 11 13 1 112 11 17 1 113] 
#[1 6 41 0 62 16 249 0 228] 
#[1 8 21 0 25 2 14 0 62 16 253 0 237 8 29 1 111] 
#[1 5 157 0 30 17 1 0 128] 
#[0 8 58 0 13 0 31 0 32 0 62 0 72 0 73 0 81 0 82 0 100] 
#[1 11 97 0 81 17 5 0 211] 
#[1 6 41 0 62 8 62 0 81 17 9 0 226 17 13 0 228] 
#[1 8 145 0 1 16 101 0 35 17 17 0 133] 
#[0 8 66 0 1 0 35] 
#[0 8 70 0 62 0 81] 
#[0 8 74 0 2 0 11 0 13 0 14 0 15 0 17 0 23 0 49 0 50 0 52 0 56 0 62 0 63 0 70 0 72 0 73 0 75 0 77 0 78 0 79 0 80 0 81 0 84 0 86 0 90 0 92 0 97 0 100 1 207] 
#[1 8 21 0 25 2 14 0 30 17 21 0 237 8 29 1 111] 
#[0 8 78 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[0 8 82 0 31 0 32 0 61 0 64 0 65 0 76 0 100] 
#[1 5 157 0 30 17 25 0 128] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 17 29 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 8 86 0 81 0 100] 
#[0 8 90 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 11 137 0 121 7 225 0 124 1 93 0 178 1 97 0 184 0 253 0 189 17 33 0 206 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 17 37 1 81 1 25 1 203 1 29 1 204] 
#[1 6 41 0 62 17 41 0 228] 
#[0 8 94 0 17 0 31 0 32 0 33 0 59 0 60 0 61 0 64 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 100 1 207] 
#[1 1 173 0 13 17 45 0 224] 
#[0 8 98 0 62 0 81] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 4 169 0 87 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 4 173 0 121 11 53 0 122 4 181 0 124 1 93 0 178 4 185 0 184 0 253 0 189 1 1 0 212 17 49 0 229 4 197 0 230 4 201 0 232 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204 11 61 1 206] 
#[1 1 165 0 2 1 169 0 11 1 173 0 13 0 14 0 14 1 177 0 15 0 14 0 17 1 181 0 23 1 185 0 49 1 189 0 50 1 193 0 52 1 197 0 56 0 14 0 63 0 53 0 72 0 14 0 73 1 201 0 75 1 205 0 78 1 209 0 84 0 217 0 90 0 14 0 92 0 225 0 97 0 237 0 100 1 217 0 112 1 33 0 119 1 221 0 120 1 225 0 121 9 17 0 123 0 69 0 129 1 233 0 212 1 237 0 224 1 241 0 240 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 245 1 47 9 21 1 49 17 53 1 50 1 249 1 51 1 253 1 52 2 1 1 53 2 5 1 54 2 9 1 55 2 13 1 56 2 17 1 57 2 21 1 58 2 25 1 59 2 29 1 60 2 33 1 61 2 37 1 62 2 41 1 63 2 45 1 64 2 49 1 65 2 53 1 66 2 57 1 67 2 61 1 68 2 65 1 69 2 69 1 70 2 73 1 71 2 77 1 72 2 81 1 73 2 85 1 75 2 89 1 82 2 93 1 86 2 97 1 104 2 101 1 107 2 105 1 161 2 109 1 164 2 113 1 166 2 117 1 167 2 121 1 168 2 125 1 169 2 129 1 170 2 133 1 177 2 137 1 188 2 141 1 189] 
#[1 5 157 0 30 17 57 0 128] 
#[0 8 102 0 17 0 31 0 32 0 33 0 60 0 61 0 65 0 68 0 71 0 72 0 73 0 74 0 76 0 81 0 82 0 100] 
#[1 5 49 0 16 5 53 0 20 0 97 0 57 5 57 0 86 17 61 0 183 5 61 1 20 5 65 1 21 5 69 1 22 5 73 1 23 5 77 1 24 5 81 1 25 5 85 1 26 5 89 1 27] 
#[0 17 65 0 26] 
#[1 5 157 0 30 6 213 0 85 17 69 0 128 17 73 0 164 17 77 1 158] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 149 0 121 5 201 0 122 1 93 0 178 1 157 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 161 1 19 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 17 81 1 81 1 25 1 203 1 29 1 204] 
#[1 5 157 0 30 17 85 0 128] 
#[1 8 145 0 1 8 149 0 35 17 89 0 133] 
#[0 8 106 0 62 0 81] 
#[0 8 110 0 31 0 32 0 71 0 72 0 73 0 81 0 82 0 100] 
#[1 1 61 0 3 1 65 0 25 1 69 0 41 1 73 0 46 0 217 0 90 1 77 0 91 0 105 0 94 0 221 0 96 0 225 0 97 0 229 0 98 0 233 0 99 0 237 0 100 1 81 0 118 1 33 0 119 1 37 0 120 1 85 0 121 17 93 0 124 1 93 0 178 1 97 0 184 0 253 0 189 1 1 0 212 1 49 0 252 1 53 0 253 1 57 0 254 1 5 1 2 1 13 1 13 1 17 1 14 1 21 1 15 1 101 1 17 1 105 1 36 1 109 1 37 1 113 1 38 1 117 1 40 1 121 1 43 1 125 1 44 1 129 1 46 1 133 1 47 1 137 1 48 1 25 1 203 1 29 1 204] 
#[0 8 114 0 25 0 62] 
#[0 8 118 0 31 0 32 0 72 0 81 0 82] 
#[1 1 170 0 17 2 241 0 31 2 245 0 32 2 249 0 33 2 253 0 60 7 1 0 61 3 1 0 65 3 5 0 68 0 53 0 72 5 233 0 73 3 9 0 74 3 13 0 76 0 237 0 100 7 69 0 112 3 21 0 120 7 73 0 126 7 77 0 127 0 69 0 129 3 29 0 135 3 33 0 136 3 37 0 137 3 41 0 138 3 45 0 139 3 49 0 140 3 53 0 141 3 57 0 142 3 61 0 143 3 65 0 144 3 69 0 145 3 73 0 146 3 77 0 147 3 81 0 151 3 85 0 157 3 89 0 172 3 93 0 236 7 81 0 238 3 101 0 239 7 85 0 242 7 89 0 243 17 97 0 244 7 97 0 245 7 101 0 246 7 105 0 247 3 229 0 248 3 233 0 249 3 237 0 250 3 241 0 251 7 109 1 93 3 105 1 108 3 109 1 109 3 197 1 110 3 117 1 116 3 121 1 117 7 113 1 118 7 37 1 127 3 129 1 129 3 133 1 130 3 137 1 131 3 141 1 134 3 145 1 136 7 117 1 137 3 153 1 143 3 157 1 190 7 121 1 195 7 125 1 196 7 129 1 197] 
#[0 8 122 0 31 0 32 0 72 0 81 0 82] 
#[1 5 157 0 30 6 213 0 85 17 69 0 128 17 73 0 164 17 101 1 158] 
#[0 8 126 0 62 0 72 0 81] 
#[1 0 30 0 13 0 30 0 72 0 30 0 90 0 30 0 100 17 105 0 113 4 29 0 134] 
#[1 5 157 0 30 17 109 0 128] 
#[1 9 73 0 17 17 113 1 98 9 81 1 100] 
#[0 8 130 0 31 0 32 0 72 0 81 0 82] 
#[1 1 173 0 13 0 217 0 90 0 237 0 100 3 21 0 120 13 13 0 147 3 81 0 151 17 117 0 210 13 21 0 212 13 25 0 214 13 29 0 216 13 33 0 217 13 37 0 224] 
#[0 8 134 0 81 0 100] 
#[1 11 97 0 81 17 121 0 211] 
#[0 8 138 0 62 0 81] 
#[1 4 170 0 30 6 197 0 97 0 237 0 100 6 17 0 120 6 141 0 130 6 201 1 0 17 125 1 89 11 129 1 96] 
#[1 5 157 0 30 17 129 0 128] 
#[0 8 142 0 31 0 32 0 72 0 81 0 82]
	).

]

{ #category : #'as yet unclassified' }
Ada95Parser >> withEndToken: endToken return: aNode [
	"similar to withStartToken:endToken:return:  but we know we already have the start"
	aNode isCollection
		 ifFalse: [
			aNode endPosition: endToken endPosition].
	^ aNode
]

{ #category : #'as yet unclassified' }
Ada95Parser >> withStartToken: startToken endToken: endToken optionalEndToken: optEndToken return: aNode [
	"set's the startPosition/endPosition of all node in the AST, then returns the node"
	aNode isCollection "can be an Array, ignore it in this case"
		 ifFalse: [
			aNode startPosition: startToken startPosition.
			aNode endPosition: (endToken endPosition ifNil: [ optEndToken endPosition ])
		].
	^ aNode
]

{ #category : #'as yet unclassified' }
Ada95Parser >> withStartToken: startToken endToken: endToken return: aNode [
	"set's the startPosition/endPosition of all node in the AST, then returns the node"
	aNode isCollection "can be an Array, ignore it in this case"
		 ifFalse: [
			aNode startPosition: startToken startPosition.
			aNode endPosition: endToken endPosition].
	^ aNode
]

{ #category : #'as yet unclassified' }
Ada95Parser >> withStartToken: startToken return: aNode [
	"similar to withStartToken:endToken:return:  but we know we don't care about the end"
	aNode isCollection
		 ifFalse: [
			aNode startPosition: startToken startPosition].
	^ aNode
]

{ #category : #'as yet unclassified' }
Ada95Parser >> withToken: aToken return: aNode [
	"set's the startPosition of all node in the AST, then returns the node"
	aNode isCollection "can be an Array, ignore it in this case"
		ifFalse: [aNode startPosition: aToken startPosition].
	^ aNode
]
