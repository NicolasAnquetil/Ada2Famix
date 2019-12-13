Class {
	#name : #LewisInlineTestResource,
	#superclass : #PtsInlineTestResource,
	#category : #'Lewis-Namespace'
}

{ #category : #platypus }
LewisInlineTestResource class >> namespace [
	<generatedByPlatypus>
	^ Lewis singleton
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAbs1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAbsExpression(#3, .F., #2);
#2=LwsDecimalLiteral(#1, .F., ''10'');
#3=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAbs2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAbsExpression(#4, .F., #3);
#2=LwsDecimalLiteral(#3, .F., ''10'');
#3=LwsNegativeExpression(#1, .T., #2);
#4=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAcceptStatement(#2, (), #3, (), (), ());
#2=LwsParsingResult($, (#1), $);
#3=LwsQualifiedIdentifier(#1, .F., ''SEIZE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#7), $);
#2=LwsAssignment(#7, (), #3, #5);
#3=LwsQualifiedIdentifier(#2, .F., ''V'', ());
#4=LwsQualifiedIdentifier(#7, .F., ''READ'', ());
#5=LwsQualifiedIdentifier(#2, .F., ''LOCAL_ITEM'', ());
#6=LwsQualifiedIdentifier(#8, .F., ''ITEM'', ());
#7=LwsAcceptStatement(#1, (), #4, (#8), (#2), ());
#8=LwsFormalParameter(#7, (''V''), .outputMode., #6, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryNameArgument(#9, #7);
#2=LwsQualifiedIdentifier(#8, .F., ''ITEM'', ());
#3=LwsAssignment(#10, (), #5, #4);
#4=LwsQualifiedIdentifier(#3, .F., ''LOCAL_ITEM'', ());
#5=LwsQualifiedIdentifier(#3, .F., ''V'', ());
#6=LwsParsingResult($, (#10), $);
#7=LwsQualifiedIdentifier(#1, .F., ''LOW'', ());
#8=LwsFormalParameter(#10, (''D''), $, #2, $);
#9=LwsQualifiedIdentifier(#10, .F., ''REQUEST'', (#1));
#10=LwsAcceptStatement(#6, (), #9, (#8), (#3), ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''Customer'', ());
#2=LwsProcedureCall(#26, (), #16);
#3=LwsDecimalLiteral(#33, .F., ''0.1'');
#4=LwsProcedureCall(#26, (), #8);
#5=LwsArgumentsSelector(#28, #6);
#6=LwsAggregate(#5, .F., (#19));
#7=LwsAggregate(#10, .F., (#1));
#8=LwsQualifiedIdentifier(#4, .F., ''Put'', (#12));
#9=LwsQualifiedIdentifier(#33, .F., ''HOURS'', ());
#10=LwsArgumentsSelector(#16, #7);
#11=LwsQualifiedIdentifier(#26, .F., ''Eat_A_Meal'', ());
#12=LwsArgumentsSelector(#8, #14);
#13=LwsFormalParameter(#26, (''Customer''), $, #18, $);
#14=LwsAggregate(#12, .F., (#15));
#15=LwsQualifiedIdentifier(#14, .F., ''Customer'', ());
#16=LwsQualifiedIdentifier(#2, .F., ''Put'', (#10));
#17=LwsProcedureCall(#26, (), #28);
#18=LwsQualifiedIdentifier(#13, .F., ''PERSON'', ());
#19=LwsStringLiteral(#6, .F., '' is eating at the Burger Boy'');
#20=LwsMultExpression(#27, .F., #29, #30);
#21=LwsAggregate(#22, .F., (#25));
#22=LwsArgumentsSelector(#31, #21);
#23=LwsParsingResult($, (#26), $);
#24=LwsDelayStatement(#26, (), #33);
#25=LwsStringLiteral(#21, .F., '' is ordering at the Burger Boy'');
#26=LwsAcceptStatement(#23, (), #11, (#13), (#4, #32, #24, #2, #17, #27), ());
#27=LwsDelayStatement(#26, (), #20);
#28=LwsQualifiedIdentifier(#17, .F., ''Put_Line'', (#5));
#29=LwsDecimalLiteral(#20, .F., ''0.1'');
#30=LwsQualifiedIdentifier(#20, .F., ''HOURS'', ());
#31=LwsQualifiedIdentifier(#32, .F., ''Put_Line'', (#22));
#32=LwsProcedureCall(#26, (), #31);
#33=LwsMultExpression(#24, .F., #3, #9);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#9, #23);
#2=LwsMultExpression(#15, .F., #17, #7);
#3=LwsProcedureCall(#10, (), #6);
#4=LwsProcedureCall(#10, (), #9);
#5=LwsRaiseStatement(#24, (), #19);
#6=LwsQualifiedIdentifier(#3, .F., ''Put'', (#26));
#7=LwsQualifiedIdentifier(#2, .F., ''HOURS'', ());
#8=LwsNamedExceptionChoice(#24, #18);
#9=LwsQualifiedIdentifier(#4, .F., ''Put_Line'', (#1));
#10=LwsAcceptStatement(#20, (), #11, (#21), (#3, #4, #15), (#24));
#11=LwsQualifiedIdentifier(#10, .F., ''Eat_A_Meal'', ());
#12=LwsQualifiedIdentifier(#22, .F., ''Customer'', ());
#13=LwsStringLiteral(#23, .F., '' is ordering at the Burger Boy'');
#14=LwsNamedExceptionChoice(#24, #25);
#15=LwsDelayStatement(#10, (), #2);
#16=LwsQualifiedIdentifier(#21, .F., ''PERSON'', ());
#17=LwsDecimalLiteral(#2, .F., ''0.1'');
#18=LwsQualifiedIdentifier(#8, .F., ''IOError'', ());
#19=LwsQualifiedIdentifier(#5, .F., ''ERROR'', ());
#20=LwsParsingResult($, (#10), $);
#21=LwsFormalParameter(#10, (''Customer''), $, #16, $);
#22=LwsAggregate(#26, .F., (#12));
#23=LwsAggregate(#1, .F., (#13));
#24=LwsExceptionHandler(#10, $, (#8, #14), (#5));
#25=LwsQualifiedIdentifier(#14, .F., ''NETError'', ());
#26=LwsArgumentsSelector(#6, #22);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept51 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#22, .F., '' is ordering at the Burger Boy'');
#2=LwsExceptionHandler(#12, $, (#9, #7), (#26));
#3=LwsDecimalLiteral(#16, .F., ''0.1'');
#4=LwsQualifiedIdentifier(#23, .F., ''Customer'', ());
#5=LwsQualifiedIdentifier(#15, .F., ''Put_Line'', (#24));
#6=LwsDelayStatement(#12, (), #16);
#7=LwsNamedExceptionChoice(#2, #20);
#8=LwsQualifiedIdentifier(#26, .F., ''ERROR'', ());
#9=LwsNamedExceptionChoice(#2, #21);
#10=LwsQualifiedIdentifier(#16, .F., ''HOURS'', ());
#11=LwsQualifiedIdentifier(#18, .F., ''PERSON'', ());
#12=LwsAcceptStatement(#17, (), #14, (#18), (#13, #15, #6), (#2));
#13=LwsProcedureCall(#12, (), #19);
#14=LwsQualifiedIdentifier(#12, .F., ''Eat_A_Meal'', ());
#15=LwsProcedureCall(#12, (), #5);
#16=LwsMultExpression(#6, .F., #3, #10);
#17=LwsParsingResult($, (#12), $);
#18=LwsFormalParameter(#12, (''Customer''), $, #11, $);
#19=LwsQualifiedIdentifier(#13, .F., ''Put'', (#25));
#20=LwsQualifiedIdentifier(#7, .F., ''NETError'', ());
#21=LwsQualifiedIdentifier(#9, .F., ''IOError'', ());
#22=LwsAggregate(#24, .F., (#1));
#23=LwsAggregate(#25, .F., (#4));
#24=LwsArgumentsSelector(#5, #22);
#25=LwsArgumentsSelector(#19, #23);
#26=LwsRaiseStatement(#2, (), #8);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccept6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExceptionHandler(#4, $, (#21, #16), (#7));
#2=LwsDelayStatement(#4, (), #27);
#3=LwsFormalParameter(#4, (''Customer''), $, #22, $);
#4=LwsAcceptStatement(#13, (), #12, (#3), (#17, #30, #2), (#1, #15));
#5=LwsAggregate(#19, .F., (#8));
#6=LwsQualifiedIdentifier(#30, .F., ''Put_Line'', (#25));
#7=LwsRaiseStatement(#1, (), #9);
#8=LwsQualifiedIdentifier(#5, .F., ''Customer'', ());
#9=LwsQualifiedIdentifier(#7, .F., ''ERROR'', ());
#10=LwsQualifiedIdentifier(#29, .F., ''FATAL_ERROR'', ());
#11=LwsAggregate(#25, .F., (#26));
#12=LwsQualifiedIdentifier(#4, .F., ''Eat_A_Meal'', ());
#13=LwsParsingResult($, (#4), $);
#14=LwsQualifiedIdentifier(#16, .F., ''NETError'', ());
#15=LwsExceptionHandler(#4, $, (#23), (#29));
#16=LwsNamedExceptionChoice(#1, #14);
#17=LwsProcedureCall(#4, (), #24);
#18=LwsDecimalLiteral(#27, .F., ''0.1'');
#19=LwsArgumentsSelector(#24, #5);
#20=LwsQualifiedIdentifier(#21, .F., ''IOError'', ());
#21=LwsNamedExceptionChoice(#1, #20);
#22=LwsQualifiedIdentifier(#3, .F., ''PERSON'', ());
#23=LwsOthersExceptionChoice(#15);
#24=LwsQualifiedIdentifier(#17, .F., ''Put'', (#19));
#25=LwsArgumentsSelector(#6, #11);
#26=LwsStringLiteral(#11, .F., '' is ordering at the Burger Boy'');
#27=LwsMultExpression(#2, .F., #18, #28);
#28=LwsQualifiedIdentifier(#27, .F., ''HOURS'', ());
#29=LwsRaiseStatement(#15, (), #10);
#30=LwsProcedureCall(#4, (), #6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''Truc'', ());
#2=LwsParsingResult($, (#4), $);
#3=LwsSubtypeIndication(#4, #1, $);
#4=LwsAccessToObject(#2, $, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedAttribute(#5, ''Class'');
#2=LwsAccessToObject(#4, .allAccessMode., #3);
#3=LwsSubtypeIndication(#2, #5, $);
#4=LwsParsingResult($, (#2), $);
#5=LwsQualifiedIdentifier(#3, .F., ''Generic_Expression'', (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAccessToObject(#1, .constantAccessMode., #3);
#3=LwsSubtypeIndication(#2, #5, $);
#4=LwsNamedAttribute(#5, ''Class'');
#5=LwsQualifiedIdentifier(#3, .F., ''Generic_Expression'', (#4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAccessToSubprogram(#4, $, (#2, #3), $);
#2=LwsFormalParameter(#1, (''Id''), $, #6, $);
#3=LwsFormalParameter(#1, (''Text''), $, #5, $);
#4=LwsParsingResult($, (#1), $);
#5=LwsQualifiedIdentifier(#3, .F., ''String'', ());
#6=LwsQualifiedIdentifier(#2, .F., ''Integer'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsQualifiedIdentifier(#3, .F., ''Some_Type'', ());
#3=LwsAccessToSubprogram(#1, $, (), #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAccessToSubprogram(#1, $, (), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAccessType8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAccessToSubprogram(#5, $, (#3), #2);
#2=LwsQualifiedIdentifier(#1, .F., ''Some_Type'', ());
#3=LwsFormalParameter(#1, (''Id''), $, #4, $);
#4=LwsQualifiedIdentifier(#3, .F., ''Integer'', ());
#5=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#3, .F., (#4, #5, #2));
#2=LwsDecimalLiteral(#1, .F., ''1776'');
#3=LwsParsingResult($, (#1), $);
#4=LwsDecimalLiteral(#1, .F., ''4'');
#5=LwsQualifiedIdentifier(#1, .F., ''JULY'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#5), $);
#2=LwsDecimalLiteral(#5, .F., ''4'');
#3=LwsDecimalLiteral(#5, .F., ''7'');
#4=LwsDecimalLiteral(#5, .F., ''1'');
#5=LwsAggregate(#1, .T., (#3, #9, #6, #4, #7, #8, #2, #10, #11, #12));
#6=LwsDecimalLiteral(#5, .F., ''5'');
#7=LwsDecimalLiteral(#5, .F., ''3'');
#8=LwsDecimalLiteral(#5, .F., ''2'');
#9=LwsDecimalLiteral(#5, .F., ''9'');
#10=LwsDecimalLiteral(#5, .F., ''8'');
#11=LwsDecimalLiteral(#5, .F., ''6'');
#12=LwsDecimalLiteral(#5, .F., ''0'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#11, .F., ''0'');
#2=LwsDecimalLiteral(#8, .F., ''4'');
#3=LwsDecimalLiteral(#8, .F., ''8'');
#4=LwsDecimalLiteral(#8, .F., ''1'');
#5=LwsQualifiedIdentifier(#6, .F., ''TABLE'', (#7));
#6=LwsParsingResult($, (#5), $);
#7=LwsPrimaryQualifier(#5, #8);
#8=LwsAggregate(#7, .F., (#9, #3, #2, #4, #11));
#9=LwsDecimalLiteral(#8, .F., ''5'');
#10=LwsOtherChoice(#11);
#11=LwsComponentAssociation(#8, #1, (#10));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate12 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAssociation(#4, #13, (#12));
#2=LwsDecimalLiteral(#7, .F., ''1'');
#3=LwsRangeChoice(#9, #7);
#4=LwsAggregate(#5, .F., (#1));
#5=LwsParsingResult($, (#4), $);
#6=LwsDecimalLiteral(#10, .F., ''1'');
#7=LwsExplicitRange(#3, .F., #2, #8);
#8=LwsDecimalLiteral(#7, .F., ''8'');
#9=LwsComponentAssociation(#13, #11, (#3));
#10=LwsExplicitRange(#12, .F., #6, #14);
#11=LwsDecimalLiteral(#9, .F., ''0.0'');
#12=LwsRangeChoice(#1, #10);
#13=LwsAggregate(#1, .F., (#9));
#14=LwsDecimalLiteral(#10, .F., ''5'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate13 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#15, .F., ''1'');
#2=LwsAggregate(#7, .F., (#15, #4));
#3=LwsExpressionChoice(#15, #8);
#4=LwsComponentAssociation(#2, #5, (#11));
#5=LwsDecimalLiteral(#4, .F., ''0'');
#6=LwsExpressionChoice(#15, #9);
#7=LwsPrimaryQualifier(#12, #2);
#8=LwsDecimalLiteral(#3, .F., ''10'');
#9=LwsDecimalLiteral(#6, .F., ''4'');
#10=LwsExpressionChoice(#15, #14);
#11=LwsOtherChoice(#4);
#12=LwsQualifiedIdentifier(#13, .F., ''TABLE'', (#7));
#13=LwsParsingResult($, (#12), $);
#14=LwsDecimalLiteral(#10, .F., ''2'');
#15=LwsComponentAssociation(#2, #1, (#10, #6, #3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate14 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExplicitRange(#9, .F., #8, #10);
#2=LwsQualifiedIdentifier(#4, .F., ''TRUE'', ());
#3=LwsQualifiedIdentifier(#12, .F., ''SCHEDULE'', (#13));
#4=LwsComponentAssociation(#7, #2, (#9));
#5=LwsQualifiedIdentifier(#11, .F., ''FALSE'', ());
#6=LwsOtherChoice(#11);
#7=LwsAggregate(#13, .F., (#4, #11));
#8=LwsQualifiedIdentifier(#1, .F., ''MON'', ());
#9=LwsRangeChoice(#4, #1);
#10=LwsQualifiedIdentifier(#1, .F., ''FRI'', ());
#11=LwsComponentAssociation(#7, #5, (#6));
#12=LwsParsingResult($, (#3), $);
#13=LwsPrimaryQualifier(#3, #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate15 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAssociation(#11, #10, (#5, #12));
#2=LwsQualifiedIdentifier(#12, .F., ''SUN'', ());
#3=LwsParsingResult($, (#6), $);
#4=LwsPrimaryQualifier(#6, #11);
#5=LwsExpressionChoice(#1, #7);
#6=LwsQualifiedIdentifier(#3, .F., ''SCHEDULE'', (#4));
#7=LwsQualifiedIdentifier(#5, .F., ''WED'', ());
#8=LwsOtherChoice(#13);
#9=LwsQualifiedIdentifier(#13, .F., ''TRUE'', ());
#10=LwsQualifiedIdentifier(#1, .F., ''FALSE'', ());
#11=LwsAggregate(#4, .F., (#1, #13));
#12=LwsExpressionChoice(#1, #2);
#13=LwsComponentAssociation(#11, #9, (#8));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate16 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#3, .F., (#6, #4, #7));
#2=LwsDecimalLiteral(#9, .F., ''1.2'');
#3=LwsAggregate(#10, .F., (#9, #1));
#4=LwsDecimalLiteral(#1, .F., ''2.2'');
#5=LwsDecimalLiteral(#9, .F., ''1.3'');
#6=LwsDecimalLiteral(#1, .F., ''2.1'');
#7=LwsDecimalLiteral(#1, .F., ''2.3'');
#8=LwsDecimalLiteral(#9, .F., ''1.1'');
#9=LwsAggregate(#3, .F., (#8, #2, #5));
#10=LwsParsingResult($, (#3), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate17 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#15, .F., ''2.1'');
#2=LwsDecimalLiteral(#16, .F., ''1.3'');
#3=LwsExpressionChoice(#9, #6);
#4=LwsDecimalLiteral(#16, .F., ''1.1'');
#5=LwsDecimalLiteral(#15, .F., ''2.2'');
#6=LwsDecimalLiteral(#3, .F., ''2'');
#7=LwsAggregate(#13, .F., (#12, #9));
#8=LwsExpressionChoice(#12, #14);
#9=LwsComponentAssociation(#7, #15, (#3));
#10=LwsDecimalLiteral(#15, .F., ''2.3'');
#11=LwsDecimalLiteral(#16, .F., ''1.2'');
#12=LwsComponentAssociation(#7, #16, (#8));
#13=LwsParsingResult($, (#7), $);
#14=LwsDecimalLiteral(#8, .F., ''1'');
#15=LwsAggregate(#9, .F., (#1, #5, #10));
#16=LwsAggregate(#12, .F., (#4, #11, #2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate18 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#25), $);
#2=LwsExpressionChoice(#33, #27);
#3=LwsDecimalLiteral(#7, .F., ''1.3'');
#4=LwsDecimalLiteral(#9, .F., ''2.1'');
#5=LwsDecimalLiteral(#6, .F., ''2'');
#6=LwsExpressionChoice(#8, #5);
#7=LwsComponentAssociation(#14, #3, (#18));
#8=LwsComponentAssociation(#25, #32, (#6));
#9=LwsComponentAssociation(#32, #4, (#22));
#10=LwsDecimalLiteral(#11, .F., ''1'');
#11=LwsExpressionChoice(#29, #10);
#12=LwsDecimalLiteral(#15, .F., ''1.2'');
#13=LwsDecimalLiteral(#18, .F., ''3'');
#14=LwsAggregate(#21, .F., (#29, #15, #7));
#15=LwsComponentAssociation(#14, #12, (#16));
#16=LwsExpressionChoice(#15, #17);
#17=LwsDecimalLiteral(#16, .F., ''2'');
#18=LwsExpressionChoice(#7, #13);
#19=LwsDecimalLiteral(#20, .F., ''1'');
#20=LwsExpressionChoice(#21, #19);
#21=LwsComponentAssociation(#25, #14, (#20));
#22=LwsExpressionChoice(#9, #23);
#23=LwsDecimalLiteral(#22, .F., ''1'');
#24=LwsDecimalLiteral(#28, .F., ''2.3'');
#25=LwsAggregate(#1, .F., (#21, #8));
#26=LwsDecimalLiteral(#29, .F., ''1.1'');
#27=LwsDecimalLiteral(#2, .F., ''2'');
#28=LwsComponentAssociation(#32, #24, (#34));
#29=LwsComponentAssociation(#14, #26, (#11));
#30=LwsDecimalLiteral(#33, .F., ''2.2'');
#31=LwsDecimalLiteral(#34, .F., ''3'');
#32=LwsAggregate(#8, .F., (#9, #33, #28));
#33=LwsComponentAssociation(#32, #30, (#2));
#34=LwsExpressionChoice(#28, #31);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate19 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsOtherChoice(#4);
#3=LwsAggregate(#1, .F., (#4));
#4=LwsComponentAssociation(#3, #5, (#2));
#5=LwsQualifiedIdentifier(#4, .F., ''TRUE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAssociation(#11, #4, (#10));
#2=LwsQualifiedIdentifier(#13, .F., ''DAY'', ());
#3=LwsQualifiedIdentifier(#10, .F., ''MONTH'', ());
#4=LwsQualifiedIdentifier(#1, .F., ''JULY'', ());
#5=LwsComponentAssociation(#11, #6, (#7));
#6=LwsDecimalLiteral(#5, .F., ''1776'');
#7=LwsExpressionChoice(#5, #8);
#8=LwsQualifiedIdentifier(#7, .F., ''YEAR'', ());
#9=LwsParsingResult($, (#11), $);
#10=LwsExpressionChoice(#1, #3);
#11=LwsAggregate(#9, .F., (#12, #1, #5));
#12=LwsComponentAssociation(#11, #14, (#13));
#13=LwsExpressionChoice(#12, #2);
#14=LwsDecimalLiteral(#12, .F., ''4'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate20 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsIndexedAggregate(#1, .F., $, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate21 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#2, ''Finalization'');
#2=LwsQualifiedIdentifier(#10, .F., ''Ada'', (#1, #3));
#3=LwsNamedSelector(#2, ''Controlled'');
#4=LwsParsingResult($, (#10), $);
#5=LwsComponentAssociation(#10, #8, (#6));
#6=LwsExpressionChoice(#5, #9);
#7=LwsAccessAttribute(#8);
#8=LwsQualifiedIdentifier(#5, .F., ''Null_String'', (#7));
#9=LwsQualifiedIdentifier(#6, .F., ''Data'', ());
#10=LwsIndexedAggregate(#4, .F., #2, (#5));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate22 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#5, ''Finalization'');
#2=LwsParsingResult($, (#4), $);
#3=LwsNamedSelector(#5, ''Controlled'');
#4=LwsIndexedAggregate(#2, .F., #5, ());
#5=LwsQualifiedIdentifier(#4, .F., ''Ada'', (#1, #3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAggregate(#1, .F., (#12, #3, #9, #11));
#3=LwsQualifiedIdentifier(#2, .F., ''CLOSED'', ());
#4=LwsDecimalLiteral(#9, .F., ''5'');
#5=LwsExpressionChoice(#11, #6);
#6=LwsQualifiedIdentifier(#5, .F., ''CYLINDER'', ());
#7=LwsDecimalLiteral(#11, .F., ''12'');
#8=LwsExpressionChoice(#9, #10);
#9=LwsComponentAssociation(#2, #4, (#8));
#10=LwsQualifiedIdentifier(#8, .F., ''TRACK'', ());
#11=LwsComponentAssociation(#2, #7, (#5));
#12=LwsQualifiedIdentifier(#2, .F., ''DISK'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''CLOSED'', ());
#2=LwsComponentAssociation(#17, #1, (#12));
#3=LwsQualifiedIdentifier(#10, .F., ''CYLINDER'', ());
#4=LwsQualifiedIdentifier(#12, .F., ''STATUS'', ());
#5=LwsComponentAssociation(#17, #6, (#10));
#6=LwsDecimalLiteral(#5, .F., ''9'');
#7=LwsComponentAssociation(#17, #9, (#14));
#8=LwsQualifiedIdentifier(#14, .F., ''TRACK'', ());
#9=LwsDecimalLiteral(#7, .F., ''1'');
#10=LwsExpressionChoice(#5, #3);
#11=LwsQualifiedIdentifier(#15, .F., ''DISK'', ());
#12=LwsExpressionChoice(#2, #4);
#13=LwsQualifiedIdentifier(#18, .F., ''UNIT'', ());
#14=LwsExpressionChoice(#7, #8);
#15=LwsComponentAssociation(#17, #11, (#18));
#16=LwsParsingResult($, (#17), $);
#17=LwsAggregate(#16, .F., (#15, #2, #5, #7));
#18=LwsExpressionChoice(#15, #13);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#11, .F., ''SUCC'', ());
#2=LwsAggregate(#5, .F., (#13, #15, #6));
#3=LwsQualifiedIdentifier(#18, .F., ''CELL'', (#5));
#4=LwsQualifiedIdentifier(#12, .F., ''PRED'', ());
#5=LwsArgumentsSelector(#3, #2);
#6=LwsNullLiteral(#2, .F., ''null'');
#7=LwsQualifiedIdentifier(#14, .F., ''VALUE'', ());
#8=LwsAggregate(#17, .F., (#9, #16));
#9=LwsComponentAssociation(#8, #10, (#14));
#10=LwsDecimalLiteral(#9, .F., ''0'');
#11=LwsExpressionChoice(#16, #1);
#12=LwsExpressionChoice(#16, #4);
#13=LwsDecimalLiteral(#2, .F., ''0'');
#14=LwsExpressionChoice(#9, #7);
#15=LwsNullLiteral(#2, .F., ''null'');
#16=LwsComponentAssociation(#8, #18, (#11, #12));
#17=LwsParsingResult($, (#8), $);
#18=LwsAllocator(#16, .F., #3, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsQualifiedIdentifier(#7, .F., ''SUCC'', ());
#3=LwsExpressionChoice(#8, #5);
#4=LwsAggregate(#1, .F., (#8));
#5=LwsQualifiedIdentifier(#3, .F., ''PRED'', ());
#6=LwsNullLiteral(#8, .F., ''null'');
#7=LwsExpressionChoice(#8, #2);
#8=LwsComponentAssociation(#4, #6, (#7, #3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#9, .F., ''0'');
#2=LwsQualifiedIdentifier(#11, .F., ''SUCC'', ());
#3=LwsNullLiteral(#7, .F., ''null'');
#4=LwsParsingResult($, (#8), $);
#5=LwsExpressionChoice(#7, #12);
#6=LwsExpressionChoice(#9, #10);
#7=LwsComponentAssociation(#8, #3, (#11, #5));
#8=LwsAggregate(#4, .F., (#9, #7));
#9=LwsComponentAssociation(#8, #1, (#6));
#10=LwsQualifiedIdentifier(#6, .F., ''VALUE'', ());
#11=LwsExpressionChoice(#7, #2);
#12=LwsQualifiedIdentifier(#5, .F., ''PRED'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAggregate8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAssociation(#11, #15, (#14, #13));
#2=LwsQualifiedIdentifier(#14, .F., ''SUCC'', ());
#3=LwsQualifiedIdentifier(#13, .F., ''PRED'', ());
#4=LwsComponentAssociation(#11, #6, (#5));
#5=LwsOtherChoice(#4);
#6=LwsDecimalLiteral(#4, .F., ''0'');
#7=LwsParsingResult($, (#11), $);
#8=LwsExpressionChoice(#9, #10);
#9=LwsComponentAssociation(#11, #12, (#8));
#10=LwsQualifiedIdentifier(#8, .F., ''VALUE'', ());
#11=LwsAggregate(#7, .F., (#9, #1, #4));
#12=LwsDecimalLiteral(#9, .F., ''0'');
#13=LwsExpressionChoice(#1, #3);
#14=LwsExpressionChoice(#1, #2);
#15=LwsNullLiteral(#1, .F., ''null'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllSelector1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsAllSelector(#3);
#3=LwsQualifiedIdentifier(#1, .F., ''NEXT_CAR'', (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllocator1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''CELL'', ());
#2=LwsParsingResult($, (#3), $);
#3=LwsAllocator(#2, .F., #1, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllocator2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#8, .F., (#2, #4, #3));
#2=LwsDecimalLiteral(#1, .F., ''0'');
#3=LwsNullLiteral(#1, .F., ''null'');
#4=LwsNullLiteral(#1, .F., ''null'');
#5=LwsParsingResult($, (#6), $);
#6=LwsAllocator(#5, .F., #7, #7);
#7=LwsQualifiedIdentifier(#6, .F., ''CELL'', (#8));
#8=LwsPrimaryQualifier(#7, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllocator3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAllocator(#1, .F., #7, #7);
#3=LwsAggregate(#6, .F., (#11, #8));
#4=LwsDecimalLiteral(#11, .F., ''1'');
#5=LwsDecimalLiteral(#11, .F., ''10'');
#6=LwsArgumentsSelector(#7, #3);
#7=LwsQualifiedIdentifier(#2, .F., ''MATRIX'', (#6));
#8=LwsExplicitRange(#3, .F., #9, #10);
#9=LwsDecimalLiteral(#8, .F., ''1'');
#10=LwsDecimalLiteral(#8, .F., ''20'');
#11=LwsExplicitRange(#3, .F., #4, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllocator4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''MATRIX'', (#10));
#2=LwsDecimalLiteral(#8, .F., ''1'');
#3=LwsDecimalLiteral(#8, .F., ''20'');
#4=LwsDecimalLiteral(#14, .F., ''0.0'');
#5=LwsComponentAssociation(#7, #17, (#12));
#6=LwsAllocator(#15, .F., #1, #1);
#7=LwsAggregate(#10, .F., (#5));
#8=LwsExplicitRange(#9, .F., #2, #3);
#9=LwsRangeChoice(#14, #8);
#10=LwsPrimaryQualifier(#1, #7);
#11=LwsExplicitRange(#12, .F., #13, #16);
#12=LwsRangeChoice(#5, #11);
#13=LwsDecimalLiteral(#11, .F., ''1'');
#14=LwsComponentAssociation(#17, #4, (#9));
#15=LwsParsingResult($, (#6), $);
#16=LwsDecimalLiteral(#11, .F., ''10'');
#17=LwsAggregate(#5, .F., (#14));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAllocator5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExplicitRange(#18, .F., #4, #10);
#2=LwsDecimalLiteral(#14, .F., ''0'');
#3=LwsAggregate(#8, .F., (#6, #14, #9));
#4=LwsDecimalLiteral(#1, .F., ''1'');
#5=LwsQualifiedIdentifier(#20, .F., ''BUFFER'', (#8));
#6=LwsComponentAssociation(#3, #23, (#11));
#7=LwsQualifiedIdentifier(#11, .F., ''SIZE'', ());
#8=LwsPrimaryQualifier(#5, #3);
#9=LwsComponentAssociation(#3, #22, (#17));
#10=LwsDecimalLiteral(#1, .F., ''80'');
#11=LwsExpressionChoice(#6, #7);
#12=LwsDecimalLiteral(#19, .F., ''1'');
#13=LwsParsingResult($, (#20), $);
#14=LwsComponentAssociation(#3, #2, (#21));
#15=LwsQualifiedIdentifier(#17, .F., ''VALUE'', ());
#16=LwsQualifiedIdentifier(#21, .F., ''POS'', ());
#17=LwsExpressionChoice(#9, #15);
#18=LwsRangeChoice(#19, #1);
#19=LwsComponentAssociation(#22, #12, (#18));
#20=LwsAllocator(#13, .F., #5, #5);
#21=LwsExpressionChoice(#14, #16);
#22=LwsAggregate(#9, .F., (#19));
#23=LwsDecimalLiteral(#6, .F., ''80'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#4, .F., ''x'', ());
#2=LwsQualifiedIdentifier(#4, .F., ''t'', ());
#3=LwsParsingResult($, (#4), $);
#4=LwsAndExpression(#3, .F., #1, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAndExpression(#2, .F., #4, #5);
#2=LwsOrExpression(#6, .F., #1, #3);
#3=LwsQualifiedIdentifier(#2, .F., ''b'', ());
#4=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#5=LwsQualifiedIdentifier(#1, .F., ''t'', ());
#6=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsQualifiedIdentifier(#4, .F., ''x'', ());
#3=LwsAndExpression(#1, .F., #4, #6);
#4=LwsOrExpression(#3, .F., #2, #5);
#5=LwsQualifiedIdentifier(#4, .F., ''t'', ());
#6=LwsQualifiedIdentifier(#3, .F., ''b'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''x'', ());
#2=LwsXorExpression(#5, .F., #6, #4);
#3=LwsQualifiedIdentifier(#6, .F., ''t'', ());
#4=LwsQualifiedIdentifier(#2, .F., ''b'', ());
#5=LwsParsingResult($, (#2), $);
#6=LwsAndExpression(#2, .F., #1, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsXorExpression(#4, .F., #6, #2);
#2=LwsQualifiedIdentifier(#1, .F., ''b'', ());
#3=LwsQualifiedIdentifier(#6, .F., ''t'', ());
#4=LwsParsingResult($, (#1), $);
#5=LwsQualifiedIdentifier(#6, .F., ''x'', ());
#6=LwsAndThenExpression(#1, .F., #5, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAnd6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsXorExpression(#4, .F., #5, #6);
#2=LwsQualifiedIdentifier(#5, .F., ''t'', ());
#3=LwsQualifiedIdentifier(#5, .F., ''x'', ());
#4=LwsParsingResult($, (#1), $);
#5=LwsOrElseExpression(#1, .F., #3, #2);
#6=LwsQualifiedIdentifier(#1, .F., ''b'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#4, .F., ''REAL'', ());
#2=LwsIndex(#6, #7);
#3=LwsComponentSubtype(#6, .F., #4);
#4=LwsSubtypeIndication(#3, #1, $);
#5=LwsParsingResult($, (#6), $);
#6=LwsArrayType(#5, (#2), #3);
#7=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#2=LwsIndex(#3, #1);
#3=LwsArrayType(#8, (#2, #9), #5);
#4=LwsSubtypeIndication(#5, #6, $);
#5=LwsComponentSubtype(#3, .F., #4);
#6=LwsQualifiedIdentifier(#4, .F., ''REAL'', ());
#7=LwsQualifiedIdentifier(#9, .F., ''INTEGER'', ());
#8=LwsParsingResult($, (#3), $);
#9=LwsIndex(#3, #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#4, .F., ''ROMAN_DIGIT'', ());
#2=LwsQualifiedIdentifier(#5, .F., ''POSITIVE'', ());
#3=LwsComponentSubtype(#6, .F., #4);
#4=LwsSubtypeIndication(#3, #1, $);
#5=LwsIndex(#6, #2);
#6=LwsArrayType(#7, (#5), #3);
#7=LwsParsingResult($, (#6), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#8), $);
#2=LwsComponentSubtype(#8, .F., #3);
#3=LwsSubtypeIndication(#2, #6, $);
#4=LwsExplicitRange(#8, .F., #7, #5);
#5=LwsDecimalLiteral(#4, .F., ''10'');
#6=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#7=LwsDecimalLiteral(#4, .F., ''1'');
#8=LwsArrayType(#1, (#4), #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArrayType(#7, (#3), #2);
#2=LwsComponentSubtype(#1, .F., #5);
#3=LwsDiscreteRange(#1, .F., #4, $);
#4=LwsQualifiedIdentifier(#3, .F., ''DAY'', ());
#5=LwsSubtypeIndication(#2, #6, $);
#6=LwsQualifiedIdentifier(#5, .F., ''BOOLEAN'', ());
#7=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArrayType(#2, (#5), #4);
#2=LwsParsingResult($, (#1), $);
#3=LwsQualifiedIdentifier(#5, .F., ''MAX_LINE_SIZE'', ());
#4=LwsComponentSubtype(#1, .F., #6);
#5=LwsExplicitRange(#1, .F., #8, #3);
#6=LwsSubtypeIndication(#4, #7, $);
#7=LwsQualifiedIdentifier(#6, .F., ''CHARACTER'', ());
#8=LwsDecimalLiteral(#5, .F., ''1'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#6, .F., ''80'');
#2=LwsDecimalLiteral(#9, .F., ''1'');
#3=LwsQualifiedIdentifier(#11, .F., ''BOOLEAN'', ());
#4=LwsParsingResult($, (#5), $);
#5=LwsArrayType(#4, (#6, #9), #10);
#6=LwsExplicitRange(#5, .F., #7, #1);
#7=LwsDecimalLiteral(#6, .F., ''1'');
#8=LwsDecimalLiteral(#9, .F., ''100'');
#9=LwsExplicitRange(#5, .F., #2, #8);
#10=LwsComponentSubtype(#5, .F., #11);
#11=LwsSubtypeIndication(#10, #3, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testArrayType9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#10, .F., ''N'', ());
#2=LwsDecimalLiteral(#6, .F., ''1'');
#3=LwsDecimalLiteral(#10, .F., ''1'');
#4=LwsParsingResult($, (#5), $);
#5=LwsArrayType(#4, (#6, #10), #8);
#6=LwsExplicitRange(#5, .F., #2, #7);
#7=LwsQualifiedIdentifier(#6, .F., ''N'', ());
#8=LwsComponentSubtype(#5, .F., #11);
#9=LwsQualifiedIdentifier(#11, .F., ''CHARACTER'', ());
#10=LwsExplicitRange(#5, .F., #3, #1);
#11=LwsSubtypeIndication(#8, #9, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAssignment(#1, (), #4, #3);
#3=LwsMinusExpression(#2, .F., #6, #5);
#4=LwsQualifiedIdentifier(#2, .F., ''VALUE'', ());
#5=LwsDecimalLiteral(#3, .F., ''1'');
#6=LwsQualifiedIdentifier(#3, .F., ''MAX_VALUE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''N'', ());
#2=LwsArgumentsSelector(#9, #6);
#3=LwsAggregate(#10, .F., (#11, #1));
#4=LwsDecimalLiteral(#8, .F., ''2.5'');
#5=LwsQualifiedIdentifier(#6, .F., ''F'', ());
#6=LwsAggregate(#2, .F., (#5));
#7=LwsParsingResult($, (#8), $);
#8=LwsAssignment(#7, (), #9, #4);
#9=LwsQualifiedIdentifier(#8, .F., ''NEXT_FRAME'', (#2, #10));
#10=LwsArgumentsSelector(#9, #3);
#11=LwsQualifiedIdentifier(#3, .F., ''M'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#3, .F., (#2, #4));
#2=LwsQualifiedIdentifier(#1, .F., ''V'', ());
#3=LwsArgumentsSelector(#7, #1);
#4=LwsQualifiedIdentifier(#1, .F., ''W'', ());
#5=LwsQualifiedIdentifier(#8, .F., ''U'', ());
#6=LwsParsingResult($, (#8), $);
#7=LwsQualifiedIdentifier(#8, .F., ''DOT_PRODUCT'', (#3));
#8=LwsAssignment(#6, (), #5, #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExpressionChoice(#10, #4);
#2=LwsComponentAssociation(#16, #5, (#8));
#3=LwsQualifiedIdentifier(#7, .F., ''WRITER'', ());
#4=LwsQualifiedIdentifier(#1, .F., ''UNIT'', ());
#5=LwsDecimalLiteral(#2, .F., ''60'');
#6=LwsExpressionChoice(#12, #9);
#7=LwsAssignment(#15, (), #3, #16);
#8=LwsExpressionChoice(#2, #14);
#9=LwsQualifiedIdentifier(#6, .F., ''STATUS'', ());
#10=LwsComponentAssociation(#16, #11, (#1));
#11=LwsQualifiedIdentifier(#10, .F., ''PRINTER'', ());
#12=LwsComponentAssociation(#16, #13, (#6));
#13=LwsQualifiedIdentifier(#12, .F., ''OPEN'', ());
#14=LwsQualifiedIdentifier(#8, .F., ''LINE_COUNT'', ());
#15=LwsParsingResult($, (#7), $);
#16=LwsAggregate(#7, .F., (#12, #10, #2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAssignment(#2, (), #6, #5);
#2=LwsParsingResult($, (#1), $);
#3=LwsNullLiteral(#5, .F., ''null'');
#4=LwsDecimalLiteral(#5, .F., ''72074'');
#5=LwsAggregate(#1, .F., (#4, #3));
#6=LwsQualifiedIdentifier(#1, .F., ''NEXT_CAR'', (#7));
#7=LwsAllSelector(#6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#8, .F., ''tar sauce'');
#2=LwsArgumentsSelector(#6, #3);
#3=LwsAggregate(#2, .F., (#4));
#4=LwsExplicitRange(#3, .F., #7, #9);
#5=LwsParsingResult($, (#8), $);
#6=LwsQualifiedIdentifier(#8, .F., ''A'', (#2));
#7=LwsDecimalLiteral(#4, .F., ''1'');
#8=LwsAssignment(#5, (), #6, #1);
#9=LwsDecimalLiteral(#4, .F., ''9'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAssignment7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#14, .F., (#6));
#2=LwsExplicitRange(#7, .F., #12, #9);
#3=LwsQualifiedIdentifier(#8, .F., ''A'', (#4));
#4=LwsArgumentsSelector(#3, #7);
#5=LwsQualifiedIdentifier(#8, .F., ''A'', (#14));
#6=LwsExplicitRange(#1, .F., #11, #10);
#7=LwsAggregate(#4, .F., (#2));
#8=LwsAssignment(#13, (), #3, #5);
#9=LwsDecimalLiteral(#2, .F., ''12'');
#10=LwsDecimalLiteral(#6, .F., ''9'');
#11=LwsDecimalLiteral(#6, .F., ''1'');
#12=LwsDecimalLiteral(#2, .F., ''4'');
#13=LwsParsingResult($, (#8), $);
#14=LwsArgumentsSelector(#5, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAsynchronousSelect1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryCall(#13, (), #3);
#2=LwsNullStatement(#13, ());
#3=LwsQualifiedIdentifier(#1, .F., ''CONTROLLER'', (#10, #5, #15));
#4=LwsAggregate(#15, .F., (#14));
#5=LwsArgumentsSelector(#3, #7);
#6=LwsDecimalLiteral(#8, .F., ''300'');
#7=LwsAggregate(#5, .F., (#11));
#8=LwsDelayStatement(#13, (), #6);
#9=LwsParsingResult($, (#13), $);
#10=LwsNamedSelector(#3, ''REQUEST'');
#11=LwsQualifiedIdentifier(#7, .F., ''MEDIUM'', ());
#12=LwsNullStatement(#13, ());
#13=LwsAsynchronousSelect(#9, (), (#1, #8, #12), (#2));
#14=LwsQualifiedIdentifier(#4, .F., ''SOME_ITEM'', ());
#15=LwsArgumentsSelector(#3, #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAsynchronousSelect2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNullStatement(#5, ());
#2=LwsParsingResult($, (#5), $);
#3=LwsNullStatement(#5, ());
#4=LwsDecimalLiteral(#6, .F., ''300'');
#5=LwsAsynchronousSelect(#2, (), (#6, #1), (#3));
#6=LwsDelayStatement(#5, (), #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAsynchronousSelect3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNullStatement(#2, ());
#2=LwsAsynchronousSelect(#5, (), (#4, #3), (#1));
#3=LwsNullStatement(#2, ());
#4=LwsDelayStatement(#2, (), #6);
#5=LwsParsingResult($, (#2), $);
#6=LwsDecimalLiteral(#4, .F., ''300'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAsynchronousSelect4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureCall(#14, (), #27);
#2=LwsArgumentsSelector(#20, #18);
#3=LwsQualifiedIdentifier(#18, .F., ''Command'', ());
#4=LwsQualifiedIdentifier(#5, .F., ''Last'', ());
#5=LwsExplicitRange(#29, .F., #30, #4);
#6=LwsEntryCall(#14, (), #15);
#7=LwsProcedureCall(#14, (), #20);
#8=LwsQualifiedIdentifier(#28, .F., ''Command'', (#13));
#9=LwsArgumentsSelector(#31, #22);
#10=LwsAggregate(#21, .F., (#12));
#11=LwsArgumentsSelector(#27, #28);
#12=LwsStringLiteral(#10, .F., ''-> '');
#13=LwsArgumentsSelector(#8, #29);
#14=LwsAsynchronousSelect(#17, (), (#6, #24), (#19, #7, #1));
#15=LwsQualifiedIdentifier(#6, .F., ''Terminal'', (#23));
#16=LwsQualifiedIdentifier(#19, .F., ''Put_Line'', (#21));
#17=LwsParsingResult($, (#14), $);
#18=LwsAggregate(#2, .F., (#3, #25));
#19=LwsProcedureCall(#14, (), #16);
#20=LwsQualifiedIdentifier(#7, .F., ''Get_Line'', (#2));
#21=LwsArgumentsSelector(#16, #10);
#22=LwsAggregate(#9, .F., (#26));
#23=LwsNamedSelector(#15, ''Wait_For_Interrupt'');
#24=LwsProcedureCall(#14, (), #31);
#25=LwsQualifiedIdentifier(#18, .F., ''Last'', ());
#26=LwsStringLiteral(#22, .F., ''Interrupted'');
#27=LwsQualifiedIdentifier(#1, .F., ''Process_Command'', (#11));
#28=LwsAggregate(#11, .F., (#8));
#29=LwsAggregate(#13, .F., (#5));
#30=LwsDecimalLiteral(#5, .F., ''1'');
#31=LwsQualifiedIdentifier(#24, .F., ''Put_Line'', (#9));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testAsynchronousSelect5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#13, .F., (#9, #6));
#2=LwsArgumentsSelector(#8, #4);
#3=LwsAsynchronousSelect(#11, (), (#14, #7), (#12));
#4=LwsAggregate(#2, .F., (#15));
#5=LwsDecimalLiteral(#14, .F., ''5.0'');
#6=LwsQualifiedIdentifier(#1, .F., ''Y'', ());
#7=LwsProcedureCall(#3, (), #8);
#8=LwsQualifiedIdentifier(#7, .F., ''Put_Line'', (#2));
#9=LwsQualifiedIdentifier(#1, .F., ''X'', ());
#10=LwsQualifiedIdentifier(#12, .F., ''Horribly_Complicated_Recursive_Function'', (#13));
#11=LwsParsingResult($, (#3), $);
#12=LwsProcedureCall(#3, (), #10);
#13=LwsArgumentsSelector(#10, #1);
#14=LwsDelayStatement(#3, (), #5);
#15=LwsStringLiteral(#4, .F., ''Calculation does not converge'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsBasedLiteral(#1, .F., ''2#1111_1111#'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBasedLiteral(#2, .F., ''16#FF#'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBasedLiteral(#2, .F., ''016#0FF#'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBasedLiteral(#2, .F., ''16#E#E1'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBasedLiteral(#2, .F., ''16#F.FF#E+2'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBasedLiteral6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsBasedLiteral(#1, .F., ''2#1.1111_1111_111#E11'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBlock1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAssignment(#11, (), #7, #10);
#2=LwsBlockStatement(#5, (), ''SWAP'', (), #11);
#3=LwsQualifiedIdentifier(#6, .F., ''TEMP'', ());
#4=LwsQualifiedIdentifier(#12, .F., ''V'', ());
#5=LwsParsingResult($, (#2), $);
#6=LwsAssignment(#11, (), #9, #3);
#7=LwsQualifiedIdentifier(#1, .F., ''TEMP'', ());
#8=LwsQualifiedIdentifier(#12, .F., ''U'', ());
#9=LwsQualifiedIdentifier(#6, .F., ''U'', ());
#10=LwsQualifiedIdentifier(#1, .F., ''V'', ());
#11=LwsBlockBody(#2, (#1, #12, #6), ());
#12=LwsAssignment(#11, (), #4, #8);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBlock2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBlockStatement(#4, (), ''SWAP'', (#2), #3);
#2=LwsObjectDeclaration(#1, (''TEMP''), .F., .F., #8, $);
#3=LwsBlockBody(#1, (#5, #9, #7), ());
#4=LwsParsingResult($, (#1), $);
#5=LwsAssignment(#3, (), #14, #6);
#6=LwsQualifiedIdentifier(#5, .F., ''V'', ());
#7=LwsAssignment(#3, (), #12, #11);
#8=LwsSubtypeIndication(#2, #13, $);
#9=LwsAssignment(#3, (), #15, #10);
#10=LwsQualifiedIdentifier(#9, .F., ''U'', ());
#11=LwsQualifiedIdentifier(#7, .F., ''TEMP'', ());
#12=LwsQualifiedIdentifier(#7, .F., ''U'', ());
#13=LwsQualifiedIdentifier(#8, .F., ''INTEGER'', ());
#14=LwsQualifiedIdentifier(#5, .F., ''TEMP'', ());
#15=LwsQualifiedIdentifier(#9, .F., ''V'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBlock3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#27, .F., ''V'', ());
#2=LwsQualifiedIdentifier(#10, .F., ''TEMP'', ());
#3=LwsExceptionHandler(#17, $, (#30), (#13, #31));
#4=LwsArgumentsSelector(#15, #28);
#5=LwsExceptionHandler(#17, $, (#12, #9), (#18));
#6=LwsBlockStatement(#19, (), ''SWAP'', (), #17);
#7=LwsQualifiedIdentifier(#9, .F., ''NUMERIC_ERROR'', ());
#8=LwsQualifiedIdentifier(#12, .F., ''SINGULAR'', ());
#9=LwsNamedExceptionChoice(#5, #7);
#10=LwsAssignment(#17, (), #22, #2);
#11=LwsArgumentsSelector(#21, #25);
#12=LwsNamedExceptionChoice(#5, #8);
#13=LwsProcedureCall(#3, (), #15);
#14=LwsQualifiedIdentifier(#31, .F., ''ERROR'', ());
#15=LwsQualifiedIdentifier(#13, .F., ''PUT'', (#4));
#16=LwsQualifiedIdentifier(#23, .F., ''V'', ());
#17=LwsBlockBody(#6, (#23, #27, #10), (#5, #3));
#18=LwsProcedureCall(#5, (), #21);
#19=LwsParsingResult($, (#6), $);
#20=LwsQualifiedIdentifier(#27, .F., ''U'', ());
#21=LwsQualifiedIdentifier(#18, .F., ''PUT'', (#11));
#22=LwsQualifiedIdentifier(#10, .F., ''U'', ());
#23=LwsAssignment(#17, (), #24, #16);
#24=LwsQualifiedIdentifier(#23, .F., ''TEMP'', ());
#25=LwsAggregate(#11, .F., (#26));
#26=LwsStringLiteral(#25, .F., '' MATRIX IS SINGULAR '');
#27=LwsAssignment(#17, (), #1, #20);
#28=LwsAggregate(#4, .F., (#29));
#29=LwsStringLiteral(#28, .F., '' FATAL ERROR '');
#30=LwsOthersExceptionChoice(#3);
#31=LwsRaiseStatement(#3, (), #14);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBlock31 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#18, .F., (#2));
#2=LwsStringLiteral(#1, .F., '' MATRIX IS SINGULAR '');
#3=LwsStringLiteral(#26, .F., '' FATAL ERROR '');
#4=LwsQualifiedIdentifier(#11, .F., ''U'', ());
#5=LwsRaiseStatement(#10, (), #24);
#6=LwsQualifiedIdentifier(#23, .F., ''U'', ());
#7=LwsQualifiedIdentifier(#8, .F., ''TEMP'', ());
#8=LwsAssignment(#27, (), #7, #31);
#9=LwsOthersExceptionChoice(#10);
#10=LwsExceptionHandler(#27, $, (#9), (#21, #5));
#11=LwsAssignment(#27, (), #13, #4);
#12=LwsArgumentsSelector(#25, #26);
#13=LwsQualifiedIdentifier(#11, .F., ''V'', ());
#14=LwsQualifiedIdentifier(#23, .F., ''TEMP'', ());
#15=LwsBlockStatement(#28, (), ''SWAP'', (), #27);
#16=LwsExceptionHandler(#27, $, (#22, #19), (#29));
#17=LwsQualifiedIdentifier(#19, .F., ''NUMERIC_ERROR'', ());
#18=LwsArgumentsSelector(#30, #1);
#19=LwsNamedExceptionChoice(#16, #17);
#20=LwsQualifiedIdentifier(#22, .F., ''SINGULAR'', ());
#21=LwsProcedureCall(#10, (), #25);
#22=LwsNamedExceptionChoice(#16, #20);
#23=LwsAssignment(#27, (), #6, #14);
#24=LwsQualifiedIdentifier(#5, .F., ''ERROR'', ());
#25=LwsQualifiedIdentifier(#21, .F., ''PUT'', (#12));
#26=LwsAggregate(#12, .F., (#3));
#27=LwsBlockBody(#15, (#8, #11, #23), (#16, #10));
#28=LwsParsingResult($, (#15), $);
#29=LwsProcedureCall(#16, (), #30);
#30=LwsQualifiedIdentifier(#29, .F., ''PUT'', (#18));
#31=LwsQualifiedIdentifier(#8, .F., ''V'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testBlock4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#4, .F., (#25));
#2=LwsRaiseStatement(#24, (), #32);
#3=LwsAssignment(#29, (), #14, #33);
#4=LwsArgumentsSelector(#30, #1);
#5=LwsQualifiedIdentifier(#23, .F., ''V'', ());
#6=LwsQualifiedIdentifier(#27, .F., ''SINGULAR'', ());
#7=LwsStringLiteral(#28, .F., '' MATRIX IS SINGULAR '');
#8=LwsProcedureCall(#24, (), #30);
#9=LwsQualifiedIdentifier(#12, .F., ''TEMP'', ());
#10=LwsParsingResult($, (#15), $);
#11=LwsOthersExceptionChoice(#24);
#12=LwsAssignment(#29, (), #26, #9);
#13=LwsExceptionHandler(#29, $, (#27, #17), (#18));
#14=LwsQualifiedIdentifier(#3, .F., ''TEMP'', ());
#15=LwsBlockStatement(#10, (), ''SWAP'', (#22), #29);
#16=LwsQualifiedIdentifier(#23, .F., ''U'', ());
#17=LwsNamedExceptionChoice(#13, #34);
#18=LwsProcedureCall(#13, (), #19);
#19=LwsQualifiedIdentifier(#18, .F., ''PUT'', (#20));
#20=LwsArgumentsSelector(#19, #28);
#21=LwsQualifiedIdentifier(#31, .F., ''INTEGER'', ());
#22=LwsObjectDeclaration(#15, (''TEMP''), .F., .F., #31, $);
#23=LwsAssignment(#29, (), #5, #16);
#24=LwsExceptionHandler(#29, $, (#11), (#8, #2));
#25=LwsStringLiteral(#1, .F., '' FATAL ERROR '');
#26=LwsQualifiedIdentifier(#12, .F., ''U'', ());
#27=LwsNamedExceptionChoice(#13, #6);
#28=LwsAggregate(#20, .F., (#7));
#29=LwsBlockBody(#15, (#3, #23, #12), (#13, #24));
#30=LwsQualifiedIdentifier(#8, .F., ''PUT'', (#4));
#31=LwsSubtypeIndication(#22, #21, $);
#32=LwsQualifiedIdentifier(#2, .F., ''ERROR'', ());
#33=LwsQualifiedIdentifier(#3, .F., ''V'', ());
#34=LwsQualifiedIdentifier(#17, .F., ''NUMERIC_ERROR'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCallFunctionNameIsString [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#14, .F., (#11));
#2=LwsQualifiedIdentifier(#6, .T., ''NOT'', (#14));
#3=LwsFormalParameter(#5, (''MSG''), $, #7, $);
#4=LwsQualifiedIdentifier(#5, .F., ''INTEGER'', ());
#5=LwsOperatorOverloadDeclaration(#9, (#3), .F., #10, #4, #10);
#6=LwsReturnStatement(#12, (), #2);
#7=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#8=LwsParsingResult($, (#13), $);
#9=LwsSubprogramBody(#13, (), #5, #12);
#10=LwsStringDesignator(#5, ''"NOT"'');
#11=LwsDecimalLiteral(#1, .F., ''42'');
#12=LwsBlockBody(#9, (#6), ());
#13=LwsUnit(#8, .F., (), #9);
#14=LwsArgumentsSelector(#2, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCase1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCaseStatement(#3, (), #9, (#11));
#2=LwsQualifiedIdentifier(#8, .F., ''ELEVATION'', ());
#3=LwsParsingResult($, (#1), $);
#4=LwsAggregate(#10, .F., (#7));
#5=LwsProcedureCall(#11, (), #6);
#6=LwsQualifiedIdentifier(#5, .F., ''RECORD_ELEVATION'', (#10));
#7=LwsQualifiedIdentifier(#4, .F., ''SENSOR_VALUE'', ());
#8=LwsExpressionChoice(#11, #2);
#9=LwsQualifiedIdentifier(#1, .F., ''SENSOR'', ());
#10=LwsArgumentsSelector(#6, #4);
#11=LwsCaseAlternative(#1, (#8), (#5));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCase2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#17, .F., (#8));
#2=LwsAggregate(#23, .F., (#3));
#3=LwsQualifiedIdentifier(#2, .F., ''S'', ());
#4=LwsParsingResult($, (#24), $);
#5=LwsQualifiedIdentifier(#25, .F., ''GENERATE_REPORT'', (#26));
#6=LwsAggregate(#26, .F., (#22));
#7=LwsExpressionChoice(#9, #13);
#8=LwsQualifiedIdentifier(#1, .F., ''SENSOR_VALUE'', ());
#9=LwsCaseAlternative(#24, (#7), (#16));
#10=LwsExplicitRange(#21, .F., #14, #15);
#11=LwsQualifiedIdentifier(#12, .F., ''PUT'', (#23));
#12=LwsProcedureCall(#20, (), #11);
#13=LwsQualifiedIdentifier(#7, .F., ''ELEVATION'', ());
#14=LwsQualifiedIdentifier(#10, .F., ''TUE'', ());
#15=LwsQualifiedIdentifier(#10, .F., ''THU'', ());
#16=LwsProcedureCall(#9, (), #19);
#17=LwsArgumentsSelector(#19, #1);
#18=LwsQualifiedIdentifier(#24, .F., ''SENSOR'', ());
#19=LwsQualifiedIdentifier(#16, .F., ''RECORD_ELEVATION'', (#17));
#20=LwsCaseAlternative(#24, (#21), (#25, #12));
#21=LwsRangeChoice(#20, #10);
#22=LwsQualifiedIdentifier(#6, .F., ''TODAY'', ());
#23=LwsArgumentsSelector(#11, #2);
#24=LwsCaseStatement(#4, (), #18, (#9, #20));
#25=LwsProcedureCall(#20, (), #5);
#26=LwsArgumentsSelector(#5, #6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCase3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExpressionChoice(#17, #25);
#2=LwsProcedureCall(#17, (), #3);
#3=LwsQualifiedIdentifier(#2, .F., ''RECORD_ELEVATION'', (#19));
#4=LwsQualifiedIdentifier(#18, .F., ''SENSOR_VALUE'', ());
#5=LwsQualifiedIdentifier(#28, .F., ''TUE'', ());
#6=LwsQualifiedIdentifier(#13, .F., ''TODAY'', ());
#7=LwsQualifiedIdentifier(#8, .F., ''S'', ());
#8=LwsAggregate(#23, .F., (#7));
#9=LwsCaseAlternative(#11, (#29), (#20, #21));
#10=LwsCaseAlternative(#11, (#22), (#12));
#11=LwsCaseStatement(#24, (), #16, (#17, #9, #10));
#12=LwsNullStatement(#10, ());
#13=LwsAggregate(#26, .F., (#6));
#14=LwsQualifiedIdentifier(#28, .F., ''THU'', ());
#15=LwsQualifiedIdentifier(#21, .F., ''PUT'', (#23));
#16=LwsQualifiedIdentifier(#11, .F., ''SENSOR'', ());
#17=LwsCaseAlternative(#11, (#1), (#2));
#18=LwsAggregate(#19, .F., (#4));
#19=LwsArgumentsSelector(#3, #18);
#20=LwsProcedureCall(#9, (), #27);
#21=LwsProcedureCall(#9, (), #15);
#22=LwsOtherChoice(#10);
#23=LwsArgumentsSelector(#15, #8);
#24=LwsParsingResult($, (#11), $);
#25=LwsQualifiedIdentifier(#1, .F., ''ELEVATION'', ());
#26=LwsArgumentsSelector(#27, #13);
#27=LwsQualifiedIdentifier(#20, .F., ''GENERATE_REPORT'', (#26));
#28=LwsExplicitRange(#29, .F., #5, #14);
#29=LwsRangeChoice(#9, #28);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCase4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#11, #27);
#2=LwsExpressionChoice(#28, #3);
#3=LwsDecimalLiteral(#2, .F., ''3'');
#4=LwsExpressionChoice(#12, #6);
#5=LwsQualifiedIdentifier(#35, .F., ''EMPTY_BIN'', (#22));
#6=LwsDecimalLiteral(#4, .F., ''2'');
#7=LwsAggregate(#22, .F., (#34));
#8=LwsAggregate(#24, .F., (#36));
#9=LwsQualifiedIdentifier(#27, .F., ''COUNT'', ());
#10=LwsQualifiedIdentifier(#15, .F., ''ERROR'', ());
#11=LwsQualifiedIdentifier(#26, .F., ''BIN_NUMBER'', (#1));
#12=LwsCaseAlternative(#26, (#4), (#37));
#13=LwsAggregate(#29, .F., (#19));
#14=LwsAggregate(#30, .F., (#17));
#15=LwsRaiseStatement(#39, (), #10);
#16=LwsCaseAlternative(#26, (#23), (#40));
#17=LwsDecimalLiteral(#14, .F., ''2'');
#18=LwsExpressionChoice(#28, #20);
#19=LwsDecimalLiteral(#13, .F., ''1'');
#20=LwsDecimalLiteral(#18, .F., ''4'');
#21=LwsOtherChoice(#39);
#22=LwsArgumentsSelector(#5, #7);
#23=LwsExpressionChoice(#16, #25);
#24=LwsArgumentsSelector(#41, #8);
#25=LwsDecimalLiteral(#23, .F., ''1'');
#26=LwsCaseStatement(#33, (), #11, (#16, #12, #28, #39));
#27=LwsAggregate(#1, .F., (#9));
#28=LwsCaseAlternative(#26, (#2, #18), (#35, #38));
#29=LwsArgumentsSelector(#32, #13);
#30=LwsArgumentsSelector(#31, #14);
#31=LwsQualifiedIdentifier(#38, .F., ''EMPTY_BIN'', (#30));
#32=LwsQualifiedIdentifier(#40, .F., ''UPDATE_BIN'', (#29));
#33=LwsParsingResult($, (#26), $);
#34=LwsDecimalLiteral(#7, .F., ''1'');
#35=LwsProcedureCall(#28, (), #5);
#36=LwsDecimalLiteral(#8, .F., ''2'');
#37=LwsProcedureCall(#12, (), #41);
#38=LwsProcedureCall(#28, (), #31);
#39=LwsCaseAlternative(#26, (#21), (#15));
#40=LwsProcedureCall(#16, (), #32);
#41=LwsQualifiedIdentifier(#37, .F., ''UPDATE_BIN'', (#24));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCase5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#5, #30);
#2=LwsCaseAlternative(#33, (#14), (#34));
#3=LwsProcedureCall(#25, (), #19);
#4=LwsRaiseStatement(#32, (), #20);
#5=LwsQualifiedIdentifier(#33, .F., ''BIN_NUMBER'', (#1));
#6=LwsProcedureCall(#25, (), #35);
#7=LwsDecimalLiteral(#11, .F., ''2'');
#8=LwsCaseAlternative(#33, (#29), (#13));
#9=LwsDecimalLiteral(#21, .F., ''1'');
#10=LwsArgumentsSelector(#15, #38);
#11=LwsAggregate(#17, .F., (#7));
#12=LwsExpressionChoice(#25, #36);
#13=LwsProcedureCall(#8, (''Label''), #15);
#14=LwsExpressionChoice(#2, #37);
#15=LwsQualifiedIdentifier(#13, .F., ''UPDATE_BIN'', (#10));
#16=LwsOtherChoice(#32);
#17=LwsArgumentsSelector(#35, #11);
#18=LwsDecimalLiteral(#29, .F., ''2'');
#19=LwsQualifiedIdentifier(#3, .F., ''EMPTY_BIN'', (#41));
#20=LwsQualifiedIdentifier(#4, .F., ''ERROR'', ());
#21=LwsAggregate(#31, .F., (#9));
#22=LwsDecimalLiteral(#38, .F., ''2'');
#23=LwsParsingResult($, (#33), $);
#24=LwsQualifiedIdentifier(#30, .F., ''COUNT'', ());
#25=LwsCaseAlternative(#33, (#40, #12), (#3, #6));
#26=LwsDecimalLiteral(#40, .F., ''3'');
#27=LwsDecimalLiteral(#28, .F., ''1'');
#28=LwsAggregate(#41, .F., (#27));
#29=LwsExpressionChoice(#8, #18);
#30=LwsAggregate(#1, .F., (#24));
#31=LwsArgumentsSelector(#39, #21);
#32=LwsCaseAlternative(#33, (#16), (#4));
#33=LwsCaseStatement(#23, (), #5, (#2, #8, #25, #32));
#34=LwsProcedureCall(#2, (), #39);
#35=LwsQualifiedIdentifier(#6, .F., ''EMPTY_BIN'', (#17));
#36=LwsDecimalLiteral(#12, .F., ''4'');
#37=LwsDecimalLiteral(#14, .F., ''1'');
#38=LwsAggregate(#10, .F., (#22));
#39=LwsQualifiedIdentifier(#34, .F., ''UPDATE_BIN'', (#31));
#40=LwsExpressionChoice(#25, #26);
#41=LwsArgumentsSelector(#19, #28);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testChar1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCharacterLiteral(#2, .F., ''A'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testChar2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsCharacterLiteral(#1, .F., '''''''');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma0 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma01 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUnitInterface(#6, #5, ());
#2=LwsCompoundName(#5, (''Ada'', ''Strings'', ''Unbounded''));
#3=LwsParsingResult($, (#6), $);
#4=LwsProcedureDeclaration(#6, (), .F., #7);
#5=LwsWithClause(#1, (#2), (#2));
#6=LwsUnit(#3, .F., (#1), #4);
#7=LwsCompoundName(#4, (''Arr1''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsWithClause(#5, (#10), (#10));
#2=LwsProcedureDeclaration(#9, (), .F., #7);
#3=LwsNamedSelector(#11, ''Strings'');
#4=LwsNamedSelector(#11, ''Unbounded'');
#5=LwsUnitInterface(#9, #1, (#6));
#6=LwsUseClause(#5, (#11), (#11));
#7=LwsCompoundName(#2, (''Arr1''));
#8=LwsParsingResult($, (#9), $);
#9=LwsUnit(#8, .F., (#5), #2);
#10=LwsCompoundName(#1, (''Ada'', ''Strings'', ''Unbounded''));
#11=LwsQualifiedIdentifier(#6, .F., ''Ada'', (#3, #4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#2, (), .F., #3);
#2=LwsUnit(#4, .F., (), #1);
#3=LwsCompoundName(#1, (''Arr1''));
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUnit(#3, .F., (), #2);
#2=LwsProcedureDeclaration(#1, (), .F., #4);
#3=LwsParsingResult($, (#1), $);
#4=LwsCompoundName(#2, (''Arr1''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#4, (), .F., #2);
#2=LwsCompoundName(#1, (''Arr1''));
#3=LwsParsingResult($, (#4), $);
#4=LwsUnit(#3, .F., (), #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCommentPragma5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsWithClause(#5, (#8), (#8));
#2=LwsNamedSelector(#11, ''Strings'');
#3=LwsProcedureDeclaration(#7, (), .F., #10);
#4=LwsNamedSelector(#11, ''Unbounded'');
#5=LwsUnitInterface(#7, #1, (#6));
#6=LwsUseClause(#5, (#11), (#11));
#7=LwsUnit(#9, .F., (#5), #3);
#8=LwsCompoundName(#1, (''Ada'', ''Strings'', ''Unbounded''));
#9=LwsParsingResult($, (#7), $);
#10=LwsCompoundName(#3, (''Arr1''));
#11=LwsQualifiedIdentifier(#6, .F., ''Ada'', (#2, #4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testCompilationUnit3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#15, (), .F., #6);
#2=LwsProcedureDeclaration(#18, (), .F., #8);
#3=LwsNullStatement(#17, ());
#4=LwsBlockBody(#18, (#7), ());
#5=LwsProcedureDeclaration(#12, (), .F., #11);
#6=LwsCompoundName(#1, (''P2''));
#7=LwsProcedureCall(#4, (), #10);
#8=LwsCompoundName(#2, (''Simple1''));
#9=LwsParsingResult($, (#16), $);
#10=LwsQualifiedIdentifier(#7, .F., ''Put'', ());
#11=LwsCompoundName(#5, (''P1''));
#12=LwsSubprogramBody(#18, (), #5, #17);
#13=LwsBlockBody(#15, (#14), ());
#14=LwsNullStatement(#13, ());
#15=LwsSubprogramBody(#18, (), #1, #13);
#16=LwsUnit(#9, .F., (), #18);
#17=LwsBlockBody(#12, (#3), ());
#18=LwsSubprogramBody(#16, (#12, #15), #2, #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testConcat1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCatenationExpression(#6, .F., #2, #4);
#2=LwsCatenationExpression(#1, .F., #5, #3);
#3=LwsStringLiteral(#2, .F., ''to'');
#4=LwsStringLiteral(#1, .F., '' concatenate'');
#5=LwsStringLiteral(#2, .F., ''String '');
#6=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testConditionalEntryCall1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsConditionalEntryCall(#1, (), (#3, #7), (#6));
#3=LwsEntryCall(#2, (), #5);
#4=LwsNamedSelector(#5, ''Seize'');
#5=LwsQualifiedIdentifier(#3, .F., ''R'', (#4));
#6=LwsNullStatement(#2, ());
#7=LwsReturnStatement(#2, (), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#3, #4, $);
#2=LwsParsingResult($, (#3), $);
#3=LwsDerivedType(#2, #1, .F., $);
#4=LwsQualifiedIdentifier(#1, .F., ''COORDINATE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsQualifiedIdentifier(#7, .F., ''DAY'', ());
#3=LwsExplicitRange(#8, .F., #5, #6);
#4=LwsDerivedType(#1, #7, .F., $);
#5=LwsQualifiedIdentifier(#3, .F., ''TUE'', ());
#6=LwsQualifiedIdentifier(#3, .F., ''THU'', ());
#7=LwsSubtypeIndication(#4, #2, #8);
#8=LwsRangeConstraint(#7, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDerivedType(#2, #3, .F., #5);
#2=LwsParsingResult($, (#1), $);
#3=LwsSubtypeIndication(#1, #4, $);
#4=LwsQualifiedIdentifier(#3, .F., ''Plouf'', ());
#5=LwsPrivateRecordType(#1, .F., .F., .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPrivateRecordType(#2, .F., .F., .F.);
#2=LwsDerivedType(#3, #4, .T., #1);
#3=LwsParsingResult($, (#2), $);
#4=LwsSubtypeIndication(#2, #5, $);
#5=LwsQualifiedIdentifier(#4, .F., ''Plouf'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDefinedRecordType(#2, .F., .F., .F., #4);
#2=LwsDerivedType(#3, #7, .F., #1);
#3=LwsParsingResult($, (#2), $);
#4=LwsRecordDefinition(#1, (#5), $);
#5=LwsComponentAttribute(#4, (''temp''), #8, $);
#6=LwsSubtypeIndication(#8, #10, $);
#7=LwsSubtypeIndication(#2, #9, $);
#8=LwsComponentSubtype(#5, .F., #6);
#9=LwsQualifiedIdentifier(#7, .F., ''Plouf'', ());
#10=LwsQualifiedIdentifier(#6, .F., ''float'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDerivedType7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDefinedRecordType(#2, .F., .F., .F., #6);
#2=LwsDerivedType(#3, #4, .T., #1);
#3=LwsParsingResult($, (#2), $);
#4=LwsSubtypeIndication(#2, #5, $);
#5=LwsQualifiedIdentifier(#4, .F., ''Plouf'', ());
#6=LwsRecordDefinition(#1, (#7), $);
#7=LwsComponentAttribute(#6, (''temp''), #9, $);
#8=LwsSubtypeIndication(#9, #10, $);
#9=LwsComponentSubtype(#7, .F., #8);
#10=LwsQualifiedIdentifier(#8, .F., ''float'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testDiv1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#4, .F., ''10'');
#2=LwsParsingResult($, (#4), $);
#3=LwsQualifiedIdentifier(#4, .F., ''x'', ());
#4=LwsDivExpression(#2, .F., #3, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testEnumerationType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#5), $);
#2=LwsStringEnumerationId(#5, ''green'');
#3=LwsStringEnumerationId(#5, ''red'');
#4=LwsStringEnumerationId(#5, ''black'');
#5=LwsEnumerationType(#1, (#2, #3, #4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testEnumerationType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEnumerationType(#4, (#5, #3, #2));
#2=LwsCharacterEnumerationId(#1, $);
#3=LwsCharacterEnumerationId(#1, $);
#4=LwsParsingResult($, (#1), $);
#5=LwsCharacterEnumerationId(#1, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testEnumerationType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCharacterEnumerationId(#8, $);
#2=LwsStringEnumerationId(#8, ''NONE'');
#3=LwsCharacterEnumerationId(#8, $);
#4=LwsStringEnumerationId(#8, ''B'');
#5=LwsCharacterEnumerationId(#8, $);
#6=LwsCharacterEnumerationId(#8, $);
#7=LwsParsingResult($, (#8), $);
#8=LwsEnumerationType(#7, (#6, #9, #1, #4, #2, #3, #5));
#9=LwsCharacterEnumerationId(#8, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testExceptionDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExceptionDeclaration(#2, (''INPUT_ERROR''));
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testExceptionDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsExceptionDeclaration(#1, (''INPUT_ERROR'', ''OUTPUT_ERROR''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testExceptionRenamingDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExceptionDeclaration(#4, (''FULL''));
#2=LwsQualifiedIdentifier(#4, .F., ''TABLE_MANAGER'', (#3));
#3=LwsNamedSelector(#2, ''TABLE_FULL'');
#4=LwsExceptionRenamingDeclaration(#5, #2, #1, #1);
#5=LwsParsingResult($, (#4), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testExpon1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsQualifiedIdentifier(#3, .F., ''x'', ());
#3=LwsExpoExpression(#1, .F., #2, #4);
#4=LwsDecimalLiteral(#3, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFixedFloatType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''0.125'');
#2=LwsDecimalLiteral(#6, .F., ''0.0'');
#3=LwsOrdinaryFixedType(#4, #5, #1);
#4=LwsParsingResult($, (#3), $);
#5=LwsRangeConstraint(#3, #6);
#6=LwsExplicitRange(#5, .F., #2, #7);
#7=LwsDecimalLiteral(#6, .F., ''255.0'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFixedFloatType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#7, .F., ''1.0'');
#2=LwsQualifiedIdentifier(#5, .F., ''DEL'', ());
#3=LwsQualifiedIdentifier(#4, .F., ''DEL'', ());
#4=LwsOrdinaryFixedType(#8, #9, #3);
#5=LwsMinusExpression(#10, .F., #6, #2);
#6=LwsDecimalLiteral(#5, .F., ''1.0'');
#7=LwsNegativeExpression(#10, .F., #1);
#8=LwsParsingResult($, (#4), $);
#9=LwsRangeConstraint(#4, #10);
#10=LwsExplicitRange(#9, .F., #7, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFixedFloatType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsOrdinaryFixedType(#1, $, #3);
#3=LwsDecimalLiteral(#2, .F., ''1.0'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFloatType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFloatingType(#3, $, #2);
#2=LwsDecimalLiteral(#1, .F., ''10'');
#3=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFloatType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsExplicitRange(#8, .F., #7, #4);
#3=LwsFloatingType(#1, #8, #5);
#4=LwsDecimalLiteral(#2, .F., ''1.0'');
#5=LwsDecimalLiteral(#3, .F., ''10'');
#6=LwsDecimalLiteral(#7, .F., ''1.0'');
#7=LwsNegativeExpression(#2, .F., #6);
#8=LwsRangeConstraint(#3, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFloatType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#4, .F., ''7'');
#2=LwsParsingResult($, (#4), $);
#3=LwsRangeConstraint(#4, #5);
#4=LwsFloatingType(#2, #3, #1);
#5=LwsExplicitRange(#3, .F., #6, #7);
#6=LwsDecimalLiteral(#5, .F., ''0.0'');
#7=LwsDecimalLiteral(#5, .F., ''1.0E35'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFunctionDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#4, (''RANDOM''));
#2=LwsQualifiedIdentifier(#4, .F., ''PROBABILITY'', ());
#3=LwsParsingResult($, (#4), $);
#4=LwsFunctionDeclaration(#3, (), .F., #1, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testFunctionDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#3, (''X''), $, #2, $);
#2=LwsQualifiedIdentifier(#1, .F., ''LINK'', ());
#3=LwsFunctionDeclaration(#5, (#1), .F., #4, #6);
#4=LwsCompoundName(#3, (''MIN_CELL''));
#5=LwsParsingResult($, (#3), $);
#6=LwsQualifiedIdentifier(#3, .F., ''CELL'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#13, (''Unit''));
#2=LwsPackagePart(#26, ());
#3=LwsQualifiedIdentifier(#13, .F., ''Set'', ());
#4=LwsCompoundName(#9, (''Empty''));
#5=LwsGenericPackageDeclaration(#22, (#27, #15, #28, #19, #20), #10, #10);
#6=LwsPrivateTypeDeclaration(#27, ''Element'', $, #8, #8);
#7=LwsCompoundName(#17, (''Union''));
#8=LwsPrivateTypeDefinition(#6, .F., .F.);
#9=LwsFunctionDeclaration(#28, (), .F., #4, #11);
#10=LwsPackageDeclaration(#5, #25, #26);
#11=LwsQualifiedIdentifier(#9, .F., ''Set'', ());
#12=LwsPrivateTypeDeclaration(#15, ''Set'', $, #16, #16);
#13=LwsFunctionDeclaration(#19, (#21), .F., #1, #3);
#14=LwsQualifiedIdentifier(#21, .F., ''Element'', ());
#15=LwsGenericFormalType(#5, #12);
#16=LwsPrivateTypeDefinition(#12, .F., .F.);
#17=LwsFunctionDeclaration(#20, (#18), .F., #7, #24);
#18=LwsFormalParameter(#17, (''S'', ''T''), $, #23, $);
#19=LwsGenericFormalFunction(#5, #13, $, #13);
#20=LwsGenericFormalFunction(#5, #17, $, #17);
#21=LwsFormalParameter(#13, (''E''), $, #14, $);
#22=LwsParsingResult($, (#5), $);
#23=LwsQualifiedIdentifier(#18, .F., ''Set'', ());
#24=LwsQualifiedIdentifier(#17, .F., ''Set'', ());
#25=LwsCompoundName(#10, (''Set_Signature''));
#26=LwsPackageDefinition(#10, #2, $);
#27=LwsGenericFormalType(#5, #6);
#28=LwsGenericFormalFunction(#5, #9, $, #9);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#10, (''Apply_To_All''));
#2=LwsCompoundName(#4, (''Generic_Bag''));
#3=LwsGenericFormalProcedure(#14, #17, $, #17);
#4=LwsPackageDeclaration(#23, #2, #16);
#5=LwsQualifiedIdentifier(#22, .F., ''Element_Type'', ());
#6=LwsGenericDiscriminant(#7);
#7=LwsPrivateTypeDeclaration(#8, ''Element_Type'', #6, #21, #21);
#8=LwsGenericFormalType(#23, #7);
#9=LwsCompoundName(#17, (''Operator''));
#10=LwsProcedureDeclaration(#14, (#12), .F., #1);
#11=LwsPrivateTypeDefinition(#19, .F., .F.);
#12=LwsFormalParameter(#10, (''B''), .inputOutputMode., #15, $);
#13=LwsPackagePart(#16, (#19, #14));
#14=LwsGenericSubprogramDeclaration(#13, (#3), #10, #10);
#15=LwsQualifiedIdentifier(#12, .F., ''Bag'', ());
#16=LwsPackageDefinition(#4, #13, #20);
#17=LwsProcedureDeclaration(#3, (#22), .F., #9);
#18=LwsParsingResult($, (#23), $);
#19=LwsPrivateTypeDeclaration(#13, ''Bag'', $, #11, #11);
#20=LwsPackagePart(#16, ());
#21=LwsPrivateTypeDefinition(#7, .F., .F.);
#22=LwsFormalParameter(#17, (''S''), .inputOutputMode., #5, $);
#23=LwsGenericPackageDeclaration(#18, (#8), #4, #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackageDefinition(#9, #17, $);
#2=LwsGenericPackageDeclaration(#8, (), #9, #9);
#3=LwsProcedureDeclaration(#17, (#12, #4), .F., #16);
#4=LwsFormalParameter(#3, (''To_File''), .inputMode., #10, $);
#5=LwsQualifiedIdentifier(#11, .F., ''Map'', ());
#6=LwsQualifiedIdentifier(#12, .F., ''Map'', ());
#7=LwsQualifiedIdentifier(#14, .F., ''String'', ());
#8=LwsParsingResult($, (#2), $);
#9=LwsPackageDeclaration(#2, #15, #1);
#10=LwsQualifiedIdentifier(#4, .F., ''String'', ());
#11=LwsFormalParameter(#13, (''Item''), .outputMode., #5, $);
#12=LwsFormalParameter(#3, (''Item''), .inputMode., #6, $);
#13=LwsProcedureDeclaration(#17, (#11, #14), .F., #18);
#14=LwsFormalParameter(#13, (''From_File''), .inputMode., #7, $);
#15=LwsCompoundName(#9, (''Generic_Hash_Map'', ''Serializer''));
#16=LwsCompoundName(#3, (''Dump''));
#17=LwsPackagePart(#1, (#3, #13));
#18=LwsCompoundName(#13, (''Restore''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#10, .F., ''ITEM'', ());
#2=LwsGenericFormalFunction(#19, #17, $, #17);
#3=LwsQualifiedIdentifier(#23, .F., ''ITEM'', ());
#4=LwsArrayType(#32, (#28), #11);
#5=LwsGenericFormalType(#19, #32);
#6=LwsCompoundName(#37, (''ON_VECTORS''));
#7=LwsQualifiedIdentifier(#13, .F., ''VECTOR'', ());
#8=LwsGenericFormalType(#19, #35);
#9=LwsAnyType(#35, .T.);
#10=LwsFunctionDeclaration(#12, (#15), .F., #18, #1);
#11=LwsComponentSubtype(#4, .F., #21);
#12=LwsPackagePart(#29, (#13, #10, #30));
#13=LwsFunctionDeclaration(#12, (#16), .F., #14, #7);
#14=LwsCompoundName(#13, (''SUM''));
#15=LwsFormalParameter(#10, (''A''), $, #31, $);
#16=LwsFormalParameter(#13, (''A'', ''B''), $, #33, $);
#17=LwsOperatorOverloadDeclaration(#2, (#23), .F., #26, #36, #26);
#18=LwsCompoundName(#10, (''SIGMA''));
#19=LwsGenericPackageDeclaration(#22, (#24, #8, #5, #2), #37, #37);
#20=LwsQualifiedIdentifier(#28, .F., ''INDEX'', ());
#21=LwsSubtypeIndication(#11, #27, $);
#22=LwsParsingResult($, (#19), $);
#23=LwsFormalParameter(#17, (''X'', ''Y''), $, #3, $);
#24=LwsGenericFormalType(#19, #25);
#25=LwsPrivateTypeDeclaration(#24, ''ITEM'', $, #34, #34);
#26=LwsStringDesignator(#17, ''"<"'');
#27=LwsQualifiedIdentifier(#21, .F., ''ITEM'', ());
#28=LwsIndex(#4, #20);
#29=LwsPackageDefinition(#37, #12, $);
#30=LwsExceptionDeclaration(#12, (''LENGTH_ERROR''));
#31=LwsQualifiedIdentifier(#15, .F., ''VECTOR'', ());
#32=LwsFullTypeDeclaration(#5, ''ROW'', $, #4);
#33=LwsQualifiedIdentifier(#16, .F., ''VECTOR'', ());
#34=LwsPrivateTypeDefinition(#25, .F., .F.);
#35=LwsFullTypeDeclaration(#8, ''INDEX'', $, #9);
#36=LwsQualifiedIdentifier(#17, .F., ''BOOLEAN'', ());
#37=LwsPackageDeclaration(#19, #6, #29);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGenericFormalType(#20, #6);
#2=LwsSubtypeIndication(#9, #18, $);
#3=LwsRecordDefinition(#12, (#11), $);
#4=LwsCompoundName(#16, (''G2''));
#5=LwsPrivateTypeDeclaration(#22, ''Parent'', $, #13, #13);
#6=LwsPrivateTypeDeclaration(#1, ''Comp'', $, #14, #14);
#7=LwsPackageDefinition(#16, #17, $);
#8=LwsQualifiedIdentifier(#15, .F., ''Comp'', ());
#9=LwsDerivedType(#21, #2, .F., #12);
#10=LwsParsingResult($, (#20), $);
#11=LwsComponentAttribute(#3, (''C''), #19, $);
#12=LwsDefinedRecordType(#9, .F., .F., .F., #3);
#13=LwsPrivateTypeDefinition(#5, .T., .T.);
#14=LwsPrivateTypeDefinition(#6, .F., .T.);
#15=LwsSubtypeIndication(#19, #8, $);
#16=LwsPackageDeclaration(#20, #4, #7);
#17=LwsPackagePart(#7, (#21));
#18=LwsQualifiedIdentifier(#2, .F., ''Parent'', ());
#19=LwsComponentSubtype(#11, .F., #15);
#20=LwsGenericPackageDeclaration(#10, (#22, #1), #16, #16);
#21=LwsFullTypeDeclaration(#17, ''Extension'', $, #9);
#22=LwsGenericFormalType(#20, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPrivateTypeDeclaration(#2, ''Element_T'', $, #4, #4);
#2=LwsGenericFormalType(#8, #1);
#3=LwsCompoundName(#9, (''Swap''));
#4=LwsPrivateTypeDefinition(#1, .F., .F.);
#5=LwsFormalParameter(#9, (''X'', ''Y''), .inputOutputMode., #7, $);
#6=LwsParsingResult($, (#8), $);
#7=LwsQualifiedIdentifier(#5, .F., ''Element_T'', ());
#8=LwsGenericSubprogramDeclaration(#6, (#2), #9, #9);
#9=LwsProcedureDeclaration(#8, (#5), .F., #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#9, .F., ''1'');
#2=LwsDecimalLiteral(#10, .F., ''1'');
#3=LwsQualifiedIdentifier(#9, .F., ''Size'', ());
#4=LwsQualifiedIdentifier(#21, .F., ''Natural'', ());
#5=LwsQualifiedIdentifier(#10, .F., ''Size'', ());
#6=LwsQualifiedIdentifier(#18, .F., ''Integer'', ());
#7=LwsRangeConstraint(#18, #23);
#8=LwsRangeIntegerType(#29, #31);
#9=LwsExplicitRange(#33, .F., #1, #3);
#10=LwsExplicitRange(#31, .F., #2, #5);
#11=LwsCompoundName(#24, (''P''));
#12=LwsPackagePart(#16, (#13, #29, #20, #14));
#13=LwsFullTypeDeclaration(#12, ''T1'', $, #30);
#14=LwsSubtypeDeclaration(#12, ''T4'', #18);
#15=LwsParsingResult($, (#25), $);
#16=LwsPackageDefinition(#24, #12, $);
#17=LwsGenericFormalParameter(#25, #21);
#18=LwsSubtypeIndication(#14, #6, #7);
#19=LwsDecimalLiteral(#23, .F., ''1'');
#20=LwsFullTypeDeclaration(#12, ''T3'', $, #27);
#21=LwsFormalParameter(#17, (''Size''), .inputMode., #4, #26);
#22=LwsQualifiedIdentifier(#23, .F., ''Size'', ());
#23=LwsExplicitRange(#7, .F., #19, #22);
#24=LwsPackageDeclaration(#25, #11, #16);
#25=LwsGenericPackageDeclaration(#15, (#17), #24, #24);
#26=LwsDecimalLiteral(#21, .F., ''0'');
#27=LwsDerivedType(#20, #28, .F., $);
#28=LwsSubtypeIndication(#27, #32, #33);
#29=LwsFullTypeDeclaration(#12, ''T2'', $, #8);
#30=LwsModIntegerType(#13, #34);
#31=LwsRangeConstraint(#8, #10);
#32=LwsQualifiedIdentifier(#28, .F., ''Integer'', ());
#33=LwsRangeConstraint(#28, #9);
#34=LwsQualifiedIdentifier(#30, .F., ''Size'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#3, (#15, #13, #17, #2), .F., #6);
#2=LwsFormalParameter(#1, (''Index''), .outputMode., #14, $);
#3=LwsGenericSubprogramDeclaration(#24, (#7, #18), #1, #1);
#4=LwsPrivateTypeDeclaration(#7, ''Element_Type'', $, #5, #5);
#5=LwsPrivateTypeDefinition(#4, .F., .F.);
#6=LwsCompoundName(#1, (''Search''));
#7=LwsGenericFormalType(#3, #4);
#8=LwsFormalParameter(#10, (''Left''), .inputMode., #9, $);
#9=LwsQualifiedIdentifier(#8, .F., ''Element_Type'', ());
#10=LwsOperatorOverloadDeclaration(#18, (#8, #23), .F., #20, #12, #20);
#11=LwsQualifiedIdentifier(#23, .F., ''Element_Type'', ());
#12=LwsQualifiedIdentifier(#10, .F., ''Boolean'', ());
#13=LwsFormalParameter(#1, (''Search''), .inputMode., #16, $);
#14=LwsQualifiedIdentifier(#2, .F., ''Index_Type'', (#19));
#15=LwsFormalParameter(#1, (''Elements''), .inputMode., #21, $);
#16=LwsQualifiedIdentifier(#13, .F., ''Element_Type'', ());
#17=LwsFormalParameter(#1, (''Found''), .outputMode., #22, $);
#18=LwsGenericFormalFunction(#3, #10, #25, #10);
#19=LwsNamedAttribute(#14, ''Base'');
#20=LwsStringDesignator(#10, ''"<"'');
#21=LwsQualifiedIdentifier(#15, .F., ''Array_Type'', ());
#22=LwsQualifiedIdentifier(#17, .F., ''Boolean'', ());
#23=LwsFormalParameter(#10, (''Right''), .inputMode., #11, $);
#24=LwsParsingResult($, (#3), $);
#25=LwsGenericSubprogramDefault(#18, #26);
#26=LwsAnyExpression(#25, .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#8, .F., ''Q'', (#7));
#2=LwsGenericPackageDeclaration(#11, (#8, #3), #17, #17);
#3=LwsGenericFormalPackage(#2, ''P2'', #4, .F.);
#4=LwsQualifiedIdentifier(#3, .F., ''Q'', ());
#5=LwsPackageDefinition(#17, #20, $);
#6=LwsQualifiedIdentifier(#15, .F., ''Param2'', ());
#7=LwsArgumentsSelector(#1, #10);
#8=LwsGenericFormalPackage(#2, ''P1'', #1, .F.);
#9=LwsQualifiedIdentifier(#14, .F., ''Y'', ());
#10=LwsAggregate(#7, .F., (#16, #14));
#11=LwsParsingResult($, (#2), $);
#12=LwsQualifiedIdentifier(#18, .F., ''Param1'', ());
#13=LwsQualifiedIdentifier(#16, .F., ''X'', ());
#14=LwsComponentAssociation(#10, #9, (#15));
#15=LwsExpressionChoice(#14, #6);
#16=LwsComponentAssociation(#10, #13, (#18));
#17=LwsPackageDeclaration(#2, #19, #5);
#18=LwsExpressionChoice(#16, #12);
#19=LwsCompoundName(#17, (''A''));
#20=LwsPackagePart(#5, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGenericPackageDeclaration(#2, (#4), #3, #3);
#2=LwsParsingResult($, (#1), $);
#3=LwsPackageDeclaration(#1, #5, #7);
#4=LwsGenericFormalPackage(#1, ''P'', #6, .T.);
#5=LwsCompoundName(#3, (''A''));
#6=LwsQualifiedIdentifier(#4, .F., ''A'', ());
#7=LwsPackageDefinition(#3, #8, $);
#8=LwsPackagePart(#7, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericDeclaration9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackageDeclaration(#7, #3, #10);
#2=LwsPrivateTypeDefinition(#17, .F., .F.);
#3=LwsCompoundName(#1, (''Bag_Of_Strings''));
#4=LwsPackagePart(#10, (#17, #12));
#5=LwsFormalParameter(#11, (''B''), .inputOutputMode., #14, $);
#6=LwsFormalParameter(#8, (''S''), .inputOutputMode., #15, $);
#7=LwsParsingResult($, (#1), $);
#8=LwsProcedureDeclaration(#13, (#6), .F., #18);
#9=LwsPackagePart(#10, ());
#10=LwsPackageDefinition(#1, #4, #9);
#11=LwsProcedureDeclaration(#12, (#5), .F., #16);
#12=LwsGenericSubprogramDeclaration(#4, (#13), #11, #11);
#13=LwsGenericFormalProcedure(#12, #8, $, #8);
#14=LwsQualifiedIdentifier(#5, .F., ''Bag'', ());
#15=LwsQualifiedIdentifier(#6, .F., ''String'', ());
#16=LwsCompoundName(#11, (''Apply_To_All''));
#17=LwsPrivateTypeDeclaration(#4, ''Bag'', $, #2, #2);
#18=LwsCompoundName(#8, (''Operator''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExpressionChoice(#10, #6);
#2=LwsArgumentsSelector(#11, #4);
#3=LwsProcedureDeclaration(#7, (), .F., #8);
#4=LwsAggregate(#2, .F., (#10));
#5=LwsParsingResult($, (#7), $);
#6=LwsQualifiedIdentifier(#1, .F., ''ELEM'', ());
#7=LwsGenericSubprogramInstanciation(#5, #11, #3);
#8=LwsCompoundName(#3, (''SWAP''));
#9=LwsQualifiedIdentifier(#10, .F., ''INTEGER'', ());
#10=LwsComponentAssociation(#4, #9, (#1));
#11=LwsQualifiedIdentifier(#7, .F., ''EXCHANGE'', (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#5, #7);
#2=LwsQualifiedIdentifier(#7, .F., ''CHARACTER'', ());
#3=LwsParsingResult($, (#4), $);
#4=LwsGenericSubprogramInstanciation(#3, #5, #6);
#5=LwsQualifiedIdentifier(#4, .F., ''EXCHANGE'', (#1));
#6=LwsProcedureDeclaration(#4, (), .F., #8);
#7=LwsAggregate(#1, .F., (#2));
#8=LwsCompoundName(#6, (''SWAP''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#7, (''SQUARE''));
#2=LwsArgumentsSelector(#6, #8);
#3=LwsQualifiedIdentifier(#8, .F., ''INTEGER'', ());
#4=LwsParsingResult($, (#5), $);
#5=LwsGenericSubprogramInstanciation(#4, #6, #7);
#6=LwsQualifiedIdentifier(#5, .F., ''SQUARING'', (#2));
#7=LwsFunctionDeclaration(#5, (), .F., #1, $);
#8=LwsAggregate(#2, .F., (#3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#14, .F., ''SQUARING'', (#4));
#2=LwsComponentAssociation(#8, #3, (#11));
#3=LwsQualifiedIdentifier(#2, .F., ''MATRIX'', ());
#4=LwsArgumentsSelector(#1, #8);
#5=LwsComponentAssociation(#8, #7, (#6));
#6=LwsExpressionChoice(#5, #9);
#7=LwsQualifiedIdentifier(#5, .F., ''MATRIX_PRODUCT'', ());
#8=LwsAggregate(#4, .F., (#2, #5));
#9=LwsStringLiteral(#6, .F., ''*'');
#10=LwsFunctionDeclaration(#14, (), .F., #12, $);
#11=LwsExpressionChoice(#2, #15);
#12=LwsCompoundName(#10, (''SQUARE''));
#13=LwsParsingResult($, (#14), $);
#14=LwsGenericSubprogramInstanciation(#13, #1, #10);
#15=LwsQualifiedIdentifier(#11, .F., ''ITEM'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#8, .F., ''SQUARING'', (#6));
#2=LwsCompoundName(#9, (''SQUARE''));
#3=LwsQualifiedIdentifier(#5, .F., ''MATRIX_PRODUCT'', ());
#4=LwsQualifiedIdentifier(#5, .F., ''MATRIX'', ());
#5=LwsAggregate(#6, .F., (#4, #3));
#6=LwsArgumentsSelector(#1, #5);
#7=LwsParsingResult($, (#8), $);
#8=LwsGenericSubprogramInstanciation(#7, #1, #9);
#9=LwsFunctionDeclaration(#8, (), .F., #2, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#2, .F., (#8, #3, #6));
#2=LwsArgumentsSelector(#5, #1);
#3=LwsQualifiedIdentifier(#1, .F., ''TABLE'', ());
#4=LwsParsingResult($, (#7), $);
#5=LwsQualifiedIdentifier(#7, .F., ''ON_VECTORS'', (#2));
#6=LwsStringLiteral(#1, .F., ''+'');
#7=LwsGenericPackageInstanciation(#4, #5, #9);
#8=LwsQualifiedIdentifier(#1, .F., ''INTEGER'', ());
#9=LwsCompoundName(#7, (''INT_VECTORS''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#14, .F., ''A'', ());
#2=LwsComponentAssociation(#12, #3, (#14));
#3=LwsQualifiedIdentifier(#2, .F., ''BOOLEAN'', ());
#4=LwsExpressionChoice(#5, #9);
#5=LwsComponentAssociation(#12, #10, (#4));
#6=LwsQualifiedIdentifier(#11, .F., ''G'', (#8));
#7=LwsParsingResult($, (#11), $);
#8=LwsArgumentsSelector(#6, #12);
#9=LwsQualifiedIdentifier(#4, .F., ''B'', ());
#10=LwsQualifiedIdentifier(#5, .F., ''BOOLEAN'', ());
#11=LwsGenericPackageInstanciation(#7, #6, #13);
#12=LwsAggregate(#8, .F., (#2, #5));
#13=LwsCompoundName(#11, (''P''));
#14=LwsExpressionChoice(#2, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericInstanciation8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGenericPackageInstanciation(#14, #10, #4);
#2=LwsAggregate(#12, .F., (#6, #9));
#3=LwsExpressionChoice(#6, #5);
#4=LwsCompoundName(#1, (''A'', ''P'', ''L''));
#5=LwsQualifiedIdentifier(#3, .F., ''A'', ());
#6=LwsComponentAssociation(#2, #7, (#3));
#7=LwsQualifiedIdentifier(#6, .F., ''BOOLEAN'', ());
#8=LwsExpressionChoice(#9, #11);
#9=LwsComponentAssociation(#2, #13, (#8));
#10=LwsQualifiedIdentifier(#1, .F., ''G'', (#12));
#11=LwsQualifiedIdentifier(#8, .F., ''B'', ());
#12=LwsArgumentsSelector(#10, #2);
#13=LwsQualifiedIdentifier(#9, .F., ''BOOLEAN'', ());
#14=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAnyType(#2, .T.);
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAnyType(#2, .F.);
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsAnyRangeType(#1, .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAnyExpression(#2, .F.);
#2=LwsModIntegerType(#3, #1);
#3=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsAnyExpression(#3, .F.);
#3=LwsOrdinaryFixedType(#1, $, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAnyExpression(#2, .F.);
#2=LwsDecimalFixedType(#4, $, #3, #1);
#3=LwsAnyExpression(#2, .F.);
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGenericTypeDef7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFloatingType(#2, $, #3);
#2=LwsParsingResult($, (#1), $);
#3=LwsAnyExpression(#1, .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testGoto1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGotoStatement(#5, (), ''HERE'');
#2=LwsQualifiedIdentifier(#17, .F., ''LINE_FULL'', ());
#3=LwsRaiseStatement(#7, (), #11);
#4=LwsQualifiedIdentifier(#18, .F., ''ITEM'', ());
#5=LwsIfStatement(#6, (''HERE''), (#7, #17), (#21, #1));
#6=LwsParsingResult($, (#5), $);
#7=LwsIfClause(#5, #14, (#3));
#8=LwsProcedureCall(#17, (), #10);
#9=LwsArgumentsSelector(#15, #18);
#10=LwsQualifiedIdentifier(#8, .F., ''PUT'', (#13));
#11=LwsQualifiedIdentifier(#3, .F., ''LAYOUT_ERROR'', ());
#12=LwsProcedureCall(#17, (), #19);
#13=LwsArgumentsSelector(#10, #16);
#14=LwsQualifiedIdentifier(#7, .F., ''LINE_TOO_SHORT'', ());
#15=LwsQualifiedIdentifier(#21, .F., ''PUT'', (#9));
#16=LwsAggregate(#13, .F., (#20));
#17=LwsIfClause(#5, #2, (#12, #8));
#18=LwsAggregate(#9, .F., (#4));
#19=LwsQualifiedIdentifier(#12, .F., ''NEW_LINE'', ());
#20=LwsQualifiedIdentifier(#16, .F., ''ITEM'', ());
#21=LwsProcedureCall(#5, (), #15);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAndExpression(#11, .F., #19, #7);
#2=LwsQualifiedIdentifier(#19, .F., ''DECEMBER'', ());
#3=LwsAssignment(#11, (), #20, #8);
#4=LwsDecimalLiteral(#6, .F., ''1'');
#5=LwsQualifiedIdentifier(#7, .F., ''DAY'', ());
#6=LwsPlusExpression(#14, .F., #15, #4);
#7=LwsEqualExpression(#1, .F., #5, #9);
#8=LwsQualifiedIdentifier(#3, .F., ''JANUARY'', ());
#9=LwsDecimalLiteral(#7, .F., ''31'');
#10=LwsParsingResult($, (#16), $);
#11=LwsIfClause(#16, #1, (#3, #13, #14));
#12=LwsQualifiedIdentifier(#13, .F., ''DAY'', ());
#13=LwsAssignment(#11, (), #12, #18);
#14=LwsAssignment(#11, (), #17, #6);
#15=LwsQualifiedIdentifier(#6, .F., ''YEAR'', ());
#16=LwsIfStatement(#10, (), (#11), $);
#17=LwsQualifiedIdentifier(#14, .F., ''YEAR'', ());
#18=LwsDecimalLiteral(#13, .F., ''1'');
#19=LwsEqualExpression(#1, .F., #21, #2);
#20=LwsQualifiedIdentifier(#3, .F., ''MONTH'', ());
#21=LwsQualifiedIdentifier(#19, .F., ''MONTH'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRaiseStatement(#9, (), #2);
#2=LwsQualifiedIdentifier(#1, .F., ''LAYOUT_ERROR'', ());
#3=LwsIfStatement(#8, (), (#9, #16), (#13));
#4=LwsQualifiedIdentifier(#13, .F., ''PUT'', (#7));
#5=LwsQualifiedIdentifier(#12, .F., ''ITEM'', ());
#6=LwsAggregate(#7, .F., (#19));
#7=LwsArgumentsSelector(#4, #6);
#8=LwsParsingResult($, (#3), $);
#9=LwsIfClause(#3, #18, (#1));
#10=LwsProcedureCall(#16, (), #20);
#11=LwsProcedureCall(#16, (), #15);
#12=LwsAggregate(#14, .F., (#5));
#13=LwsProcedureCall(#3, (), #4);
#14=LwsArgumentsSelector(#15, #12);
#15=LwsQualifiedIdentifier(#11, .F., ''PUT'', (#14));
#16=LwsIfClause(#3, #17, (#10, #11));
#17=LwsQualifiedIdentifier(#16, .F., ''LINE_FULL'', ());
#18=LwsQualifiedIdentifier(#9, .F., ''LINE_TOO_SHORT'', ());
#19=LwsQualifiedIdentifier(#6, .F., ''ITEM'', ());
#20=LwsQualifiedIdentifier(#10, .F., ''NEW_LINE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''DECEMBER'', ());
#2=LwsAssignment(#17, (), #31, #25);
#3=LwsQualifiedIdentifier(#6, .F., ''MONTH'', ());
#4=LwsIfStatement(#16, (), (#17, #18), (#20, #34));
#5=LwsAssignment(#17, (), #28, #9);
#6=LwsEqualExpression(#11, .F., #3, #30);
#7=LwsAssignment(#18, (), #19, #1);
#8=LwsQualifiedIdentifier(#20, .F., ''MONTH'', ());
#9=LwsDecimalLiteral(#5, .F., ''1'');
#10=LwsDecimalLiteral(#25, .F., ''1'');
#11=LwsAndExpression(#18, .F., #6, #12);
#12=LwsEqualExpression(#11, .F., #36, #15);
#13=LwsQualifiedIdentifier(#33, .F., ''DAY'', ());
#14=LwsDecimalLiteral(#34, .F., ''1'');
#15=LwsDecimalLiteral(#12, .F., ''30'');
#16=LwsParsingResult($, (#4), $);
#17=LwsIfClause(#4, #32, (#29, #5, #2));
#18=LwsIfClause(#4, #11, (#7));
#19=LwsQualifiedIdentifier(#7, .F., ''MONTH'', ());
#20=LwsAssignment(#4, (), #8, #38);
#21=LwsQualifiedIdentifier(#34, .F., ''DAY'', ());
#22=LwsQualifiedIdentifier(#25, .F., ''YEAR'', ());
#23=LwsDecimalLiteral(#33, .F., ''31'');
#24=LwsQualifiedIdentifier(#27, .F., ''MONTH'', ());
#25=LwsPlusExpression(#2, .F., #22, #10);
#26=LwsQualifiedIdentifier(#29, .F., ''MONTH'', ());
#27=LwsEqualExpression(#32, .F., #24, #35);
#28=LwsQualifiedIdentifier(#5, .F., ''DAY'', ());
#29=LwsAssignment(#17, (), #26, #37);
#30=LwsQualifiedIdentifier(#6, .F., ''NOVEMBER'', ());
#31=LwsQualifiedIdentifier(#2, .F., ''YEAR'', ());
#32=LwsAndExpression(#17, .F., #27, #33);
#33=LwsEqualExpression(#32, .F., #13, #23);
#34=LwsAssignment(#4, (), #21, #14);
#35=LwsQualifiedIdentifier(#27, .F., ''DECEMBER'', ());
#36=LwsQualifiedIdentifier(#12, .F., ''DAY'', ());
#37=LwsQualifiedIdentifier(#29, .F., ''JANUARY'', ());
#38=LwsQualifiedIdentifier(#20, .F., ''OCTOBER'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf31 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAssignment(#37, (), #22, #5);
#2=LwsPlusExpression(#23, .F., #34, #3);
#3=LwsDecimalLiteral(#2, .F., ''1'');
#4=LwsQualifiedIdentifier(#7, .F., ''MONTH'', ());
#5=LwsDecimalLiteral(#1, .F., ''1'');
#6=LwsQualifiedIdentifier(#26, .F., ''NOVEMBER'', ());
#7=LwsAssignment(#24, (), #4, #17);
#8=LwsIfClause(#24, #30, (#28));
#9=LwsEqualExpression(#15, .F., #19, #29);
#10=LwsQualifiedIdentifier(#16, .F., ''DAY'', ());
#11=LwsAssignment(#37, (), #20, #32);
#12=LwsQualifiedIdentifier(#28, .F., ''MONTH'', ());
#13=LwsAssignment(#24, (), #14, #33);
#14=LwsQualifiedIdentifier(#13, .F., ''DAY'', ());
#15=LwsAndExpression(#37, .F., #9, #16);
#16=LwsEqualExpression(#15, .F., #10, #18);
#17=LwsQualifiedIdentifier(#7, .F., ''OCTOBER'', ());
#18=LwsDecimalLiteral(#16, .F., ''31'');
#19=LwsQualifiedIdentifier(#9, .F., ''MONTH'', ());
#20=LwsQualifiedIdentifier(#11, .F., ''MONTH'', ());
#21=LwsQualifiedIdentifier(#28, .F., ''DECEMBER'', ());
#22=LwsQualifiedIdentifier(#1, .F., ''DAY'', ());
#23=LwsAssignment(#37, (), #25, #2);
#24=LwsIfStatement(#36, (), (#37, #8), (#7, #13));
#25=LwsQualifiedIdentifier(#23, .F., ''YEAR'', ());
#26=LwsEqualExpression(#30, .F., #38, #6);
#27=LwsQualifiedIdentifier(#31, .F., ''DAY'', ());
#28=LwsAssignment(#8, (), #12, #21);
#29=LwsQualifiedIdentifier(#9, .F., ''DECEMBER'', ());
#30=LwsAndExpression(#8, .F., #26, #31);
#31=LwsEqualExpression(#30, .F., #27, #35);
#32=LwsQualifiedIdentifier(#11, .F., ''JANUARY'', ());
#33=LwsDecimalLiteral(#13, .F., ''1'');
#34=LwsQualifiedIdentifier(#2, .F., ''YEAR'', ());
#35=LwsDecimalLiteral(#31, .F., ''30'');
#36=LwsParsingResult($, (#24), $);
#37=LwsIfClause(#24, #15, (#11, #1, #23));
#38=LwsQualifiedIdentifier(#26, .F., ''MONTH'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsIfStatement(#6, (), (#14, #16), $);
#2=LwsEqualExpression(#14, .F., #12, #3);
#3=LwsDecimalLiteral(#2, .F., ''1'');
#4=LwsAssignment(#16, (), #13, #11);
#5=LwsAssignment(#14, (), #8, #7);
#6=LwsParsingResult($, (#1), $);
#7=LwsDecimalLiteral(#5, .F., ''0'');
#8=LwsQualifiedIdentifier(#5, .F., ''y'', ());
#9=LwsEqualExpression(#16, .F., #15, #10);
#10=LwsDecimalLiteral(#9, .F., ''2'');
#11=LwsDecimalLiteral(#4, .F., ''1'');
#12=LwsQualifiedIdentifier(#2, .F., ''x'', ());
#13=LwsQualifiedIdentifier(#4, .F., ''y'', ());
#14=LwsIfClause(#1, #2, (#5));
#15=LwsQualifiedIdentifier(#9, .F., ''x'', ());
#16=LwsIfClause(#1, #9, (#4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#13, .F., ''1'');
#2=LwsQualifiedIdentifier(#15, .F., ''x'', ());
#3=LwsIfClause(#4, #16, (#14));
#4=LwsIfStatement(#8, (), (#3, #19), (#6));
#5=LwsQualifiedIdentifier(#16, .F., ''x'', ());
#6=LwsAssignment(#4, (), #12, #7);
#7=LwsNegativeExpression(#6, .F., #9);
#8=LwsParsingResult($, (#4), $);
#9=LwsDecimalLiteral(#7, .F., ''1'');
#10=LwsQualifiedIdentifier(#13, .F., ''y'', ());
#11=LwsQualifiedIdentifier(#14, .F., ''y'', ());
#12=LwsQualifiedIdentifier(#6, .F., ''y'', ());
#13=LwsAssignment(#19, (), #10, #1);
#14=LwsAssignment(#3, (), #11, #18);
#15=LwsEqualExpression(#19, .F., #2, #20);
#16=LwsEqualExpression(#3, .F., #5, #17);
#17=LwsDecimalLiteral(#16, .F., ''1'');
#18=LwsDecimalLiteral(#14, .F., ''0'');
#19=LwsIfClause(#4, #15, (#13));
#20=LwsDecimalLiteral(#15, .F., ''2'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIf6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#18, #17);
#2=LwsQualifiedIdentifier(#21, .F., ''In_Elmt_List'', (#26));
#3=LwsQualifiedIdentifier(#27, .F., ''List'', ());
#4=LwsQualifiedIdentifier(#24, .F., ''Append_Elmt'', (#25));
#5=LwsAggregate(#25, .F., (#16, #13));
#6=LwsQualifiedIdentifier(#28, .F., ''Append_Elmt'', (#23));
#7=LwsAggregate(#23, .F., (#19, #14));
#8=LwsIfStatement(#22, (), (#20, #11), $);
#9=LwsAggregate(#26, .F., (#15, #10));
#10=LwsQualifiedIdentifier(#9, .F., ''List'', ());
#11=LwsIfClause(#8, #21, (#24));
#12=LwsQualifiedIdentifier(#27, .F., ''New_Elmt_List'', ());
#13=LwsQualifiedIdentifier(#5, .F., ''List'', ());
#14=LwsQualifiedIdentifier(#7, .F., ''List'', ());
#15=LwsQualifiedIdentifier(#9, .F., ''Unit'', ());
#16=LwsQualifiedIdentifier(#5, .F., ''Unit'', ());
#17=LwsAggregate(#1, .F., (#29));
#18=LwsQualifiedIdentifier(#20, .F., ''No'', (#1));
#19=LwsQualifiedIdentifier(#7, .F., ''Unit'', ());
#20=LwsIfClause(#8, #18, (#27, #28));
#21=LwsNotExpression(#11, .F., #2);
#22=LwsParsingResult($, (#8), $);
#23=LwsArgumentsSelector(#6, #7);
#24=LwsProcedureCall(#11, (), #4);
#25=LwsArgumentsSelector(#4, #5);
#26=LwsArgumentsSelector(#2, #9);
#27=LwsAssignment(#20, (), #3, #12);
#28=LwsProcedureCall(#20, (), #6);
#29=LwsQualifiedIdentifier(#17, .F., ''List'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testInteger1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsDecimalLiteral(#1, .F., ''0'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testInteger2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsDecimalLiteral(#1, .F., ''123_456'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testInteger3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''1E6'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIntegerType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsRangeConstraint(#3, #4);
#3=LwsRangeIntegerType(#1, #2);
#4=LwsExplicitRange(#2, .F., #6, #5);
#5=LwsDecimalLiteral(#4, .F., ''2_000'');
#6=LwsDecimalLiteral(#4, .F., ''1'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIntegerType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRangeIntegerType(#4, #6);
#2=LwsExplicitRange(#6, .F., #5, #3);
#3=LwsQualifiedIdentifier(#2, .F., ''MAX_LINE_SIZE'', ());
#4=LwsParsingResult($, (#1), $);
#5=LwsDecimalLiteral(#2, .F., ''1'');
#6=LwsRangeConstraint(#1, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testIntegerType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRangeIntegerType(#7, #8);
#2=LwsExplicitRange(#8, .F., #3, #5);
#3=LwsQualifiedIdentifier(#2, .F., ''SYSTEM'', (#4));
#4=LwsNamedSelector(#3, ''MIN_INT'');
#5=LwsQualifiedIdentifier(#2, .F., ''SYSTEM'', (#6));
#6=LwsNamedSelector(#5, ''MAX_INT'');
#7=LwsParsingResult($, (#1), $);
#8=LwsRangeConstraint(#1, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLabelledStatement1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''1'');
#2=LwsAssignment(#4, (''AFTER''), #3, #1);
#3=LwsQualifiedIdentifier(#2, .F., ''X'', ());
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLabelledStatement2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsNullStatement(#1, (''HERE'', ''ICI'', ''AQUI'', ''HIER''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEqualExpression(#4, .F., #2, #3);
#2=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#3=LwsQualifiedIdentifier(#1, .F., ''b'', ());
#4=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsNotEqualExpression(#1, .F., #4, #3);
#3=LwsQualifiedIdentifier(#2, .F., ''b'', ());
#4=LwsQualifiedIdentifier(#2, .F., ''x'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsQualifiedIdentifier(#3, .F., ''x'', ());
#3=LwsLessThanExpression(#1, .F., #2, #4);
#4=LwsQualifiedIdentifier(#3, .F., ''b'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''x'', ());
#2=LwsLessEqualExpression(#3, .F., #1, #4);
#3=LwsParsingResult($, (#2), $);
#4=LwsQualifiedIdentifier(#2, .F., ''b'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#4, .F., ''b'', ());
#2=LwsParsingResult($, (#4), $);
#3=LwsQualifiedIdentifier(#4, .F., ''x'', ());
#4=LwsGreaterThanExpression(#2, .F., #3, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLogical6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsQualifiedIdentifier(#3, .F., ''x'', ());
#3=LwsGreaterEqualExpression(#1, .F., #2, #4);
#4=LwsQualifiedIdentifier(#3, .F., ''b'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''GET'', (#7));
#2=LwsQualifiedIdentifier(#5, .F., ''CURRENT_CHARACTER'', ());
#3=LwsLoopStatement(#4, (), $, $, (#6));
#4=LwsParsingResult($, (#3), $);
#5=LwsAggregate(#7, .F., (#2));
#6=LwsProcedureCall(#3, (), #1);
#7=LwsArgumentsSelector(#1, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#7, #3);
#2=LwsQualifiedIdentifier(#3, .F., ''CURRENT_CHARACTER'', ());
#3=LwsAggregate(#1, .F., (#2));
#4=LwsProcedureCall(#5, (), #7);
#5=LwsLoopStatement(#6, (), ''here'', $, (#4));
#6=LwsParsingResult($, (#5), $);
#7=LwsQualifiedIdentifier(#4, .F., ''GET'', (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#25, .F., ''N'', ());
#2=LwsArgumentsSelector(#13, #18);
#3=LwsNamedSelector(#17, ''PRICE'');
#4=LwsAssignment(#9, (), #22, #10);
#5=LwsQualifiedIdentifier(#18, .F., ''BID'', (#8, #21));
#6=LwsNamedSelector(#24, ''PRICE'');
#7=LwsProcedureCall(#9, (), #13);
#8=LwsArgumentsSelector(#5, #20);
#9=LwsLoopStatement(#14, (), $, #15, (#7, #4));
#10=LwsPlusExpression(#4, .F., #11, #12);
#11=LwsQualifiedIdentifier(#10, .F., ''N'', ());
#12=LwsDecimalLiteral(#10, .F., ''1'');
#13=LwsQualifiedIdentifier(#7, .F., ''RECORD_BID'', (#2));
#14=LwsParsingResult($, (#9), $);
#15=LwsWhileIteration(#9, #19);
#16=LwsArgumentsSelector(#24, #25);
#17=LwsQualifiedIdentifier(#19, .F., ''CUT_OFF'', (#3));
#18=LwsAggregate(#2, .F., (#5));
#19=LwsLessThanExpression(#15, .F., #24, #17);
#20=LwsAggregate(#8, .F., (#23));
#21=LwsNamedSelector(#5, ''PRICE'');
#22=LwsQualifiedIdentifier(#4, .F., ''N'', ());
#23=LwsQualifiedIdentifier(#20, .F., ''N'', ());
#24=LwsQualifiedIdentifier(#19, .F., ''BID'', (#16, #6));
#25=LwsAggregate(#16, .F., (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''PUT'', (#20));
#2=LwsMembershipIteration(#18, ''J'', .F., #3);
#3=LwsNamedRange(#2, .F., #16, $);
#4=LwsNotEqualExpression(#14, .F., #15, #13);
#5=LwsProcedureCall(#14, (), #1);
#6=LwsArgumentsSelector(#7, #10);
#7=LwsQualifiedIdentifier(#21, .F., ''Buffer'', (#6));
#8=LwsArgumentsSelector(#15, #12);
#9=LwsQualifiedIdentifier(#12, .F., ''J'', ());
#10=LwsAggregate(#6, .F., (#11));
#11=LwsQualifiedIdentifier(#10, .F., ''J'', ());
#12=LwsAggregate(#8, .F., (#9));
#13=LwsQualifiedIdentifier(#4, .F., ''Space'', ());
#14=LwsIfClause(#19, #4, (#5));
#15=LwsQualifiedIdentifier(#4, .F., ''Buffer'', (#8));
#16=LwsQualifiedIdentifier(#3, .F., ''Buffer'', ());
#17=LwsParsingResult($, (#18), $);
#18=LwsLoopStatement(#17, (), $, #2, (#19));
#19=LwsIfStatement(#18, (), (#14), $);
#20=LwsArgumentsSelector(#1, #21);
#21=LwsAggregate(#20, .F., (#7));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''Buffer'', (#8));
#2=LwsAggregate(#22, .F., (#1));
#3=LwsQualifiedIdentifier(#13, .F., ''Buffer'', (#17));
#4=LwsQualifiedIdentifier(#16, .F., ''J'', ());
#5=LwsMembershipIteration(#10, ''J'', .T., #14);
#6=LwsIfClause(#11, #13, (#19));
#7=LwsDecimalLiteral(#14, .F., ''1'');
#8=LwsArgumentsSelector(#1, #16);
#9=LwsParsingResult($, (#10), $);
#10=LwsLoopStatement(#9, (), $, #5, (#11));
#11=LwsIfStatement(#10, (), (#6), $);
#12=LwsDecimalLiteral(#14, .F., ''0'');
#13=LwsNotEqualExpression(#6, .F., #3, #21);
#14=LwsExplicitRange(#5, .F., #7, #12);
#15=LwsQualifiedIdentifier(#19, .F., ''PUT'', (#22));
#16=LwsAggregate(#8, .F., (#4));
#17=LwsArgumentsSelector(#3, #20);
#18=LwsQualifiedIdentifier(#20, .F., ''J'', ());
#19=LwsProcedureCall(#6, (), #15);
#20=LwsAggregate(#17, .F., (#18));
#21=LwsQualifiedIdentifier(#13, .F., ''Space'', ());
#22=LwsArgumentsSelector(#15, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''NEW_ITEM'', ());
#2=LwsEqualExpression(#14, .F., #1, #16);
#3=LwsParsingResult($, (#9), $);
#4=LwsExplicitRange(#21, .F., #17, #8);
#5=LwsQualifiedIdentifier(#20, .F., ''NEW_ITEM'', ());
#6=LwsProcedureCall(#9, (), #18);
#7=LwsQualifiedIdentifier(#13, .F., ''STORAGE_FILE'', ());
#8=LwsQualifiedIdentifier(#4, .F., ''MAX_NUM_ITEMS'', ());
#9=LwsLoopStatement(#3, (), $, #21, (#6, #11, #14));
#10=LwsArgumentsSelector(#12, #13);
#11=LwsProcedureCall(#9, (), #12);
#12=LwsQualifiedIdentifier(#11, .F., ''MERGE_ITEM'', (#10));
#13=LwsAggregate(#10, .F., (#19, #7));
#14=LwsExitStatement(#9, (), $, #2);
#15=LwsArgumentsSelector(#18, #20);
#16=LwsQualifiedIdentifier(#2, .F., ''TERMINAL_ITEM'', ());
#17=LwsDecimalLiteral(#4, .F., ''1'');
#18=LwsQualifiedIdentifier(#6, .F., ''GET_NEW_ITEM'', (#15));
#19=LwsQualifiedIdentifier(#13, .F., ''NEW_ITEM'', ());
#20=LwsAggregate(#15, .F., (#5));
#21=LwsMembershipIteration(#9, ''N'', .F., #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''MAIN_CYCLE'', ());
#2=LwsQualifiedIdentifier(#5, .F., ''FOUND'', ());
#3=LwsLoopStatement(#4, (), ''MAIN_CYCLE'', $, (#5));
#4=LwsParsingResult($, (#3), $);
#5=LwsExitStatement(#3, (), #1, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testLoop8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#25, .F., ''NEW_ITEM'', ());
#2=LwsArgumentsSelector(#6, #16);
#3=LwsQualifiedIdentifier(#26, .F., ''Maxbuffers'', ());
#4=LwsParsingResult($, (#17), $);
#5=LwsDecimalLiteral(#8, .F., ''1'');
#6=LwsQualifiedIdentifier(#7, .F., ''MERGE_ITEM'', (#2));
#7=LwsProcedureCall(#21, (), #6);
#8=LwsExplicitRange(#13, .F., #5, #14);
#9=LwsQualifiedIdentifier(#16, .F., ''STORAGE_FILE'', ());
#10=LwsEqualExpression(#22, .F., #11, #18);
#11=LwsQualifiedIdentifier(#10, .F., ''NEW_ITEM'', ());
#12=LwsQualifiedIdentifier(#19, .F., ''GET_NEW_ITEM'', (#20));
#13=LwsMembershipIteration(#17, ''N'', .F., #8);
#14=LwsQualifiedIdentifier(#8, .F., ''MAX_NUM_ITEMS'', ());
#15=LwsDecimalLiteral(#26, .F., ''1'');
#16=LwsAggregate(#2, .F., (#24, #9));
#17=LwsLoopStatement(#4, (), $, #13, (#21));
#18=LwsQualifiedIdentifier(#10, .F., ''TERMINAL_ITEM'', ());
#19=LwsProcedureCall(#21, (), #12);
#20=LwsArgumentsSelector(#12, #25);
#21=LwsLoopStatement(#17, (), ''something'', #23, (#19, #7, #22));
#22=LwsExitStatement(#21, (), $, #10);
#23=LwsMembershipIteration(#21, ''M'', .F., #26);
#24=LwsQualifiedIdentifier(#16, .F., ''NEW_ITEM'', ());
#25=LwsAggregate(#20, .F., (#1));
#26=LwsExplicitRange(#23, .F., #15, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMembership1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsMembershipExpression(#1, .F., #4, #3, .T.);
#3=LwsExplicitRange(#2, .F., #6, #5);
#4=LwsQualifiedIdentifier(#2, .F., ''x'', ());
#5=LwsDecimalLiteral(#3, .F., ''30'');
#6=LwsDecimalLiteral(#3, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMembership2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsMembershipExpression(#3, .F., #4, #2, .T.);
#2=LwsNamedRange(#1, .F., #5, $);
#3=LwsParsingResult($, (#1), $);
#4=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#5=LwsQualifiedIdentifier(#2, .F., ''ARR'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMembership3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsMembershipExpression(#3, .F., #2, #4, .T.);
#2=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#3=LwsParsingResult($, (#1), $);
#4=LwsQualifiedIdentifier(#1, .F., ''ARR'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMembership4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''ARR'', ());
#2=LwsMembershipExpression(#3, .F., #4, #1, .F.);
#3=LwsParsingResult($, (#2), $);
#4=LwsQualifiedIdentifier(#2, .F., ''x'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMod1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsModExpression(#3, .F., #2, #4);
#2=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#3=LwsParsingResult($, (#1), $);
#4=LwsDecimalLiteral(#1, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMoins1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNegativeExpression(#5, .F., #6);
#2=LwsParsingResult($, (#5), $);
#3=LwsNegativeExpression(#5, .T., #4);
#4=LwsQualifiedIdentifier(#3, .F., ''X'', ());
#5=LwsMinusExpression(#2, .F., #1, #3);
#6=LwsDecimalLiteral(#1, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testMult1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsMultExpression(#3, .F., #2, #4);
#2=LwsQualifiedIdentifier(#1, .F., ''x'', ());
#3=LwsParsingResult($, (#1), $);
#4=LwsDecimalLiteral(#1, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testName1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsQualifiedIdentifier(#1, .F., ''SN'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testName2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#7, .F., ''4'');
#2=LwsQualifiedIdentifier(#4, .F., ''SN'', (#6, #5));
#3=LwsDecimalLiteral(#7, .F., ''5'');
#4=LwsParsingResult($, (#2), $);
#5=LwsArgumentsSelector(#2, #7);
#6=LwsNamedSelector(#2, ''PX'');
#7=LwsAggregate(#5, .F., (#1, #3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testName3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsQualifiedIdentifier(#1, .F., ''true'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithAccessAttribute1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''P'', (#3));
#2=LwsParsingResult($, (#1), $);
#3=LwsAccessAttribute(#1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithAccessAttribute2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedAttribute(#5, ''LAST'');
#2=LwsArgumentsSelector(#5, #6);
#3=LwsDecimalLiteral(#6, .F., ''2'');
#4=LwsParsingResult($, (#5), $);
#5=LwsQualifiedIdentifier(#4, .F., ''BOARD'', (#1, #2));
#6=LwsAggregate(#2, .F., (#3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithAccessAttribute3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsNamedAttribute(#3, ''FIRST'');
#3=LwsQualifiedIdentifier(#1, .F., ''RAINBOW'', (#4, #2));
#4=LwsNamedAttribute(#3, ''BASE'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithAccessAttribute4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsAggregate(#5, .F., (#6));
#3=LwsNamedAttribute(#4, ''TERMINATED'');
#4=LwsQualifiedIdentifier(#1, .F., ''POOL'', (#5, #3));
#5=LwsArgumentsSelector(#4, #2);
#6=LwsQualifiedIdentifier(#2, .F., ''K'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithAccessAttribute5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#22, .F., ''Target_NS'', ());
#2=LwsQualifiedIdentifier(#26, .F., ''Namespaces'', ());
#3=LwsComponentAssociation(#14, #13, (#22));
#4=LwsQualifiedIdentifier(#25, .F., ''Attributes'', (#12, #8));
#5=LwsComponentAssociation(#14, #15, (#23));
#6=LwsQualifiedIdentifier(#23, .F., ''Process_Contents'', ());
#7=LwsPrimaryQualifier(#19, #14);
#8=LwsNamedSelector(#4, ''Namespaces'');
#9=LwsQualifiedIdentifier(#17, .F., ''Add_Any_Attribute'', (#18));
#10=LwsQualifiedIdentifier(#28, .F., ''As_Restriction'', ());
#11=LwsNamedSelector(#15, ''Process_Contents'');
#12=LwsNamedSelector(#4, ''Any'');
#13=LwsQualifiedIdentifier(#3, .F., ''Empty_String'', ());
#14=LwsAggregate(#7, .F., (#3, #5, #25));
#15=LwsQualifiedIdentifier(#5, .F., ''Attributes'', (#24, #11));
#16=LwsQualifiedIdentifier(#28, .F., ''Parser'', (#21));
#17=LwsProcedureCall(#20, (), #9);
#18=LwsArgumentsSelector(#9, #28);
#19=LwsQualifiedIdentifier(#28, .F., ''Internal_Any_Descr'', (#7));
#20=LwsParsingResult($, (#17), $);
#21=LwsNamedSelector(#16, ''Grammar'');
#22=LwsExpressionChoice(#3, #1);
#23=LwsExpressionChoice(#5, #6);
#24=LwsNamedSelector(#15, ''Any'');
#25=LwsComponentAssociation(#14, #4, (#26));
#26=LwsExpressionChoice(#25, #2);
#27=LwsQualifiedIdentifier(#28, .F., ''List'', ());
#28=LwsAggregate(#18, .F., (#16, #27, #19, #10));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithCharSelector1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''KEY_MANAGER'', (#2));
#2=LwsCharacterSelector(#1, ''<'');
#3=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithDeltaAttribute1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''P'', (#3));
#2=LwsParsingResult($, (#1), $);
#3=LwsDeltaAttribute(#1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithDigitsAttribute1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsDigitsAttribute(#3);
#3=LwsQualifiedIdentifier(#1, .F., ''REAL'', (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithNamedAttribute1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedAttribute(#2, ''FIRST'');
#2=LwsQualifiedIdentifier(#3, .F., ''COLOR'', (#1));
#3=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithParameters1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''SAT'', ());
#2=LwsQualifiedIdentifier(#4, .F., ''MY_SCHEDULE'', (#3));
#3=LwsArgumentsSelector(#2, #5);
#4=LwsParsingResult($, (#2), $);
#5=LwsAggregate(#3, .F., (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithParameters2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#5, .F., ''10'');
#2=LwsQualifiedIdentifier(#4, .F., ''PAGE'', (#3));
#3=LwsArgumentsSelector(#2, #5);
#4=LwsParsingResult($, (#2), $);
#5=LwsAggregate(#3, .F., (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithParameters3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''BOARD'', (#2));
#2=LwsArgumentsSelector(#1, #7);
#3=LwsQualifiedIdentifier(#7, .F., ''M'', ());
#4=LwsDecimalLiteral(#8, .F., ''1'');
#5=LwsQualifiedIdentifier(#8, .F., ''J'', ());
#6=LwsParsingResult($, (#1), $);
#7=LwsAggregate(#2, .F., (#3, #8));
#8=LwsPlusExpression(#7, .F., #5, #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithParameters4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsQualifiedIdentifier(#1, .F., ''PAGE'', (#7, #6));
#3=LwsDecimalLiteral(#4, .F., ''20'');
#4=LwsAggregate(#6, .F., (#3));
#5=LwsAggregate(#7, .F., (#8));
#6=LwsArgumentsSelector(#2, #4);
#7=LwsArgumentsSelector(#2, #5);
#8=LwsDecimalLiteral(#5, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithParameters5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''L'', ());
#2=LwsQualifiedIdentifier(#5, .F., ''N'', ());
#3=LwsQualifiedIdentifier(#5, .F., ''M'', ());
#4=LwsQualifiedIdentifier(#7, .F., ''NEXT_FRAME'', (#8, #9));
#5=LwsAggregate(#9, .F., (#3, #2));
#6=LwsAggregate(#8, .F., (#1));
#7=LwsParsingResult($, (#4), $);
#8=LwsArgumentsSelector(#4, #6);
#9=LwsArgumentsSelector(#4, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithSlice1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''STARS'', (#6));
#2=LwsParsingResult($, (#1), $);
#3=LwsAggregate(#6, .F., (#4));
#4=LwsExplicitRange(#3, .F., #7, #5);
#5=LwsDecimalLiteral(#4, .F., ''15'');
#6=LwsArgumentsSelector(#1, #3);
#7=LwsDecimalLiteral(#4, .F., ''1'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithSlice2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#9, .F., ''10'');
#2=LwsDecimalLiteral(#6, .F., ''10'');
#3=LwsAggregate(#5, .F., (#9));
#4=LwsQualifiedIdentifier(#8, .F., ''PAGE'', (#5));
#5=LwsArgumentsSelector(#4, #3);
#6=LwsPlusExpression(#9, .F., #2, #7);
#7=LwsQualifiedIdentifier(#6, .F., ''SIZE'', ());
#8=LwsParsingResult($, (#4), $);
#9=LwsExplicitRange(#3, .F., #1, #6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithSlice3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''L'', ());
#2=LwsExplicitRange(#3, .F., #9, #6);
#3=LwsAggregate(#5, .F., (#2));
#4=LwsQualifiedIdentifier(#10, .F., ''PAGE'', (#8, #5));
#5=LwsArgumentsSelector(#4, #3);
#6=LwsQualifiedIdentifier(#2, .F., ''B'', ());
#7=LwsAggregate(#8, .F., (#1));
#8=LwsArgumentsSelector(#4, #7);
#9=LwsQualifiedIdentifier(#2, .F., ''A'', ());
#10=LwsParsingResult($, (#4), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithSlice4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''STARS'', (#8, #9));
#2=LwsExplicitRange(#7, .F., #10, #4);
#3=LwsParsingResult($, (#1), $);
#4=LwsDecimalLiteral(#2, .F., ''15'');
#5=LwsQualifiedIdentifier(#6, .F., ''K'', ());
#6=LwsAggregate(#9, .F., (#5));
#7=LwsAggregate(#8, .F., (#2));
#8=LwsArgumentsSelector(#1, #7);
#9=LwsArgumentsSelector(#1, #6);
#10=LwsDecimalLiteral(#2, .F., ''5'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNameWithStringSelector1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''KEY_MANAGER'', (#2));
#2=LwsStringSelector(#1, ''<'');
#3=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNot1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNotExpression(#2, .F., #3);
#2=LwsParsingResult($, (#1), $);
#3=LwsQualifiedIdentifier(#1, .F., ''DESTROYED'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNull1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsNullLiteral(#1, .F., ''NULL'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testNumberDecl1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''3.14159_26536'');
#2=LwsNumberDeclaration(#3, (''PI''), #1);
#3=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsSubtypeIndication(#4, #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#4=LwsObjectDeclaration(#1, (''i''), .F., .F., #2, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#2=LwsObjectDeclaration(#4, (''i''), .T., .F., #3, $);
#3=LwsSubtypeIndication(#2, #1, $);
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectDeclaration(#2, (''i''), .F., .T., #3, #5);
#2=LwsParsingResult($, (#1), $);
#3=LwsSubtypeIndication(#1, #4, $);
#4=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#5=LwsDecimalLiteral(#1, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl12 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectDeclaration(#3, (''i''), .T., .T., #2, #4);
#2=LwsSubtypeIndication(#1, #5, $);
#3=LwsParsingResult($, (#1), $);
#4=LwsDecimalLiteral(#1, .F., ''10'');
#5=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl1bis [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsSubtypeIndication(#4, #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#4=LwsObjectDeclaration(#1, (''i'', ''j'', ''k''), .F., .F., #2, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''INTEGER'', ());
#2=LwsRangeConstraint(#5, #3);
#3=LwsExplicitRange(#2, .F., #4, #8);
#4=LwsDecimalLiteral(#3, .F., ''0'');
#5=LwsSubtypeIndication(#9, #1, #2);
#6=LwsParsingResult($, (#9), $);
#7=LwsDecimalLiteral(#9, .F., ''0'');
#8=LwsDecimalLiteral(#3, .F., ''10_000'');
#9=LwsObjectDeclaration(#6, (''SIZE''), .F., .F., #5, #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''BOOLEAN'', ());
#2=LwsObjectDeclaration(#4, (''SORTED''), .F., .F., #5, #3);
#3=LwsQualifiedIdentifier(#2, .F., ''FALSE'', ());
#4=LwsParsingResult($, (#2), $);
#5=LwsSubtypeIndication(#2, #1, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExplicitRange(#9, .F., #6, #4);
#2=LwsQualifiedIdentifier(#5, .F., ''COLOR'', ());
#3=LwsObjectDeclaration(#8, (''ColorTable''), .F., .F., #9, $);
#4=LwsQualifiedIdentifier(#1, .F., ''N'', ());
#5=LwsSubtypeIndication(#7, #2, $);
#6=LwsDecimalLiteral(#1, .F., ''1'');
#7=LwsComponentSubtype(#9, .F., #5);
#8=LwsParsingResult($, (#3), $);
#9=LwsArrayType(#3, (#1), #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#12, .F., ''BIT_VECTOR'', (#10));
#2=LwsDecimalLiteral(#7, .F., ''10'');
#3=LwsDecimalLiteral(#7, .F., ''1'');
#4=LwsAggregate(#6, .F., (#5));
#5=LwsComponentAssociation(#4, #11, (#9));
#6=LwsObjectDeclaration(#8, (''OPTION''), .F., .F., #12, #4);
#7=LwsExplicitRange(#13, .F., #3, #2);
#8=LwsParsingResult($, (#6), $);
#9=LwsOtherChoice(#5);
#10=LwsArgumentsSelector(#1, #13);
#11=LwsQualifiedIdentifier(#5, .F., ''TRUE'', ());
#12=LwsSubtypeIndication(#6, #1, $);
#13=LwsAggregate(#10, .F., (#7));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''10_000'');
#2=LwsQualifiedIdentifier(#4, .F., ''INTEGER'', ());
#3=LwsObjectDeclaration(#5, (''LIMIT''), .F., .T., #4, #1);
#4=LwsSubtypeIndication(#3, #2, $);
#5=LwsParsingResult($, (#3), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectDeclaration(#6, (''LOW_LIMIT''), .F., .T., #2, #3);
#2=LwsSubtypeIndication(#1, #4, $);
#3=LwsDivExpression(#1, .F., #5, #7);
#4=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#5=LwsQualifiedIdentifier(#3, .F., ''LIMIT'', ());
#6=LwsParsingResult($, (#1), $);
#7=LwsDecimalLiteral(#3, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''REAL'', ());
#2=LwsAggregate(#6, .F., (#3));
#3=LwsDecimalLiteral(#2, .F., ''1.15'');
#4=LwsQualifiedIdentifier(#8, .F., ''DISPERSION'', (#6));
#5=LwsParsingResult($, (#8), $);
#6=LwsArgumentsSelector(#4, #2);
#7=LwsSubtypeIndication(#8, #1, $);
#8=LwsObjectDeclaration(#5, (''TOLERANCE''), .F., .T., #7, #4);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectDecl9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsDecimalLiteral(#3, .F., ''3.14159_26536'');
#3=LwsNumberDeclaration(#1, (''PI''), #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testObjectRenamingDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectRenamingDeclaration(#6, #4, #2, #2);
#2=LwsObjectDeclaration(#1, (''L''), .F., .F., #3, $);
#3=LwsSubtypeIndication(#2, #5, $);
#4=LwsQualifiedIdentifier(#1, .F., ''LEFTMOST_PERSON'', ());
#5=LwsQualifiedIdentifier(#3, .F., ''PERSON'', ());
#6=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testOperatorOverloadingDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''MATRIX'', ());
#2=LwsFormalParameter(#5, (''LEFT'', ''RIGHT''), $, #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''MATRIX'', ());
#4=LwsParsingResult($, (#5), $);
#5=LwsOperatorOverloadDeclaration(#4, (#2), .F., #6, #1, #6);
#6=LwsStringDesignator(#5, ''"*"'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageBody1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#35, #29, $);
#2=LwsLoopStatement(#6, (), $, #32, (#20));
#3=LwsCompoundName(#9, (''Add_Em_Up''));
#4=LwsExplicitRange(#32, .F., #11, #34);
#5=LwsDecimalLiteral(#23, .F., ''0.0'');
#6=LwsBlockBody(#14, (#23, #2, #7), ());
#7=LwsAssignment(#6, (), #33, #22);
#8=LwsFormalParameter(#9, (''In_Dat''), .inputMode., #31, $);
#9=LwsProcedureDeclaration(#14, (#8, #24), .F., #3);
#10=LwsQualifiedIdentifier(#24, .F., ''FLOAT'', ());
#11=LwsQualifiedIdentifier(#4, .F., ''In_Dat'', (#12));
#12=LwsNamedAttribute(#11, ''FIRST'');
#13=LwsQualifiedIdentifier(#25, .F., ''In_Dat'', (#16));
#14=LwsSubprogramBody(#30, (#35), #9, #6);
#15=LwsAggregate(#16, .F., (#18));
#16=LwsArgumentsSelector(#13, #15);
#17=LwsQualifiedIdentifier(#25, .F., ''Total'', ());
#18=LwsQualifiedIdentifier(#15, .F., ''Index'', ());
#19=LwsQualifiedIdentifier(#20, .F., ''Total'', ());
#20=LwsAssignment(#2, (), #19, #25);
#21=LwsNamedAttribute(#34, ''LAST'');
#22=LwsQualifiedIdentifier(#7, .F., ''Total'', ());
#23=LwsAssignment(#6, (), #28, #5);
#24=LwsFormalParameter(#9, (''Sum''), .outputMode., #10, $);
#25=LwsPlusExpression(#20, .F., #17, #13);
#26=LwsCompoundName(#30, (''AdderPkg''));
#27=LwsParsingResult($, (#30), $);
#28=LwsQualifiedIdentifier(#23, .F., ''Total'', ());
#29=LwsQualifiedIdentifier(#1, .F., ''FLOAT'', ());
#30=LwsPackageBody(#27, (#14), #26, $);
#31=LwsQualifiedIdentifier(#8, .F., ''MY_ARRAY'', ());
#32=LwsMembershipIteration(#2, ''Index'', .F., #4);
#33=LwsQualifiedIdentifier(#7, .F., ''Sum'', ());
#34=LwsQualifiedIdentifier(#4, .F., ''In_Dat'', (#21));
#35=LwsObjectDeclaration(#14, (''Total''), .F., .F., #1, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageBody2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsLoopStatement(#9, (), $, #21, (#16));
#2=LwsNamedAttribute(#18, ''LAST'');
#3=LwsQualifiedIdentifier(#22, .F., ''In_Dat'', (#32));
#4=LwsQualifiedIdentifier(#28, .F., ''Total'', ());
#5=LwsQualifiedIdentifier(#31, .F., ''Total'', ());
#6=LwsSubprogramBody(#15, (), #10, #9);
#7=LwsParsingResult($, (#15), $);
#8=LwsFormalParameter(#10, (''In_Dat''), .inputMode., #20, $);
#9=LwsBlockBody(#6, (#1, #31), ());
#10=LwsProcedureDeclaration(#6, (#8, #26), .F., #19);
#11=LwsAggregate(#13, .F., (#14));
#12=LwsQualifiedIdentifier(#26, .F., ''FLOAT'', ());
#13=LwsArgumentsSelector(#25, #11);
#14=LwsQualifiedIdentifier(#11, .F., ''Index'', ());
#15=LwsPackageBody(#7, (#6), #30, #27);
#16=LwsAssignment(#1, (), #29, #24);
#17=LwsDecimalLiteral(#28, .F., ''0.0'');
#18=LwsQualifiedIdentifier(#22, .F., ''In_Dat'', (#2));
#19=LwsCompoundName(#10, (''Add_Em_Up''));
#20=LwsQualifiedIdentifier(#8, .F., ''MY_ARRAY'', ());
#21=LwsMembershipIteration(#1, ''Index'', .F., #22);
#22=LwsExplicitRange(#21, .F., #3, #18);
#23=LwsQualifiedIdentifier(#24, .F., ''Total'', ());
#24=LwsPlusExpression(#16, .F., #23, #25);
#25=LwsQualifiedIdentifier(#24, .F., ''In_Dat'', (#13));
#26=LwsFormalParameter(#10, (''Sum''), .outputMode., #12, $);
#27=LwsBlockBody(#15, (#28), ());
#28=LwsAssignment(#27, (), #4, #17);
#29=LwsQualifiedIdentifier(#16, .F., ''Total'', ());
#30=LwsCompoundName(#15, (''AdderPkg''));
#31=LwsAssignment(#9, (), #33, #5);
#32=LwsNamedAttribute(#3, ''FIRST'');
#33=LwsQualifiedIdentifier(#31, .F., ''Sum'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageBodyStubDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackageBodyStubDeclaration(#2, #3);
#2=LwsParsingResult($, (#1), $);
#3=LwsCompoundName(#1, (''FACILITY''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDecl [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#8, .F., ''int'', ());
#2=LwsCompoundName(#8, (''Allocate_New_Node''));
#3=LwsParsingResult($, (#6), $);
#4=LwsCompoundName(#6, (''Linked_List''));
#5=LwsPackageDefinition(#6, #7, $);
#6=LwsPackageDeclaration(#3, #4, #5);
#7=LwsPackagePart(#5, (#8));
#8=LwsFunctionDeclaration(#7, (), .F., #2, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#10), $);
#2=LwsFormalParameter(#12, (''E''), .inputMode., #7, $);
#3=LwsPackageDefinition(#10, #6, $);
#4=LwsCompoundName(#10, (''STACK''));
#5=LwsCompoundName(#12, (''PUSH''));
#6=LwsPackagePart(#3, (#12, #13));
#7=LwsQualifiedIdentifier(#2, .F., ''ITEM'', ());
#8=LwsFormalParameter(#13, (''E''), .outputMode., #9, $);
#9=LwsQualifiedIdentifier(#8, .F., ''ITEM'', ());
#10=LwsPackageDeclaration(#1, #4, #3);
#11=LwsCompoundName(#13, (''POP''));
#12=LwsProcedureDeclaration(#6, (#2), .F., #5);
#13=LwsProcedureDeclaration(#6, (#8), .F., #11);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#4, .F., ''ITEM'', ());
#2=LwsPackageDefinition(#12, #3, $);
#3=LwsPackagePart(#2, (#5, #14, #8));
#4=LwsFormalParameter(#5, (''E''), .inputMode., #1, $);
#5=LwsProcedureDeclaration(#3, (#4), .F., #9);
#6=LwsCompoundName(#12, (''STACK''));
#7=LwsQualifiedIdentifier(#13, .F., ''ITEM'', ());
#8=LwsExceptionDeclaration(#3, (''OVERFLOW'', ''UNDERFLOW''));
#9=LwsCompoundName(#5, (''PUSH''));
#10=LwsCompoundName(#14, (''POP''));
#11=LwsParsingResult($, (#12), $);
#12=LwsPackageDeclaration(#11, #6, #2);
#13=LwsFormalParameter(#14, (''E''), .outputMode., #7, $);
#14=LwsProcedureDeclaration(#3, (#13), .F., #10);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDiscriminantSpecification(#31, (#5));
#2=LwsComponentSubtype(#20, .F., #13);
#3=LwsIndex(#50, #14);
#4=LwsPackageDefinition(#36, #44, #26);
#5=LwsDiscriminantAttribute(#1, (''SIZE''), .F., #18, $);
#6=LwsFormalParameter(#28, (''E''), .outputMode., #19, $);
#7=LwsAggregate(#37, .F., (#43));
#8=LwsQualifiedIdentifier(#43, .F., ''SIZE'', ());
#9=LwsQualifiedIdentifier(#42, .F., ''STACK'', ());
#10=LwsDiscriminantSpecification(#11, (#23));
#11=LwsFullTypeDeclaration(#26, ''STACK'', #10, #33);
#12=LwsFormalParameter(#40, (''E''), .inputMode., #29, $);
#13=LwsSubtypeIndication(#2, #21, $);
#14=LwsQualifiedIdentifier(#3, .F., ''POSITIVE'', ());
#15=LwsComponentSubtype(#50, .F., #32);
#16=LwsRecordDefinition(#33, (#27, #20), $);
#17=LwsDecimalLiteral(#43, .F., ''1'');
#18=LwsQualifiedIdentifier(#5, .F., ''POSITIVE'', ());
#19=LwsQualifiedIdentifier(#6, .F., ''ITEM'', ());
#20=LwsComponentAttribute(#16, (''INDEX''), #2, #45);
#21=LwsQualifiedIdentifier(#13, .F., ''NATURAL'', ());
#22=LwsParsingResult($, (#36), $);
#23=LwsDiscriminantAttribute(#10, (''SIZE''), .F., #49, $);
#24=LwsFormalParameter(#28, (''S''), .inputOutputMode., #41, $);
#25=LwsFullTypeDeclaration(#26, ''TABLE'', $, #50);
#26=LwsPackagePart(#4, (#25, #11));
#27=LwsComponentAttribute(#16, (''SPACE''), #35, $);
#28=LwsProcedureDeclaration(#44, (#24, #6), .F., #46);
#29=LwsQualifiedIdentifier(#12, .F., ''ITEM'', ());
#30=LwsSubtypeIndication(#35, #39, $);
#31=LwsPrivateTypeDeclaration(#44, ''STACK'', #1, #48, #48);
#32=LwsSubtypeIndication(#15, #38, $);
#33=LwsDefinedRecordType(#11, .F., .F., .F., #16);
#34=LwsCompoundName(#40, (''PUSH''));
#35=LwsComponentSubtype(#27, .F., #30);
#36=LwsPackageDeclaration(#22, #47, #4);
#37=LwsArgumentsSelector(#39, #7);
#38=LwsQualifiedIdentifier(#32, .F., ''ITEM'', ());
#39=LwsQualifiedIdentifier(#30, .F., ''TABLE'', (#37));
#40=LwsProcedureDeclaration(#44, (#42, #12), .F., #34);
#41=LwsQualifiedIdentifier(#24, .F., ''STACK'', ());
#42=LwsFormalParameter(#40, (''S''), .inputOutputMode., #9, $);
#43=LwsExplicitRange(#7, .F., #17, #8);
#44=LwsPackagePart(#4, (#31, #40, #28));
#45=LwsDecimalLiteral(#20, .F., ''0'');
#46=LwsCompoundName(#28, (''POP''));
#47=LwsCompoundName(#36, (''ON_STACKS''));
#48=LwsPrivateTypeDefinition(#31, .F., .T.);
#49=LwsQualifiedIdentifier(#23, .F., ''POSITIVE'', ());
#50=LwsArrayType(#25, (#3), #15);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#42, (''Left'', ''Right''), $, #18, $);
#2=LwsOperatorOverloadDeclaration(#6, (#22, #32), .F., #37, #9, #37);
#3=LwsFullTypeDeclaration(#6, ''BOX'', $, #21);
#4=LwsRecordDefinition(#21, (#7, #8, #25), $);
#5=LwsFormalParameter(#38, (''Left''), $, #26, $);
#6=LwsPackagePart(#13, (#3, #29, #42, #38, #2, #23));
#7=LwsComponentAttribute(#4, (''Length''), #16, $);
#8=LwsComponentAttribute(#4, (''Width''), #17, $);
#9=LwsQualifiedIdentifier(#2, .F., ''BOX'', ());
#10=LwsCompoundName(#29, (''Make_A_Box''));
#11=LwsParsingResult($, (#20), $);
#12=LwsFormalParameter(#38, (''Right''), $, #31, $);
#13=LwsPackageDefinition(#20, #6, $);
#14=LwsSubtypeIndication(#46, #28, $);
#15=LwsCompoundName(#20, (''Shape''));
#16=LwsComponentSubtype(#7, .F., #33);
#17=LwsComponentSubtype(#8, .F., #34);
#18=LwsQualifiedIdentifier(#1, .F., ''BOX'', ());
#19=LwsQualifiedIdentifier(#29, .F., ''BOX'', ());
#20=LwsPackageDeclaration(#11, #15, #13);
#21=LwsDefinedRecordType(#3, .F., .F., .F., #4);
#22=LwsFormalParameter(#2, (''Left''), $, #36, $);
#23=LwsProcedureDeclaration(#6, (#27), .F., #24);
#24=LwsCompoundName(#23, (''Print_Box''));
#25=LwsComponentAttribute(#4, (''Height''), #46, $);
#26=LwsQualifiedIdentifier(#5, .F., ''INTEGER'', ());
#27=LwsFormalParameter(#23, (''Input_Box''), $, #35, $);
#28=LwsQualifiedIdentifier(#14, .F., ''INTEGER'', ());
#29=LwsFunctionDeclaration(#6, (#30), .F., #10, #19);
#30=LwsFormalParameter(#29, (''In_Length'', ''In_Width'', ''In_Height''), $, #41, $);
#31=LwsQualifiedIdentifier(#12, .F., ''BOX'', ());
#32=LwsFormalParameter(#2, (''Right''), $, #44, $);
#33=LwsSubtypeIndication(#16, #39, $);
#34=LwsSubtypeIndication(#17, #40, $);
#35=LwsQualifiedIdentifier(#27, .F., ''BOX'', ());
#36=LwsQualifiedIdentifier(#22, .F., ''INTEGER'', ());
#37=LwsStringDesignator(#2, ''"*"'');
#38=LwsOperatorOverloadDeclaration(#6, (#5, #12), .F., #48, #45, #48);
#39=LwsQualifiedIdentifier(#33, .F., ''INTEGER'', ());
#40=LwsQualifiedIdentifier(#34, .F., ''INTEGER'', ());
#41=LwsQualifiedIdentifier(#30, .F., ''INTEGER'', ());
#42=LwsOperatorOverloadDeclaration(#6, (#1), .F., #43, #47, #43);
#43=LwsStringDesignator(#42, ''"+"'');
#44=LwsQualifiedIdentifier(#32, .F., ''BOX'', ());
#45=LwsQualifiedIdentifier(#38, .F., ''BOX'', ());
#46=LwsComponentSubtype(#25, .F., #14);
#47=LwsQualifiedIdentifier(#42, .F., ''BOX'', ());
#48=LwsStringDesignator(#38, ''"+"'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#4, (''Shape''));
#2=LwsPackageDefinition(#4, #3, $);
#3=LwsPackagePart(#2, ());
#4=LwsPackageDeclaration(#5, #1, #2);
#5=LwsParsingResult($, (#4), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageDeclaration6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackageDefinition(#3, #2, $);
#2=LwsPackagePart(#1, ());
#3=LwsPackageDeclaration(#5, #4, #1);
#4=LwsCompoundName(#3, (''Shape''));
#5=LwsParsingResult($, (#3), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPackageRenamingDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackageRenamingDeclaration(#4, #2, #3);
#2=LwsQualifiedIdentifier(#1, .F., ''TABLE_MANAGER'', ());
#3=LwsCompoundName(#1, (''TM''));
#4=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPlus1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPlusExpression(#5, .F., #4, #3);
#2=LwsDecimalLiteral(#4, .F., ''10'');
#3=LwsQualifiedIdentifier(#1, .F., ''X'', ());
#4=LwsNegativeExpression(#1, .F., #2);
#5=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPlus2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#6, .F., ''10'');
#2=LwsParsingResult($, (#5), $);
#3=LwsNegativeExpression(#5, .T., #4);
#4=LwsQualifiedIdentifier(#3, .F., ''X'', ());
#5=LwsPlusExpression(#2, .F., #6, #3);
#6=LwsNegativeExpression(#5, .F., #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPragma(#6, ''INTERFACE'', (#5, #2));
#2=LwsPragmaArgument(#1, $, #3);
#3=LwsQualifiedIdentifier(#2, .F., ''CRMPSC'', ());
#4=LwsQualifiedIdentifier(#5, .F., ''EXTERNAL'', ());
#5=LwsPragmaArgument(#1, $, #4);
#6=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsPragma(#1, ''XXXP'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPragmaArgument(#13, ''EXTERNAL'', #26);
#2=LwsQualifiedIdentifier(#36, .F., ''SECTION_ID_TYPE'', ());
#3=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#4=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#5=LwsQualifiedIdentifier(#36, .F., ''FILE_PROTECTION_TYPE'', ());
#6=LwsPragmaArgument(#13, ''INTERNAL'', #14);
#7=LwsQualifiedIdentifier(#19, .F., ''S'', ());
#8=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#9=LwsQualifiedIdentifier(#24, .F., ''DESCRIPTOR'', (#18));
#10=LwsQualifiedIdentifier(#36, .F., ''UNSIGNED_LONGWORD'', ());
#11=LwsQualifiedIdentifier(#36, .F., ''ADDRESS_RANGE_TYPE'', ());
#12=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#13=LwsPragma(#21, ''IMPORT_VALUED_PROCEDURE'', (#6, #1, #15, #17));
#14=LwsQualifiedIdentifier(#6, .F., ''CRMPSC'', ());
#15=LwsPragmaArgument(#13, ''PARAMETER_TYPES'', #36);
#16=LwsQualifiedIdentifier(#36, .F., ''UNSIGNED_LONGWORD'', ());
#17=LwsPragmaArgument(#13, ''MECHANISM'', #24);
#18=LwsArgumentsSelector(#9, #19);
#19=LwsAggregate(#18, .F., (#7));
#20=LwsQualifiedIdentifier(#36, .F., ''ADDRESS'', ());
#21=LwsParsingResult($, (#13), $);
#22=LwsQualifiedIdentifier(#36, .F., ''ACCESS_MODE_TYPE'', ());
#23=LwsQualifiedIdentifier(#24, .F., ''REFERENCE'', ());
#24=LwsAggregate(#17, .F., (#31, #23, #35, #4, #12, #9, #39, #8, #27, #30, #3, #32, #28));
#25=LwsQualifiedIdentifier(#36, .F., ''UNSIGNED_LONGWORD'', ());
#26=LwsStringLiteral(#1, .F., ''SYS$CRMPSC'');
#27=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#28=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#29=LwsQualifiedIdentifier(#36, .F., ''COND_VALUE_TYPE'', ());
#30=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#31=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#32=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#33=LwsQualifiedIdentifier(#36, .F., ''CHANNEL_TYPE'', ());
#34=LwsQualifiedIdentifier(#36, .F., ''UNSIGNED_LONGWORD'', ());
#35=LwsQualifiedIdentifier(#24, .F., ''VALUE'', ());
#36=LwsAggregate(#15, .F., (#29, #11, #20, #22, #16, #37, #2, #34, #33, #25, #10, #5, #38));
#37=LwsQualifiedIdentifier(#36, .F., ''SECTION_NAME_TYPE'', ());
#38=LwsQualifiedIdentifier(#36, .F., ''UNSIGNED_LONGWORD'', ());
#39=LwsQualifiedIdentifier(#24, .F., ''REFERENCE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#15, .F., ''VALUE'', ());
#2=LwsQualifiedIdentifier(#11, .F., ''ADDRESS'', ());
#3=LwsQualifiedIdentifier(#11, .F., ''IOSB_TYPE'', ());
#4=LwsQualifiedIdentifier(#15, .F., ''DESCRIPTOR'', (#21));
#5=LwsAggregate(#21, .F., (#29));
#6=LwsQualifiedIdentifier(#15, .F., ''REFERENCE'', ());
#7=LwsPragma(#23, ''IMPORT_VALUED_PROCEDURE'', (#25, #19, #8, #9));
#8=LwsPragmaArgument(#7, $, #11);
#9=LwsPragmaArgument(#7, $, #15);
#10=LwsQualifiedIdentifier(#15, .F., ''VALUE'', ());
#11=LwsAggregate(#8, .F., (#26, #20, #2, #12, #24, #3, #13, #27));
#12=LwsQualifiedIdentifier(#11, .F., ''PROCESS_NAME_TYPE'', ());
#13=LwsQualifiedIdentifier(#11, .F., ''AST_HANDLER'', ());
#14=LwsQualifiedIdentifier(#25, .F., ''GETJPI'', ());
#15=LwsAggregate(#9, .F., (#16, #10, #28, #4, #6, #17, #18, #1));
#16=LwsQualifiedIdentifier(#15, .F., ''VALUE'', ());
#17=LwsQualifiedIdentifier(#15, .F., ''REFERENCE'', ());
#18=LwsQualifiedIdentifier(#15, .F., ''VALUE'', ());
#19=LwsPragmaArgument(#7, $, #22);
#20=LwsQualifiedIdentifier(#11, .F., ''EF_NUMBER_TYPE'', ());
#21=LwsArgumentsSelector(#4, #5);
#22=LwsStringLiteral(#19, .F., ''SYS$GETJPI'');
#23=LwsParsingResult($, (#7), $);
#24=LwsQualifiedIdentifier(#11, .F., ''ITEM_LIST_TYPE'', ());
#25=LwsPragmaArgument(#7, $, #14);
#26=LwsQualifiedIdentifier(#11, .F., ''COND_VALUE_TYPE'', ());
#27=LwsQualifiedIdentifier(#11, .F., ''USER_ARG_TYPE'', ());
#28=LwsQualifiedIdentifier(#15, .F., ''VALUE'', ());
#29=LwsQualifiedIdentifier(#5, .F., ''S'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''RANGE_CHECK'', ());
#2=LwsPragmaArgument(#4, ''ON'', #3);
#3=LwsQualifiedIdentifier(#2, .F., ''INDEX'', ());
#4=LwsPragma(#5, ''SUPPRESS'', (#6, #2));
#5=LwsParsingResult($, (#4), $);
#6=LwsPragmaArgument(#4, $, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''RANGE_CHECK'', ());
#2=LwsCharacterLiteral(#6, .F., ''I'');
#3=LwsPragma(#4, ''SUPPRESS'', (#5, #6));
#4=LwsParsingResult($, (#3), $);
#5=LwsPragmaArgument(#3, $, #1);
#6=LwsPragmaArgument(#3, ''ON'', #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPragma7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPragma(#4, ''SUPPRESS'', (#3));
#2=LwsCharacterLiteral(#3, .F., ''I'');
#3=LwsPragmaArgument(#1, $, #2);
#4=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsOrExpression(#2, .F., #4, #3);
#2=LwsParsingResult($, (#1), $);
#3=LwsQualifiedIdentifier(#1, .F., ''WARM'', ());
#4=LwsNotExpression(#1, .F., #5);
#5=LwsQualifiedIdentifier(#4, .F., ''SUNNY'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsDecimalLiteral(#8, .F., ''0.0'');
#3=LwsDecimalLiteral(#5, .F., ''4.0'');
#4=LwsAndExpression(#1, .F., #5, #8);
#5=LwsGreaterThanExpression(#4, .F., #7, #3);
#6=LwsQualifiedIdentifier(#8, .F., ''Y'', ());
#7=LwsQualifiedIdentifier(#5, .F., ''X'', ());
#8=LwsGreaterThanExpression(#4, .F., #6, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNegativeExpression(#3, .F., #5);
#2=LwsExpoExpression(#5, .F., #4, #7);
#3=LwsParsingResult($, (#1), $);
#4=LwsQualifiedIdentifier(#2, .F., ''A'', ());
#5=LwsMultExpression(#1, .F., #6, #2);
#6=LwsDecimalLiteral(#5, .F., ''4.0'');
#7=LwsDecimalLiteral(#2, .F., ''2'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#4), $);
#2=LwsQualifiedIdentifier(#4, .F., ''B'', ());
#3=LwsAbsExpression(#4, .F., #7);
#4=LwsPlusExpression(#1, .F., #3, #2);
#5=LwsQualifiedIdentifier(#7, .F., ''A'', ());
#6=LwsDecimalLiteral(#7, .F., ''1'');
#7=LwsPlusExpression(#3, .T., #6, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsExpoExpression(#1, .F., #5, #3);
#3=LwsNegativeExpression(#2, .T., #4);
#4=LwsDecimalLiteral(#3, .F., ''3'');
#5=LwsQualifiedIdentifier(#2, .F., ''Y'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrecedence6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''B'', ());
#2=LwsQualifiedIdentifier(#3, .F., ''A'', ());
#3=LwsDivExpression(#4, .F., #2, #1);
#4=LwsMultExpression(#5, .F., #3, #6);
#5=LwsParsingResult($, (#4), $);
#6=LwsQualifiedIdentifier(#4, .F., ''C'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrivateType1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPrivateTypeDefinition(#2, .F., .F.);
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrivateType2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsPrivateTypeDefinition(#1, .T., .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrivateType3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsPrivateTypeDefinition(#1, .T., .T.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testPrivateType4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsPrivateTypeDefinition(#1, .F., .T.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProcedureBody [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#2, (), .F., #5);
#2=LwsSubprogramBody(#4, (), #1, #3);
#3=LwsBlockBody(#2, (#6), ());
#4=LwsParsingResult($, (#2), $);
#5=LwsCompoundName(#1, (''P2''));
#6=LwsProcedureCall(#3, (), #7);
#7=LwsQualifiedIdentifier(#6, .F., ''Put'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProcedureDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#3, (''TRAVERSE_TREE''));
#2=LwsParsingResult($, (#3), $);
#3=LwsProcedureDeclaration(#2, (), .F., #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProcedureDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#3, (''INCREMENT''));
#2=LwsFormalParameter(#3, (''X''), .inputOutputMode., #4, $);
#3=LwsProcedureDeclaration(#5, (#2), .F., #1);
#4=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#5=LwsParsingResult($, (#3), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProcedureDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''LINK'', ());
#2=LwsProcedureDeclaration(#4, (#5), .F., #3);
#3=LwsCompoundName(#2, (''SWITCH''));
#4=LwsParsingResult($, (#2), $);
#5=LwsFormalParameter(#2, (''FROM'', ''TO''), .inputOutputMode., #1, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProcedureDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#8, (''CENTER''), .inputMode., #2, #5);
#2=LwsQualifiedIdentifier(#1, .F., ''BOOLEAN'', ());
#3=LwsCompoundName(#8, (''PRINT_HEADER''));
#4=LwsFormalParameter(#8, (''PAGES''), .inputMode., #10, $);
#5=LwsQualifiedIdentifier(#1, .F., ''TRUE'', ());
#6=LwsParsingResult($, (#8), $);
#7=LwsQualifiedIdentifier(#18, .F., ''LINE'', ());
#8=LwsProcedureDeclaration(#6, (#4, #18, #1), .F., #3);
#9=LwsRangeChoice(#11, #15);
#10=LwsQualifiedIdentifier(#4, .F., ''NATURAL'', ());
#11=LwsComponentAssociation(#17, #14, (#9));
#12=LwsQualifiedIdentifier(#15, .F., ''LINE'', (#13));
#13=LwsNamedAttribute(#12, ''LAST'');
#14=LwsCharacterLiteral(#11, .F., '' '');
#15=LwsExplicitRange(#9, .F., #16, #12);
#16=LwsDecimalLiteral(#15, .F., ''1'');
#17=LwsAggregate(#18, .F., (#11));
#18=LwsFormalParameter(#8, (''HEADER''), .inputMode., #7, #17);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedBody1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryBodyPart(#6, (), #2);
#2=LwsBlockBody(#1, (#10), ());
#3=LwsQualifiedIdentifier(#10, .F., ''Busy'', ());
#4=LwsAssignment(#7, (), #5, #14);
#5=LwsQualifiedIdentifier(#4, .F., ''Busy'', ());
#6=LwsEntryBody(#9, ''Seize'', $, (), #16, #1);
#7=LwsBlockBody(#11, (#4), ());
#8=LwsQualifiedIdentifier(#10, .F., ''True'', ());
#9=LwsProtectedUnitBody(#17, ''Resource'', (#6, #11));
#10=LwsAssignment(#2, (), #3, #8);
#11=LwsSubprogramBody(#9, (), #15, #7);
#12=LwsCompoundName(#15, (''Release''));
#13=LwsQualifiedIdentifier(#16, .F., ''Busy'', ());
#14=LwsQualifiedIdentifier(#4, .F., ''False'', ());
#15=LwsProcedureDeclaration(#11, (), .F., #12);
#16=LwsNotExpression(#6, .F., #13);
#17=LwsParsingResult($, (#9), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedBody2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#11, .F., ''n'', ());
#2=LwsProtectedUnitBody(#5, ''track_handler'', (#24, #14));
#3=LwsFormalParameter(#24, (''n''), .inputMode., #25, $);
#4=LwsQualifiedIdentifier(#8, .F., ''track_part_type'', ());
#5=LwsParsingResult($, (#2), $);
#6=LwsProcedureCall(#29, (), #18);
#7=LwsAggregate(#19, .F., (#16));
#8=LwsFormalParameter(#14, (''n''), .inputMode., #4, $);
#9=LwsBlockBody(#15, (#12), ());
#10=LwsAggregate(#22, .F., (#21));
#11=LwsAggregate(#23, .F., (#1));
#12=LwsProcedureCall(#9, (), #30);
#13=LwsArgumentsSelector(#18, #28);
#14=LwsEntryBody(#2, ''track_rel'', $, (#8), #26, #15);
#15=LwsEntryBodyPart(#14, (), #9);
#16=LwsQualifiedIdentifier(#7, .F., ''n'', ());
#17=LwsQualifiedIdentifier(#28, .F., ''n'', ());
#18=LwsQualifiedIdentifier(#6, .F., ''req'', (#13));
#19=LwsArgumentsSelector(#26, #7);
#20=LwsQualifiedIdentifier(#24, .F., ''track_available'', (#22));
#21=LwsQualifiedIdentifier(#10, .F., ''n'', ());
#22=LwsArgumentsSelector(#20, #10);
#23=LwsArgumentsSelector(#30, #11);
#24=LwsEntryBody(#2, ''track_req'', $, (#3), #20, #27);
#25=LwsQualifiedIdentifier(#3, .F., ''track_part_type'', ());
#26=LwsQualifiedIdentifier(#14, .F., ''track_available'', (#19));
#27=LwsEntryBodyPart(#24, (), #29);
#28=LwsAggregate(#13, .F., (#17));
#29=LwsBlockBody(#27, (#6), ());
#30=LwsQualifiedIdentifier(#12, .F., ''rel'', (#23));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedBody3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#23, .F., ''Empty'', ());
#2=LwsFormalParameter(#19, (''An_Item''), .outputMode., #7, $);
#3=LwsQualifiedIdentifier(#27, .F., ''An_Item'', ());
#4=LwsAssignment(#15, (), #24, #13);
#5=LwsQualifiedIdentifier(#26, .F., ''Item'', ());
#6=LwsAssignment(#16, (), #14, #8);
#7=LwsQualifiedIdentifier(#2, .F., ''Item'', ());
#8=LwsQualifiedIdentifier(#6, .F., ''Buffer'', ());
#9=LwsProtectedUnitBody(#11, ''Protected_Buffer_Type'', (#12, #19));
#10=LwsEntryBodyPart(#12, (), #15);
#11=LwsParsingResult($, (#9), $);
#12=LwsEntryBody(#9, ''Insert'', $, (#26), #25, #10);
#13=LwsQualifiedIdentifier(#4, .F., ''False'', ());
#14=LwsQualifiedIdentifier(#6, .F., ''An_Item'', ());
#15=LwsBlockBody(#10, (#27, #4), ());
#16=LwsBlockBody(#18, (#6, #20), ());
#17=LwsQualifiedIdentifier(#27, .F., ''Buffer'', ());
#18=LwsEntryBodyPart(#19, (), #16);
#19=LwsEntryBody(#9, ''Remove'', $, (#2), #23, #18);
#20=LwsAssignment(#16, (), #22, #21);
#21=LwsQualifiedIdentifier(#20, .F., ''True'', ());
#22=LwsQualifiedIdentifier(#20, .F., ''Empty'', ());
#23=LwsNotExpression(#19, .F., #1);
#24=LwsQualifiedIdentifier(#4, .F., ''Empty'', ());
#25=LwsQualifiedIdentifier(#12, .F., ''Empty'', ());
#26=LwsFormalParameter(#12, (''An_Item''), .inputMode., #5, $);
#27=LwsAssignment(#15, (), #17, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitBodyStubDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsProtectedUnitBodyStubDeclaration(#1, ''Handler'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#17, (''Component''));
#2=LwsComponentAssociation(#27, #6, (#3));
#3=LwsOtherChoice(#2);
#4=LwsQualifiedIdentifier(#23, .F., ''Index'', ());
#5=LwsProtectedUnitDeclaration(#8, ''Shared_Array'', #9);
#6=LwsQualifiedIdentifier(#2, .F., ''Null_Item'', ());
#7=LwsFormalParameter(#17, (''N''), .inputMode., #10, $);
#8=LwsParsingResult($, (#5), $);
#9=LwsProtectedUnitDefinition(#5, #24, #26);
#10=LwsQualifiedIdentifier(#7, .F., ''Index'', ());
#11=LwsCompoundName(#22, (''Set_Component''));
#12=LwsFormalParameter(#22, (''E''), .inputMode., #15, $);
#13=LwsQualifiedIdentifier(#20, .F., ''Item_Array'', (#18));
#14=LwsComponentAttribute(#26, (''Table''), #16, #27);
#15=LwsQualifiedIdentifier(#12, .F., ''Item'', ());
#16=LwsComponentSubtype(#14, .F., #20);
#17=LwsFunctionDeclaration(#24, (#7), .F., #1, #21);
#18=LwsArgumentsSelector(#13, #23);
#19=LwsFormalParameter(#22, (''N''), .inputMode., #25, $);
#20=LwsSubtypeIndication(#16, #13, $);
#21=LwsQualifiedIdentifier(#17, .F., ''Item'', ());
#22=LwsProcedureDeclaration(#24, (#19, #12), .F., #11);
#23=LwsAggregate(#18, .F., (#4));
#24=LwsProtectedUnitPublicPart(#9, (#17, #22));
#25=LwsQualifiedIdentifier(#19, .F., ''Index'', ());
#26=LwsProtectedUnitPrivatePart(#9, (#14));
#27=LwsAggregate(#14, .F., (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitTypeDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProtectedUnitPublicPart(#2, (#7, #12));
#2=LwsProtectedUnitDefinition(#10, #1, #13);
#3=LwsCompoundName(#12, (''Release''));
#4=LwsQualifiedIdentifier(#9, .F., ''Boolean'', ());
#5=LwsComponentAttribute(#13, (''Busy''), #8, #6);
#6=LwsQualifiedIdentifier(#5, .F., ''False'', ());
#7=LwsEntryDeclaration(#1, ''Seize'', $, ());
#8=LwsComponentSubtype(#5, .F., #9);
#9=LwsSubtypeIndication(#8, #4, $);
#10=LwsProtectedUnitTypeDeclaration(#11, ''Resource'', #2, $);
#11=LwsParsingResult($, (#10), $);
#12=LwsProcedureDeclaration(#1, (), .F., #3);
#13=LwsProtectedUnitPrivatePart(#2, (#5));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitTypeDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureDeclaration(#2, (), .F., #5);
#2=LwsProtectedUnitPublicPart(#4, (#8, #1));
#3=LwsCompoundName(#8, (''Op1''));
#4=LwsProtectedUnitDefinition(#6, #2, $);
#5=LwsCompoundName(#1, (''Op2''));
#6=LwsProtectedUnitTypeDeclaration(#7, ''Pt'', #4, $);
#7=LwsParsingResult($, (#6), $);
#8=LwsProcedureDeclaration(#2, (), .F., #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitTypeDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProtectedUnitTypeDeclaration(#12, ''Protected_Buffer_Type'', #7, $);
#2=LwsQualifiedIdentifier(#4, .F., ''Boolean'', ());
#3=LwsFormalParameter(#16, (''An_Item''), .inputMode., #13, $);
#4=LwsSubtypeIndication(#15, #2, $);
#5=LwsQualifiedIdentifier(#17, .F., ''Item'', ());
#6=LwsProtectedUnitPrivatePart(#7, (#9, #11));
#7=LwsProtectedUnitDefinition(#1, #10, #6);
#8=LwsComponentSubtype(#9, .F., #18);
#9=LwsComponentAttribute(#6, (''Buffer''), #8, $);
#10=LwsProtectedUnitPublicPart(#7, (#16, #20));
#11=LwsComponentAttribute(#6, (''Empty''), #15, #19);
#12=LwsParsingResult($, (#1), $);
#13=LwsQualifiedIdentifier(#3, .F., ''Item'', ());
#14=LwsQualifiedIdentifier(#18, .F., ''Item'', ());
#15=LwsComponentSubtype(#11, .F., #4);
#16=LwsEntryDeclaration(#10, ''Insert'', $, (#3));
#17=LwsFormalParameter(#20, (''An_Item''), .outputMode., #5, $);
#18=LwsSubtypeIndication(#8, #14, $);
#19=LwsQualifiedIdentifier(#11, .F., ''True'', ());
#20=LwsEntryDeclaration(#10, ''Remove'', $, (#17));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testProtectedUnitTypeDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#12, .F., ''Integer'', ());
#2=LwsCompoundName(#3, (''Set''));
#3=LwsProcedureDeclaration(#11, (#12), .F., #2);
#4=LwsCompoundName(#19, (''Increment''));
#5=LwsCompoundName(#6, (''Get''));
#6=LwsFunctionDeclaration(#11, (), .F., #5, #7);
#7=LwsQualifiedIdentifier(#6, .F., ''Integer'', ());
#8=LwsFormalParameter(#19, (''By''), $, #21, $);
#9=LwsComponentSubtype(#20, .F., #18);
#10=LwsProtectedUnitTypeDeclaration(#13, ''T'', #17, $);
#11=LwsProtectedUnitPublicPart(#17, (#3, #19, #6));
#12=LwsFormalParameter(#3, (''To''), $, #1, $);
#13=LwsParsingResult($, (#10), $);
#14=LwsQualifiedIdentifier(#18, .F., ''Integer'', ());
#15=LwsDecimalLiteral(#20, .F., ''0'');
#16=LwsProtectedUnitPrivatePart(#17, (#20));
#17=LwsProtectedUnitDefinition(#10, #11, #16);
#18=LwsSubtypeIndication(#9, #14, $);
#19=LwsProcedureDeclaration(#11, (#8), .F., #4);
#20=LwsComponentAttribute(#16, (''Value''), #9, #15);
#21=LwsQualifiedIdentifier(#8, .F., ''Integer'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRange1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsDecimalLiteral(#3, .F., ''5'');
#3=LwsExplicitRange(#1, .F., #2, #4);
#4=LwsDecimalLiteral(#3, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRange2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedRange(#3, .F., #2, $);
#2=LwsQualifiedIdentifier(#1, .F., ''ARR'', ());
#3=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRange3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''N'', ());
#2=LwsNamedRange(#3, .F., #4, #1);
#3=LwsParsingResult($, (#2), $);
#4=LwsQualifiedIdentifier(#2, .F., ''ARR'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRange4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedRange(#7, .F., #2, #4);
#2=LwsQualifiedIdentifier(#1, .F., ''ARR'', ());
#3=LwsAggregate(#5, .F., (#6));
#4=LwsQualifiedIdentifier(#1, .F., ''N'', (#5));
#5=LwsArgumentsSelector(#4, #3);
#6=LwsDecimalLiteral(#3, .F., ''4'');
#7=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRange5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#8, .F., ''4'');
#2=LwsDecimalLiteral(#8, .F., ''10'');
#3=LwsParsingResult($, (#4), $);
#4=LwsNamedRange(#3, .F., #5, #9);
#5=LwsQualifiedIdentifier(#4, .F., ''ARR'', ());
#6=LwsArgumentsSelector(#9, #7);
#7=LwsAggregate(#6, .F., (#8));
#8=LwsExplicitRange(#7, .F., #1, #2);
#9=LwsQualifiedIdentifier(#4, .F., ''TABLE'', (#6));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testReal1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''3.14159_26536'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testReal2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsDecimalLiteral(#1, .F., ''1.34E-12'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testReal3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''1.0E+6'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAttribute(#13, (''DAY''), #5, $);
#2=LwsQualifiedIdentifier(#20, .F., ''INTEGER'', ());
#3=LwsDecimalLiteral(#16, .F., ''1'');
#4=LwsDecimalLiteral(#16, .F., ''31'');
#5=LwsComponentSubtype(#1, .F., #20);
#6=LwsRangeConstraint(#12, #8);
#7=LwsParsingResult($, (#14), $);
#8=LwsExplicitRange(#6, .F., #22, #19);
#9=LwsQualifiedIdentifier(#12, .F., ''INTEGER'', ());
#10=LwsComponentAttribute(#13, (''MONTH''), #17, $);
#11=LwsQualifiedIdentifier(#18, .F., ''MONTH_NAME'', ());
#12=LwsSubtypeIndication(#21, #9, #6);
#13=LwsRecordDefinition(#14, (#1, #10, #23), $);
#14=LwsDefinedRecordType(#7, .F., .F., .F., #13);
#15=LwsRangeConstraint(#20, #16);
#16=LwsExplicitRange(#15, .F., #3, #4);
#17=LwsComponentSubtype(#10, .F., #18);
#18=LwsSubtypeIndication(#17, #11, $);
#19=LwsDecimalLiteral(#8, .F., ''4000'');
#20=LwsSubtypeIndication(#5, #2, #15);
#21=LwsComponentSubtype(#23, .F., #12);
#22=LwsDecimalLiteral(#8, .F., ''0'');
#23=LwsComponentAttribute(#13, (''YEAR''), #21, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsNullRecordType(#1, .F., .F., .F.);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRecordDefinition(#3, (), $);
#2=LwsParsingResult($, (#3), $);
#3=LwsDefinedRecordType(#2, .F., .F., .F., #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDefinedRecordType(#3, .F., .F., .F., #7);
#2=LwsQualifiedIdentifier(#10, .F., ''REAL'', ());
#3=LwsParsingResult($, (#1), $);
#4=LwsQualifiedIdentifier(#13, .F., ''REAL'', ());
#5=LwsComponentAttribute(#7, (''IM''), #12, #6);
#6=LwsDecimalLiteral(#5, .F., ''0.0'');
#7=LwsRecordDefinition(#1, (#8, #5), $);
#8=LwsComponentAttribute(#7, (''RE''), #9, #11);
#9=LwsComponentSubtype(#8, .F., #10);
#10=LwsSubtypeIndication(#9, #2, $);
#11=LwsDecimalLiteral(#8, .F., ''0.0'');
#12=LwsComponentSubtype(#5, .F., #13);
#13=LwsSubtypeIndication(#12, #4, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#13, .F., ''1'');
#2=LwsQualifiedIdentifier(#10, .F., ''BUFFER_SIZE'', ());
#3=LwsQualifiedIdentifier(#13, .F., ''SIZE'', ());
#4=LwsParsingResult($, (#15), $);
#5=LwsComponentAttribute(#8, (''POS''), #14, #11);
#6=LwsArgumentsSelector(#9, #7);
#7=LwsAggregate(#6, .F., (#13));
#8=LwsRecordDefinition(#15, (#5, #16), $);
#9=LwsQualifiedIdentifier(#12, .F., ''STRING'', (#6));
#10=LwsSubtypeIndication(#14, #2, $);
#11=LwsDecimalLiteral(#5, .F., ''0'');
#12=LwsSubtypeIndication(#17, #9, $);
#13=LwsExplicitRange(#7, .F., #1, #3);
#14=LwsComponentSubtype(#5, .F., #10);
#15=LwsDefinedRecordType(#4, .F., .F., .F., #8);
#16=LwsComponentAttribute(#8, (''VALUE''), #17, $);
#17=LwsComponentSubtype(#16, .F., #12);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAttribute(#6, (''MAT''), #2, $);
#2=LwsComponentSubtype(#1, .F., #12);
#3=LwsAggregate(#15, .F., (#13, #7));
#4=LwsDecimalLiteral(#13, .F., ''1'');
#5=LwsQualifiedIdentifier(#13, .F., ''SIDE'', ());
#6=LwsRecordDefinition(#8, (#1), $);
#7=LwsExplicitRange(#3, .F., #9, #10);
#8=LwsDefinedRecordType(#14, .F., .F., .F., #6);
#9=LwsDecimalLiteral(#7, .F., ''1'');
#10=LwsQualifiedIdentifier(#7, .F., ''SIDE'', ());
#11=LwsQualifiedIdentifier(#12, .F., ''MATRIX'', (#15));
#12=LwsSubtypeIndication(#2, #11, $);
#13=LwsExplicitRange(#3, .F., #4, #5);
#14=LwsParsingResult($, (#8), $);
#15=LwsArgumentsSelector(#11, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#14, #3);
#2=LwsSubtypeIndication(#6, #17, $);
#3=LwsAggregate(#1, .F., (#16));
#4=LwsDefinedRecordType(#8, .F., .F., .F., #11);
#5=LwsComponentAttribute(#11, (''RIGHT''), #6, $);
#6=LwsComponentSubtype(#5, .F., #2);
#7=LwsQualifiedIdentifier(#10, .F., ''NUMBER'', ());
#8=LwsParsingResult($, (#4), $);
#9=LwsArgumentsSelector(#17, #10);
#10=LwsAggregate(#9, .F., (#7));
#11=LwsRecordDefinition(#4, (#13, #5), $);
#12=LwsSubtypeIndication(#15, #14, $);
#13=LwsComponentAttribute(#11, (''LEFT''), #15, $);
#14=LwsQualifiedIdentifier(#12, .F., ''SQUARE'', (#1));
#15=LwsComponentSubtype(#13, .F., #12);
#16=LwsQualifiedIdentifier(#3, .F., ''NUMBER'', ());
#17=LwsQualifiedIdentifier(#2, .F., ''SQUARE'', (#9));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRecordDefinition(#11, (#5, #9), $);
#2=LwsAggregate(#15, .F., (#13));
#3=LwsQualifiedIdentifier(#6, .F., ''SQUARE'', (#14));
#4=LwsQualifiedIdentifier(#16, .F., ''NUMBER'', ());
#5=LwsComponentAttribute(#1, (''RIGHT'', ''LEFT''), #12, $);
#6=LwsSubtypeIndication(#10, #3, $);
#7=LwsSubtypeIndication(#12, #8, $);
#8=LwsQualifiedIdentifier(#7, .F., ''SQUARE'', (#15));
#9=LwsComponentAttribute(#1, (''TOP'', ''BOTTOM''), #10, $);
#10=LwsComponentSubtype(#9, .F., #6);
#11=LwsDefinedRecordType(#17, .F., .F., .F., #1);
#12=LwsComponentSubtype(#5, .F., #7);
#13=LwsQualifiedIdentifier(#2, .F., ''NUMBER'', ());
#14=LwsArgumentsSelector(#3, #16);
#15=LwsArgumentsSelector(#8, #2);
#16=LwsAggregate(#14, .F., (#4));
#17=LwsParsingResult($, (#11), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDefinedRecordType(#6, .F., .F., .F., #2);
#2=LwsRecordDefinition(#1, (#7), $);
#3=LwsComponentSubtype(#7, .F., #5);
#4=LwsQualifiedIdentifier(#5, .F., ''INTEGER'', ());
#5=LwsSubtypeIndication(#3, #4, $);
#6=LwsParsingResult($, (#1), $);
#7=LwsComponentAttribute(#2, (''CONTENT''), #3, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecord9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#2, #5, $);
#2=LwsComponentSubtype(#4, .F., #1);
#3=LwsRecordDefinition(#7, (#4), $);
#4=LwsComponentAttribute(#3, (''CONTENT''), #2, $);
#5=LwsQualifiedIdentifier(#1, .F., ''INTEGER'', ());
#6=LwsParsingResult($, (#7), $);
#7=LwsDefinedRecordType(#6, .T., .F., .T., #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordElement1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#2, .F., ''TOMORROW'', (#3));
#2=LwsParsingResult($, (#1), $);
#3=LwsNamedSelector(#1, ''MONTH'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordElement2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsNamedSelector(#3, ''OWNER'');
#3=LwsQualifiedIdentifier(#1, .F., ''NEXT_CAR'', (#2, #4));
#4=LwsNamedSelector(#3, ''AGE'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordElement3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#4, ''VALUE'');
#2=LwsAggregate(#5, .F., (#6));
#3=LwsParsingResult($, (#4), $);
#4=LwsQualifiedIdentifier(#3, .F., ''MIN_CELL'', (#5, #1));
#5=LwsArgumentsSelector(#4, #2);
#6=LwsQualifiedIdentifier(#2, .F., ''H'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordWithVariant1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsRecordDefinition(#14, (#15, #19), $);
#2=LwsExpressionChoice(#3, #23);
#3=LwsVariantComponentAttribute(#11, (#2), #24);
#4=LwsComponentSubtype(#20, .F., #21);
#5=LwsQualifiedIdentifier(#8, .F., ''PAGE_SIZE'', ());
#6=LwsOtherChoice(#14);
#7=LwsQualifiedIdentifier(#13, .F., ''STATE'', ());
#8=LwsExplicitRange(#29, .F., #16, #5);
#9=LwsQualifiedIdentifier(#12, .F., ''CYLINDER_INDEX'', ());
#10=LwsQualifiedIdentifier(#31, .F., ''TRACK_NUMBER'', ());
#11=LwsVariantRecordPart(#27, #32, (#3, #14));
#12=LwsSubtypeIndication(#17, #9, $);
#13=LwsSubtypeIndication(#18, #7, $);
#14=LwsVariantComponentAttribute(#11, (#6), #1);
#15=LwsComponentAttribute(#1, (''CYLINDER''), #17, $);
#16=LwsDecimalLiteral(#8, .F., ''1'');
#17=LwsComponentSubtype(#15, .F., #12);
#18=LwsComponentSubtype(#22, .F., #13);
#19=LwsComponentAttribute(#1, (''TRACK''), #30, $);
#20=LwsComponentAttribute(#24, (''LINE_COUNT''), #4, $);
#21=LwsSubtypeIndication(#4, #28, #29);
#22=LwsComponentAttribute(#27, (''STATUS''), #18, $);
#23=LwsQualifiedIdentifier(#2, .F., ''PRINTER'', ());
#24=LwsRecordDefinition(#3, (#20), $);
#25=LwsParsingResult($, (#26), $);
#26=LwsDefinedRecordType(#25, .F., .F., .F., #27);
#27=LwsRecordDefinition(#26, (#22), #11);
#28=LwsQualifiedIdentifier(#21, .F., ''INTEGER'', ());
#29=LwsRangeConstraint(#21, #8);
#30=LwsComponentSubtype(#19, .F., #31);
#31=LwsSubtypeIndication(#30, #10, $);
#32=LwsSimpleIdentifier(#11, .F., ''UNIT'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordWithVariant2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAssociation(#37, #3, (#43));
#2=LwsAggregate(#55, .F., (#26));
#3=LwsQualifiedIdentifier(#1, .F., ''M'', ());
#4=LwsQualifiedIdentifier(#21, .F., ''CAR_NAME'', ());
#5=LwsVariantRecordPart(#14, #11, (#52, #33));
#6=LwsSubtypeIndication(#39, #54, $);
#7=LwsComponentAttribute(#15, (''HUSBAND''), #48, $);
#8=LwsQualifiedIdentifier(#9, .F., ''DATE'', ());
#9=LwsSubtypeIndication(#31, #8, $);
#10=LwsComponentSubtype(#23, .F., #22);
#11=LwsSimpleIdentifier(#5, .F., ''SEX'');
#12=LwsQualifiedIdentifier(#22, .F., ''STRING'', (#55));
#13=LwsRecordDefinition(#52, (#19), $);
#14=LwsRecordDefinition(#16, (#23, #20, #58, #24), #5);
#15=LwsRecordDefinition(#33, (#7), $);
#16=LwsDefinedRecordType(#34, .F., .F., .F., #14);
#17=LwsSubtypeIndication(#48, #57, $);
#18=LwsDecimalLiteral(#30, .F., ''130'');
#19=LwsComponentAttribute(#13, (''WIFE''), #39, $);
#20=LwsComponentAttribute(#14, (''BIRTH''), #31, $);
#21=LwsSubtypeIndication(#51, #4, $);
#22=LwsSubtypeIndication(#10, #12, $);
#23=LwsComponentAttribute(#14, (''NAME''), #10, $);
#24=LwsComponentAttribute(#14, (''VEHICLE''), #51, $);
#25=LwsArgumentsSelector(#54, #32);
#26=LwsExplicitRange(#2, .F., #29, #36);
#27=LwsExpressionChoice(#41, #28);
#28=LwsQualifiedIdentifier(#27, .F., ''SEX'', ());
#29=LwsDecimalLiteral(#26, .F., ''1'');
#30=LwsExplicitRange(#40, .F., #49, #18);
#31=LwsComponentSubtype(#20, .F., #9);
#32=LwsAggregate(#25, .F., (#41));
#33=LwsVariantComponentAttribute(#5, (#44), #15);
#34=LwsParsingResult($, (#16), $);
#35=LwsArgumentsSelector(#57, #37);
#36=LwsDecimalLiteral(#26, .F., ''20'');
#37=LwsAggregate(#35, .F., (#1));
#38=LwsSubtypeIndication(#56, #53, #40);
#39=LwsComponentSubtype(#19, .F., #6);
#40=LwsRangeConstraint(#38, #30);
#41=LwsComponentAssociation(#32, #46, (#27));
#42=LwsQualifiedIdentifier(#44, .F., ''F'', ());
#43=LwsExpressionChoice(#1, #45);
#44=LwsExpressionChoice(#33, #42);
#45=LwsQualifiedIdentifier(#43, .F., ''SEX'', ());
#46=LwsQualifiedIdentifier(#41, .F., ''F'', ());
#47=LwsQualifiedIdentifier(#50, .F., ''M'', ());
#48=LwsComponentSubtype(#7, .F., #17);
#49=LwsDecimalLiteral(#30, .F., ''0'');
#50=LwsExpressionChoice(#52, #47);
#51=LwsComponentSubtype(#24, .F., #21);
#52=LwsVariantComponentAttribute(#5, (#50), #13);
#53=LwsQualifiedIdentifier(#38, .F., ''INTEGER'', ());
#54=LwsQualifiedIdentifier(#6, .F., ''PERSON_NAME'', (#25));
#55=LwsArgumentsSelector(#12, #2);
#56=LwsComponentSubtype(#58, .F., #38);
#57=LwsQualifiedIdentifier(#17, .F., ''PERSON_NAME'', (#35));
#58=LwsComponentAttribute(#14, (''AGE''), #56, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRecordWithVariant3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAttribute(#15, (''precedence_source''), #14, $);
#2=LwsQualifiedIdentifier(#9, .F., ''Generic_Task_Ptr'', ());
#3=LwsQualifiedIdentifier(#10, .F., ''Generic_Task_Ptr'', ());
#4=LwsVariantComponentAttribute(#13, (#20), #11);
#5=LwsComponentAttribute(#15, (''precedence_sink''), #16, $);
#6=LwsSubtypeIndication(#12, #31, $);
#7=LwsQualifiedIdentifier(#20, .F., ''queuing_buffer_dependency'', ());
#8=LwsExpressionChoice(#29, #21);
#9=LwsSubtypeIndication(#14, #2, $);
#10=LwsSubtypeIndication(#16, #3, $);
#11=LwsRecordDefinition(#4, (#23, #30, #24), $);
#12=LwsComponentSubtype(#30, .F., #6);
#13=LwsVariantRecordPart(#19, #18, (#29, #4));
#14=LwsComponentSubtype(#1, .F., #9);
#15=LwsRecordDefinition(#29, (#5, #1), $);
#16=LwsComponentSubtype(#5, .F., #10);
#17=LwsQualifiedIdentifier(#25, .F., ''Queuing_Buffer_Ptr'', ());
#18=LwsSimpleIdentifier(#13, .F., ''ptype'');
#19=LwsRecordDefinition(#27, (), #13);
#20=LwsExpressionChoice(#4, #7);
#21=LwsQualifiedIdentifier(#8, .F., ''precedence_dependency'', ());
#22=LwsQualifiedIdentifier(#28, .F., ''Generic_Task_Ptr'', ());
#23=LwsComponentAttribute(#11, (''buffer_dependent_task''), #33, $);
#24=LwsComponentAttribute(#11, (''buffer_dependency_object''), #32, $);
#25=LwsSubtypeIndication(#32, #17, $);
#26=LwsParsingResult($, (#27), $);
#27=LwsDefinedRecordType(#26, .F., .F., .F., #19);
#28=LwsSubtypeIndication(#33, #22, $);
#29=LwsVariantComponentAttribute(#13, (#8), #15);
#30=LwsComponentAttribute(#11, (''buffer_orientation''), #12, $);
#31=LwsQualifiedIdentifier(#6, .F., ''Orientation_Dependency_Type'', ());
#32=LwsComponentSubtype(#24, .F., #25);
#33=LwsComponentSubtype(#23, .F., #28);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testRem1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#2, .F., ''10'');
#2=LwsRemExpression(#4, .F., #3, #1);
#3=LwsQualifiedIdentifier(#2, .F., ''x'', ());
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSelectWait1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAcceptAlternative(#12, $, (#2));
#2=LwsAcceptStatement(#1, (), #6, (), (), ());
#3=LwsProcedureCall(#8, (), #11);
#4=LwsParsingResult($, (#12), $);
#5=LwsDecimalLiteral(#7, .F., ''30.0'');
#6=LwsQualifiedIdentifier(#2, .F., ''DRIVER_AWAKE_SIGNAL'', ());
#7=LwsMultExpression(#9, .F., #5, #10);
#8=LwsDelayAlternative(#12, $, (#9, #3));
#9=LwsDelayStatement(#8, (), #7);
#10=LwsQualifiedIdentifier(#7, .F., ''SECONDS'', ());
#11=LwsQualifiedIdentifier(#3, .F., ''STOP_THE_TRAIN'', ());
#12=LwsSelectiveWaitStatement(#4, (), (#1, #8), ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSelectWait2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAcceptAlternative(#16, $, (#12));
#2=LwsAssignment(#12, (), #4, #15);
#3=LwsQualifiedIdentifier(#6, .F., ''SEIZE'', ());
#4=LwsQualifiedIdentifier(#2, .F., ''BUSY'', ());
#5=LwsParsingResult($, (#16), $);
#6=LwsAcceptStatement(#13, (), #3, (), (#17), ());
#7=LwsQualifiedIdentifier(#12, .F., ''RELEASE'', ());
#8=LwsQualifiedIdentifier(#17, .F., ''TRUE'', ());
#9=LwsTerminateAlternative(#16, $);
#10=LwsQualifiedIdentifier(#17, .F., ''BUSY'', ());
#11=LwsQualifiedIdentifier(#14, .F., ''BUSY'', ());
#12=LwsAcceptStatement(#1, (), #7, (), (#2), ());
#13=LwsAcceptAlternative(#16, #14, (#6));
#14=LwsNotExpression(#13, .F., #11);
#15=LwsQualifiedIdentifier(#2, .F., ''FALSE'', ());
#16=LwsSelectiveWaitStatement(#5, (), (#13, #1, #9), ());
#17=LwsAssignment(#6, (), #10, #8);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSelectWait3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsTimedEntryCall(#7, (), (#2), (#15, #3));
#2=LwsEntryCall(#1, (), #8);
#3=LwsProcedureCall(#1, (), #12);
#4=LwsAggregate(#17, .F., (#10));
#5=LwsDecimalLiteral(#6, .F., ''0.1'');
#6=LwsMultExpression(#15, .F., #5, #11);
#7=LwsParsingResult($, (#1), $);
#8=LwsQualifiedIdentifier(#2, .F., ''Restaurant'', (#9, #17));
#9=LwsNamedSelector(#8, ''Eat_A_Meal'');
#10=LwsQualifiedIdentifier(#4, .F., ''My_Name'', ());
#11=LwsQualifiedIdentifier(#6, .F., ''HOURS'', ());
#12=LwsQualifiedIdentifier(#3, .F., ''Burger_Boy'', (#16, #13));
#13=LwsArgumentsSelector(#12, #14);
#14=LwsAggregate(#13, .F., (#18));
#15=LwsDelayStatement(#1, (), #6);
#16=LwsNamedSelector(#12, ''Eat_A_Meal'');
#17=LwsArgumentsSelector(#8, #4);
#18=LwsQualifiedIdentifier(#14, .F., ''My_Name'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSelectWait4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#15, (''Customer''), $, #33, $);
#2=LwsExitStatement(#19, (), $, $);
#3=LwsProcedureCall(#15, (), #6);
#4=LwsAggregate(#17, .F., (#26));
#5=LwsQualifiedIdentifier(#16, .F., ''HOURS'', ());
#6=LwsQualifiedIdentifier(#3, .F., ''Put'', (#17));
#7=LwsArgumentsSelector(#24, #46);
#8=LwsDelayStatement(#15, (), #41);
#9=LwsProcedureCall(#15, (), #13);
#10=LwsProcedureCall(#15, (), #24);
#11=LwsAggregate(#23, .F., (#32));
#12=LwsAggregate(#22, .F., (#28));
#13=LwsQualifiedIdentifier(#9, .F., ''Put'', (#23));
#14=LwsSelectiveWaitStatement(#29, (), (#25, #19), ());
#15=LwsAcceptStatement(#25, (), #38, (#1), (#9, #10, #35, #3, #43, #8), ());
#16=LwsMultExpression(#35, .F., #44, #5);
#17=LwsArgumentsSelector(#6, #4);
#18=LwsDecimalLiteral(#41, .F., ''0.5'');
#19=LwsDelayAlternative(#14, $, (#36, #20, #2));
#20=LwsProcedureCall(#19, (), #27);
#21=LwsDecimalLiteral(#45, .F., ''1.5'');
#22=LwsArgumentsSelector(#27, #12);
#23=LwsArgumentsSelector(#13, #11);
#24=LwsQualifiedIdentifier(#10, .F., ''Put_Line'', (#7));
#25=LwsAcceptAlternative(#14, $, (#15));
#26=LwsQualifiedIdentifier(#4, .F., ''Customer'', ());
#27=LwsQualifiedIdentifier(#20, .F., ''Put_Line'', (#22));
#28=LwsStringLiteral(#12, .F., ''The restaurant is closed for the day'');
#29=LwsParsingResult($, (#14), $);
#30=LwsAggregate(#40, .F., (#37));
#31=LwsQualifiedIdentifier(#41, .F., ''HOURS'', ());
#32=LwsQualifiedIdentifier(#11, .F., ''Customer'', ());
#33=LwsQualifiedIdentifier(#1, .F., ''PERSON'', ());
#34=LwsQualifiedIdentifier(#43, .F., ''Put_Line'', (#40));
#35=LwsDelayStatement(#15, (), #16);
#36=LwsDelayStatement(#19, (), #45);
#37=LwsStringLiteral(#30, .F., '' is eating at the restaurant'');
#38=LwsQualifiedIdentifier(#15, .F., ''Eat_A_Meal'', ());
#39=LwsQualifiedIdentifier(#45, .F., ''HOURS'', ());
#40=LwsArgumentsSelector(#34, #30);
#41=LwsMultExpression(#8, .F., #18, #31);
#42=LwsStringLiteral(#46, .F., '' is ordering at the restaurant'');
#43=LwsProcedureCall(#15, (), #34);
#44=LwsDecimalLiteral(#16, .F., ''0.5'');
#45=LwsMultExpression(#36, .F., #21, #39);
#46=LwsAggregate(#7, .F., (#42));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSeparateBody1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''Variable'', ());
#2=LwsProcedureDeclaration(#13, (), .F., #12);
#3=LwsBlockBody(#13, (#9), ());
#4=LwsNamedSelector(#5, ''Text_IO'');
#5=LwsQualifiedIdentifier(#9, .F., ''Ada'', (#4, #11, #14));
#6=LwsSeparateBody(#10, #8, #13);
#7=LwsAggregate(#14, .F., (#1));
#8=LwsCompoundName(#6, (''Parent''));
#9=LwsProcedureCall(#3, (), #5);
#10=LwsParsingResult($, (#6), $);
#11=LwsNamedSelector(#5, ''Put_Line'');
#12=LwsCompoundName(#2, (''Inner''));
#13=LwsSubprogramBody(#6, (), #2, #3);
#14=LwsArgumentsSelector(#5, #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSimpleName1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsQualifiedIdentifier(#1, .F., ''SN'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testStrangeLoopSyntaxKoButShouldBeOk [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNullStatement(#10, ());
#2=LwsBlockBody(#13, (#12), (#10));
#3=LwsParsingResult($, (#7), $);
#4=LwsSubprogramBody(#7, (), #11, #6);
#5=LwsQualifiedIdentifier(#14, .F., ''err'', ());
#6=LwsBlockBody(#4, (#8), ());
#7=LwsUnit(#3, .F., (), #4);
#8=LwsLoopStatement(#6, (), $, $, (#13));
#9=LwsCompoundName(#11, (''strange''));
#10=LwsExceptionHandler(#2, $, (#14), (#1));
#11=LwsProcedureDeclaration(#4, (), .F., #9);
#12=LwsNullStatement(#2, ());
#13=LwsBlockStatement(#8, (), $, (), #2);
#14=LwsNamedExceptionChoice(#10, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testStrangeLoopSyntaxOkAndItsNormal [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBlockBody(#3, (#6), ());
#2=LwsProcedureDeclaration(#3, (), .F., #4);
#3=LwsSubprogramBody(#7, (), #2, #1);
#4=LwsCompoundName(#2, (''strange''));
#5=LwsNullStatement(#6, ());
#6=LwsLoopStatement(#1, (), $, $, (#5));
#7=LwsUnit(#8, .F., (), #3);
#8=LwsParsingResult($, (#7), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testString1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#2, .F., ''A string'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testString2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#2, .F., ''My surname is ""Alain""'');
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBlockBody(#10, (#13, #17, #18), ());
#2=LwsQualifiedIdentifier(#18, .F., ''New_Line'', (#5));
#3=LwsDecimalLiteral(#13, .F., ''1'');
#4=LwsArgumentsSelector(#15, #7);
#5=LwsArgumentsSelector(#2, #9);
#6=LwsDecimalLiteral(#9, .F., ''2'');
#7=LwsAggregate(#4, .F., (#11));
#8=LwsProcedureDeclaration(#10, (), .F., #12);
#9=LwsAggregate(#5, .F., (#6));
#10=LwsSubprogramBody(#16, (), #8, #1);
#11=LwsStringLiteral(#7, .F., ''This is the heading for this little program.'');
#12=LwsCompoundName(#8, (''Write_A_Header''));
#13=LwsAssignment(#1, (), #14, #3);
#14=LwsQualifiedIdentifier(#13, .F., ''Counter'', ());
#15=LwsQualifiedIdentifier(#17, .F., ''Put'', (#4));
#16=LwsParsingResult($, (#10), $);
#17=LwsProcedureCall(#1, (), #15);
#18=LwsProcedureCall(#1, (), #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#35, .F., ''Put'', (#31));
#2=LwsExceptionHandler(#25, $, (#133), (#97, #15, #8));
#3=LwsQualifiedIdentifier(#84, .F., ''Divide_Result'', ());
#4=LwsQualifiedIdentifier(#111, .F., ''Put'', (#44));
#5=LwsQualifiedIdentifier(#77, .F., ''Put_Line'', (#115));
#6=LwsSubprogramBody(#93, (#130, #29), #85, #74);
#7=LwsProcedureCall(#87, (), #22);
#8=LwsProcedureCall(#2, (), #42);
#9=LwsQualifiedIdentifier(#83, .F., ''Divide_Result'', ());
#10=LwsIfStatement(#74, (), (#76), $);
#11=LwsArgumentsSelector(#19, #62);
#12=LwsQualifiedIdentifier(#142, .F., ''Count'', ());
#13=LwsObjectDeclaration(#123, (''Divide_Result''), .F., .F., #106, $);
#14=LwsQualifiedIdentifier(#101, .F., ''Count'', ());
#15=LwsProcedureCall(#2, (), #121);
#16=LwsAggregate(#105, .F., (#17));
#17=LwsStringLiteral(#16, .F., ''Program terminated.'');
#18=LwsStringLiteral(#62, .F., '' My own error occurred'');
#19=LwsQualifiedIdentifier(#78, .F., ''Put_Line'', (#11));
#20=LwsAggregate(#115, .F., (#128));
#21=LwsAggregate(#118, .F., (#129));
#22=LwsQualifiedIdentifier(#7, .F., ''Raise_An_Error'', (#81));
#23=LwsProcedureDeclaration(#93, (), .F., #107);
#24=LwsQualifiedIdentifier(#91, .F., ''Put'', (#47));
#25=LwsBlockBody(#93, (#63, #87, #132), (#2));
#26=LwsProcedureCall(#43, (), #55);
#27=LwsAggregate(#127, .F., (#99));
#28=LwsDecimalLiteral(#66, .F., ''7'');
#29=LwsObjectDeclaration(#6, (''Another_Result''), .F., .F., #50, $);
#30=LwsAggregate(#126, .F., (#134));
#31=LwsArgumentsSelector(#1, #84);
#32=LwsQualifiedIdentifier(#106, .F., ''INTEGER'', ());
#33=LwsQualifiedIdentifier(#113, .F., ''Count'', ());
#34=LwsQualifiedIdentifier(#116, .F., ''Constraint_Error'', ());
#35=LwsProcedureCall(#43, (), #1);
#36=LwsMembershipIteration(#87, ''Count'', .F., #66);
#37=LwsArgumentsSelector(#55, #88);
#38=LwsQualifiedIdentifier(#119, .F., ''My_Own_Error'', ());
#39=LwsDecimalLiteral(#143, .F., ''35'');
#40=LwsExceptionHandler(#43, $, (#116), (#70));
#41=LwsArgumentsSelector(#121, #102);
#42=LwsQualifiedIdentifier(#8, .F., ''Put_Line'', (#105));
#43=LwsBlockBody(#123, (#108, #111, #26, #83, #35, #144), (#40));
#44=LwsArgumentsSelector(#4, #98);
#45=LwsStringLiteral(#88, .F., '' and the answer is'');
#46=LwsAggregate(#138, .F., (#120));
#47=LwsArgumentsSelector(#24, #101);
#48=LwsParsingResult($, (#93), $);
#49=LwsQualifiedIdentifier(#70, .F., ''Put_Line'', (#126));
#50=LwsSubtypeIndication(#29, #122, $);
#51=LwsAggregate(#140, .F., (#60));
#52=LwsQualifiedIdentifier(#133, .F., ''Constraint_Error'', ());
#53=LwsQualifiedIdentifier(#104, .F., ''Divide_By_Zero'', (#140));
#54=LwsArgumentsSelector(#64, #109);
#55=LwsQualifiedIdentifier(#26, .F., ''Put'', (#37));
#56=LwsDecimalLiteral(#84, .F., ''4'');
#57=LwsQualifiedIdentifier(#89, .F., ''INTEGER'', ());
#58=LwsStringLiteral(#109, .F., ''End of program.'');
#59=LwsQualifiedIdentifier(#63, .F., ''Put_Line'', (#118));
#60=LwsQualifiedIdentifier(#51, .F., ''Count'', ());
#61=LwsArgumentsSelector(#95, #125);
#62=LwsAggregate(#11, .F., (#18));
#63=LwsProcedureCall(#25, (), #59);
#64=LwsQualifiedIdentifier(#132, .F., ''Put_Line'', (#54));
#65=LwsDecimalLiteral(#98, .F., ''3'');
#66=LwsExplicitRange(#36, .F., #79, #28);
#67=LwsDecimalLiteral(#101, .F., ''3'');
#68=LwsQualifiedIdentifier(#86, .F., ''Another_Result'', ());
#69=LwsQualifiedIdentifier(#73, .F., ''INTEGER'', ());
#70=LwsProcedureCall(#40, (), #49);
#71=LwsQualifiedIdentifier(#117, .F., ''Count'', ());
#72=LwsExceptionHandler(#74, $, (#119), (#78));
#73=LwsFormalParameter(#94, (''Count''), $, #69, $);
#74=LwsBlockBody(#6, (#137, #91, #86, #10, #77), (#72));
#75=LwsDecimalLiteral(#82, .F., ''3'');
#76=LwsIfClause(#10, #82, (#135));
#77=LwsProcedureCall(#74, (), #5);
#78=LwsProcedureCall(#72, (), #19);
#79=LwsDecimalLiteral(#66, .F., ''1'');
#80=LwsStringLiteral(#125, .F., ''Count is'');
#81=LwsArgumentsSelector(#22, #142);
#82=LwsEqualExpression(#76, .F., #114, #75);
#83=LwsAssignment(#43, (), #9, #141);
#84=LwsAggregate(#31, .F., (#3, #56));
#85=LwsProcedureDeclaration(#6, (#89), .F., #110);
#86=LwsAssignment(#74, (), #68, #143);
#87=LwsLoopStatement(#25, (), $, #36, (#104, #7));
#88=LwsAggregate(#37, .F., (#45));
#89=LwsFormalParameter(#85, (''Count''), $, #57, $);
#90=LwsDecimalLiteral(#113, .F., ''4'');
#91=LwsProcedureCall(#74, (), #24);
#92=LwsCompoundName(#94, (''Divide_By_Zero''));
#93=LwsSubprogramBody(#48, (#123, #6), #23, #25);
#94=LwsProcedureDeclaration(#123, (#73), .F., #92);
#95=LwsQualifiedIdentifier(#108, .F., ''Put'', (#61));
#96=LwsDecimalLiteral(#117, .F., ''6'');
#97=LwsProcedureCall(#2, (), #100);
#98=LwsAggregate(#44, .F., (#136, #65));
#99=LwsStringLiteral(#27, .F., ''Count is'');
#100=LwsQualifiedIdentifier(#97, .F., ''Put'', (#138));
#101=LwsAggregate(#47, .F., (#14, #67));
#102=LwsAggregate(#41, .F., (#103));
#103=LwsStringLiteral(#102, .F., '' the main program level.'');
#104=LwsProcedureCall(#87, (), #53);
#105=LwsArgumentsSelector(#42, #16);
#106=LwsSubtypeIndication(#13, #32, $);
#107=LwsCompoundName(#23, (''Except3''));
#108=LwsProcedureCall(#43, (), #95);
#109=LwsAggregate(#54, .F., (#58));
#110=LwsCompoundName(#85, (''Raise_An_Error''));
#111=LwsProcedureCall(#43, (), #4);
#112=LwsQualifiedIdentifier(#137, .F., ''Put'', (#127));
#113=LwsMinusExpression(#141, .T., #33, #90);
#114=LwsQualifiedIdentifier(#82, .F., ''Count'', ());
#115=LwsArgumentsSelector(#5, #20);
#116=LwsNamedExceptionChoice(#40, #34);
#117=LwsMinusExpression(#143, .T., #71, #96);
#118=LwsArgumentsSelector(#59, #21);
#119=LwsNamedExceptionChoice(#72, #38);
#120=LwsStringLiteral(#46, .F., '' Constraint error detected at'');
#121=LwsQualifiedIdentifier(#15, .F., ''Put_Line'', (#41));
#122=LwsQualifiedIdentifier(#50, .F., ''INTEGER'', ());
#123=LwsSubprogramBody(#93, (#13), #94, #43);
#124=LwsDecimalLiteral(#141, .F., ''25'');
#125=LwsAggregate(#61, .F., (#80));
#126=LwsArgumentsSelector(#49, #30);
#127=LwsArgumentsSelector(#112, #27);
#128=LwsStringLiteral(#20, .F., '' and is a legal value'');
#129=LwsStringLiteral(#21, .F., ''Begin program here.'');
#130=LwsExceptionDeclaration(#6, (''My_Own_Error''));
#131=LwsQualifiedIdentifier(#144, .F., ''New_Line'', ());
#132=LwsProcedureCall(#25, (), #64);
#133=LwsNamedExceptionChoice(#2, #52);
#134=LwsStringLiteral(#30, .F., '' Divide by zero occurred'');
#135=LwsRaiseStatement(#76, (), #139);
#136=LwsQualifiedIdentifier(#98, .F., ''Count'', ());
#137=LwsProcedureCall(#74, (), #112);
#138=LwsArgumentsSelector(#100, #46);
#139=LwsQualifiedIdentifier(#135, .F., ''My_Own_Error'', ());
#140=LwsArgumentsSelector(#53, #51);
#141=LwsDivExpression(#83, .F., #124, #113);
#142=LwsAggregate(#81, .F., (#12));
#143=LwsDivExpression(#86, .F., #39, #117);
#144=LwsProcedureCall(#43, (), #131);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureCall(#174, (), #149);
#2=LwsDecimalLiteral(#104, .F., ''3'');
#3=LwsQualifiedIdentifier(#104, .F., ''Cows'', ());
#4=LwsFormalParameter(#158, (''Cows''), .inputMode., #131, #101);
#5=LwsQualifiedIdentifier(#164, .F., ''Animal_Sum'', ());
#6=LwsDecimalLiteral(#64, .F., ''7'');
#7=LwsQualifiedIdentifier(#170, .F., ''Animal_Sum'', ());
#8=LwsQualifiedIdentifier(#22, .F., ''Pig_Constant'', ());
#9=LwsAggregate(#11, .F., (#92, #89));
#10=LwsComponentAssociation(#138, #139, (#78));
#11=LwsArgumentsSelector(#155, #9);
#12=LwsProcedureCall(#128, (), #27);
#13=LwsQualifiedIdentifier(#130, .F., ''INTEGER'', ());
#14=LwsStringLiteral(#129, .F., ''   Pigs ='');
#15=LwsDecimalLiteral(#101, .F., ''2'');
#16=LwsQualifiedIdentifier(#86, .F., ''Animals'', (#136));
#17=LwsSubtypeIndication(#151, #192, $);
#18=LwsFunctionDeclaration(#102, (), .F., #87, #43);
#19=LwsComponentAssociation(#122, #168, (#193));
#20=LwsProcedureCall(#128, (), #147);
#21=LwsComponentAssociation(#138, #35, (#118));
#22=LwsPlusExpression(#84, .F., #186, #8);
#23=LwsAggregate(#30, .F., (#111, #106));
#24=LwsQualifiedIdentifier(#109, .F., ''Put'', (#188));
#25=LwsFormalParameter(#158, (''Total''), .inputOutputMode., #82, $);
#26=LwsAggregate(#31, .F., (#185, #183, #159, #107));
#27=LwsQualifiedIdentifier(#12, .F., ''Put'', (#30));
#28=LwsProcedureCall(#128, (), #155);
#29=LwsDecimalLiteral(#139, .F., ''4'');
#30=LwsArgumentsSelector(#27, #23);
#31=LwsArgumentsSelector(#176, #26);
#32=LwsMultExpression(#51, .F., #156, #34);
#33=LwsQualifiedIdentifier(#118, .F., ''Total'', ());
#34=LwsQualifiedIdentifier(#32, .F., ''Animals'', ());
#35=LwsQualifiedIdentifier(#21, .F., ''Animal_Sum'', ());
#36=LwsQualifiedIdentifier(#53, .F., ''Animals'', (#85));
#37=LwsComponentAssociation(#114, #61, (#100));
#38=LwsFunctionDeclaration(#179, (), .F., #127, #62);
#39=LwsQualifiedIdentifier(#125, .F., ''Dogs'', ());
#40=LwsObjectDeclaration(#102, (''Animals''), .F., .F., #152, #108);
#41=LwsQualifiedIdentifier(#65, .F., ''Dogs'', ());
#42=LwsDecimalLiteral(#154, .F., ''3'');
#43=LwsQualifiedIdentifier(#18, .F., ''INTEGER'', ());
#44=LwsQualifiedIdentifier(#154, .F., ''Pigs'', ());
#45=LwsSubprogramBody(#143, (#151, #72, #179, #102, #81), #56, #174);
#46=LwsQualifiedIdentifier(#70, .F., ''Pigs'', ());
#47=LwsQualifiedIdentifier(#177, .F., ''Animals'', (#48));
#48=LwsArgumentsSelector(#47, #50);
#49=LwsReturnStatement(#173, (), #51);
#50=LwsAggregate(#48, .F., (#52));
#51=LwsPlusExpression(#49, .F., #32, #135);
#52=LwsQualifiedIdentifier(#50, .F., ''Animal_Sum'', ());
#53=LwsProcedureCall(#174, (), #36);
#54=LwsAggregate(#58, .F., (#132));
#55=LwsQualifiedIdentifier(#123, .F., ''New_Line'', ());
#56=LwsProcedureDeclaration(#45, (), .F., #90);
#57=LwsQualifiedIdentifier(#150, .F., ''Cows'', ());
#58=LwsArgumentsSelector(#80, #54);
#59=LwsStringLiteral(#180, .F., ''   Dogs ='');
#60=LwsPlusExpression(#96, .F., #163, #146);
#61=LwsQualifiedIdentifier(#37, .F., ''Index'', ());
#62=LwsQualifiedIdentifier(#38, .F., ''INTEGER'', ());
#63=LwsExpressionChoice(#116, #171);
#64=LwsReturnStatement(#161, (), #6);
#65=LwsPlusExpression(#145, .F., #70, #41);
#66=LwsQualifiedIdentifier(#137, .F., ''Put'', (#110));
#67=LwsQualifiedIdentifier(#145, .F., ''Total'', ());
#68=LwsProcedureCall(#128, (), #187);
#69=LwsDecimalLiteral(#116, .F., ''4'');
#70=LwsPlusExpression(#65, .F., #184, #46);
#71=LwsExpressionChoice(#164, #175);
#72=LwsObjectDeclaration(#45, (''Animal_Sum''), .F., .F., #126, $);
#73=LwsDecimalLiteral(#130, .F., ''0'');
#74=LwsProcedureCall(#174, (), #176);
#75=LwsExpressionChoice(#170, #181);
#76=LwsQualifiedIdentifier(#162, .F., ''Pigs'', ());
#77=LwsQualifiedIdentifier(#193, .F., ''Cows'', ());
#78=LwsExpressionChoice(#10, #148);
#79=LwsAggregate(#85, .F., (#116, #164));
#80=LwsQualifiedIdentifier(#190, .F., ''Put'', (#58));
#81=LwsSubprogramBody(#45, (), #158, #128);
#82=LwsQualifiedIdentifier(#25, .F., ''INTEGER'', ());
#83=LwsQualifiedIdentifier(#91, .F., ''Index'', ());
#84=LwsFormalParameter(#158, (''Pigs''), .inputMode., #178, #22);
#85=LwsArgumentsSelector(#36, #79);
#86=LwsProcedureCall(#174, (), #16);
#87=LwsCompoundName(#18, (''Pig_Constant''));
#88=LwsAggregate(#93, .F., (#165));
#89=LwsDecimalLiteral(#9, .F., ''3'');
#90=LwsCompoundName(#56, (''Default2''));
#91=LwsAggregate(#94, .F., (#117, #144, #83, #172));
#92=LwsQualifiedIdentifier(#9, .F., ''Dogs'', ());
#93=LwsArgumentsSelector(#147, #88);
#94=LwsArgumentsSelector(#113, #91);
#95=LwsQualifiedIdentifier(#169, .F., ''Animals'', (#134));
#96=LwsComponentAssociation(#122, #60, (#162));
#97=LwsCompoundName(#158, (''Animals''));
#98=LwsQualifiedIdentifier(#126, .F., ''INTEGER'', ());
#99=LwsDecimalLiteral(#163, .F., ''2'');
#100=LwsExpressionChoice(#37, #194);
#101=LwsMultExpression(#4, .F., #15, #103);
#102=LwsSubprogramBody(#45, (#40), #18, #173);
#103=LwsQualifiedIdentifier(#101, .F., ''Cow_Constant'', ());
#104=LwsAggregate(#110, .F., (#3, #2));
#105=LwsQualifiedIdentifier(#189, .F., ''Put'', (#160));
#106=LwsDecimalLiteral(#23, .F., ''4'');
#107=LwsDecimalLiteral(#26, .F., ''4'');
#108=LwsMinusExpression(#40, .F., #112, #121);
#109=LwsProcedureCall(#128, (), #24);
#110=LwsArgumentsSelector(#66, #104);
#111=LwsQualifiedIdentifier(#23, .F., ''Total'', ());
#112=LwsQualifiedIdentifier(#108, .F., ''Cow_Constant'', ());
#113=LwsQualifiedIdentifier(#166, .F., ''Animals'', (#94));
#114=LwsAggregate(#115, .F., (#157, #191, #37, #182));
#115=LwsArgumentsSelector(#149, #114);
#116=LwsComponentAssociation(#79, #69, (#63));
#117=LwsQualifiedIdentifier(#91, .F., ''Animal_Sum'', ());
#118=LwsExpressionChoice(#21, #33);
#119=LwsDecimalLiteral(#182, .F., ''2'');
#120=LwsQualifiedIdentifier(#152, .F., ''INTEGER'', ());
#121=LwsDecimalLiteral(#108, .F., ''3'');
#122=LwsAggregate(#134, .F., (#170, #96, #19));
#123=LwsProcedureCall(#128, (), #55);
#124=LwsDecimalLiteral(#141, .F., ''3'');
#125=LwsExpressionChoice(#191, #39);
#126=LwsSubtypeIndication(#72, #98, $);
#127=LwsCompoundName(#38, (''Cow_Constant''));
#128=LwsBlockBody(#81, (#145, #20, #137, #68, #189, #109, #28, #190, #12, #123), ());
#129=LwsAggregate(#133, .F., (#14));
#130=LwsFormalParameter(#158, (''Dogs''), .inputMode., #13, #73);
#131=LwsQualifiedIdentifier(#4, .F., ''INTEGER'', ());
#132=LwsStringLiteral(#54, .F., ''   and they total'');
#133=LwsArgumentsSelector(#187, #129);
#134=LwsArgumentsSelector(#95, #122);
#135=LwsDecimalLiteral(#51, .F., ''5'');
#136=LwsArgumentsSelector(#16, #138);
#137=LwsProcedureCall(#128, (), #66);
#138=LwsAggregate(#136, .F., (#10, #21));
#139=LwsPlusExpression(#10, .F., #153, #29);
#140=LwsDecimalLiteral(#191, .F., ''4'');
#141=LwsAssignment(#174, (), #142, #124);
#142=LwsQualifiedIdentifier(#141, .F., ''Index'', ());
#143=LwsParsingResult($, (#45), $);
#144=LwsDecimalLiteral(#91, .F., ''2'');
#145=LwsAssignment(#128, (), #67, #65);
#146=LwsDecimalLiteral(#60, .F., ''1'');
#147=LwsQualifiedIdentifier(#20, .F., ''Put'', (#93));
#148=LwsQualifiedIdentifier(#78, .F., ''Dogs'', ());
#149=LwsQualifiedIdentifier(#1, .F., ''Animals'', (#115));
#150=LwsExpressionChoice(#182, #57);
#151=LwsObjectDeclaration(#45, (''Index''), .F., .F., #17, $);
#152=LwsSubtypeIndication(#40, #120, $);
#153=LwsQualifiedIdentifier(#139, .F., ''Index'', ());
#154=LwsAggregate(#160, .F., (#44, #42));
#155=LwsQualifiedIdentifier(#28, .F., ''Put'', (#11));
#156=LwsDecimalLiteral(#32, .F., ''2'');
#157=LwsQualifiedIdentifier(#114, .F., ''Animal_Sum'', ());
#158=LwsProcedureDeclaration(#81, (#25, #4, #84, #130), .F., #97);
#159=LwsDecimalLiteral(#26, .F., ''3'');
#160=LwsArgumentsSelector(#105, #154);
#161=LwsBlockBody(#179, (#64), ());
#162=LwsExpressionChoice(#96, #76);
#163=LwsMultExpression(#60, .F., #99, #167);
#164=LwsComponentAssociation(#79, #5, (#71));
#165=LwsStringLiteral(#88, .F., ''Cows ='');
#166=LwsProcedureCall(#174, (), #113);
#167=LwsQualifiedIdentifier(#163, .F., ''Index'', ());
#168=LwsDecimalLiteral(#19, .F., ''5'');
#169=LwsProcedureCall(#174, (), #95);
#170=LwsComponentAssociation(#122, #7, (#75));
#171=LwsQualifiedIdentifier(#63, .F., ''Dogs'', ());
#172=LwsDecimalLiteral(#91, .F., ''4'');
#173=LwsBlockBody(#102, (#49), ());
#174=LwsBlockBody(#45, (#141, #74, #166, #53, #169, #86, #1, #177), ());
#175=LwsQualifiedIdentifier(#71, .F., ''Total'', ());
#176=LwsQualifiedIdentifier(#74, .F., ''Animals'', (#31));
#177=LwsProcedureCall(#174, (), #47);
#178=LwsQualifiedIdentifier(#84, .F., ''INTEGER'', ());
#179=LwsSubprogramBody(#45, (), #38, #161);
#180=LwsAggregate(#188, .F., (#59));
#181=LwsQualifiedIdentifier(#75, .F., ''Total'', ());
#182=LwsComponentAssociation(#114, #119, (#150));
#183=LwsDecimalLiteral(#26, .F., ''2'');
#184=LwsQualifiedIdentifier(#70, .F., ''Cows'', ());
#185=LwsQualifiedIdentifier(#26, .F., ''Animal_Sum'', ());
#186=LwsQualifiedIdentifier(#22, .F., ''Cow_Constant'', ());
#187=LwsQualifiedIdentifier(#68, .F., ''Put'', (#133));
#188=LwsArgumentsSelector(#24, #180);
#189=LwsProcedureCall(#128, (), #105);
#190=LwsProcedureCall(#128, (), #80);
#191=LwsComponentAssociation(#114, #140, (#125));
#192=LwsQualifiedIdentifier(#17, .F., ''INTEGER'', ());
#193=LwsExpressionChoice(#19, #77);
#194=LwsQualifiedIdentifier(#100, .F., ''Pigs'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#52, .F., ''This is the end of this little program.'');
#2=LwsSubprogramBody(#30, (), #71, #61);
#3=LwsArgumentsSelector(#25, #38);
#4=LwsQualifiedIdentifier(#29, .F., ''INTEGER'', ());
#5=LwsStringLiteral(#38, .F., ''This is the heading for this little program.'');
#6=LwsProcedureCall(#61, (), #16);
#7=LwsArgumentsSelector(#51, #42);
#8=LwsQualifiedIdentifier(#62, .F., ''Write_A_Header'', ());
#9=LwsExplicitRange(#45, .F., #66, #54);
#10=LwsAggregate(#59, .F., (#15));
#11=LwsQualifiedIdentifier(#28, .F., ''Counter'', ());
#12=LwsCompoundName(#20, (''Proced2''));
#13=LwsSubprogramBody(#30, (), #21, #26);
#14=LwsCompoundName(#21, (''Write_A_Header''));
#15=LwsDecimalLiteral(#10, .F., ''2'');
#16=LwsQualifiedIdentifier(#6, .F., ''Put_Line'', (#17));
#17=LwsArgumentsSelector(#16, #52);
#18=LwsAggregate(#56, .F., (#32));
#19=LwsDecimalLiteral(#28, .F., ''1'');
#20=LwsProcedureDeclaration(#30, (), .F., #12);
#21=LwsProcedureDeclaration(#13, (), .F., #14);
#22=LwsSubprogramBody(#30, (), #58, #40);
#23=LwsAssignment(#26, (), #53, #37);
#24=LwsStringLiteral(#64, .F., '' of this program.'');
#25=LwsQualifiedIdentifier(#55, .F., ''Put'', (#3));
#26=LwsBlockBody(#13, (#23, #55, #65), ());
#27=LwsAssignment(#40, (), #57, #28);
#28=LwsPlusExpression(#27, .F., #11, #19);
#29=LwsSubtypeIndication(#36, #4, $);
#30=LwsSubprogramBody(#47, (#36, #13, #22, #2), #20, #35);
#31=LwsQualifiedIdentifier(#65, .F., ''New_Line'', (#59));
#32=LwsStringLiteral(#18, .F., ''This is line number'');
#33=LwsQualifiedIdentifier(#42, .F., ''Counter'', ());
#34=LwsLoopStatement(#35, (), $, #45, (#49));
#35=LwsBlockBody(#30, (#62, #34, #72), ());
#36=LwsObjectDeclaration(#30, (''Counter''), .F., .F., #29, $);
#37=LwsDecimalLiteral(#23, .F., ''1'');
#38=LwsAggregate(#3, .F., (#5));
#39=LwsQualifiedIdentifier(#70, .F., ''Put'', (#56));
#40=LwsBlockBody(#22, (#70, #41, #68, #27), ());
#41=LwsProcedureCall(#40, (), #51);
#42=LwsAggregate(#7, .F., (#33, #43));
#43=LwsDecimalLiteral(#42, .F., ''2'');
#44=LwsArgumentsSelector(#46, #64);
#45=LwsMembershipIteration(#34, ''Index'', .F., #9);
#46=LwsQualifiedIdentifier(#68, .F., ''Put_Line'', (#44));
#47=LwsParsingResult($, (#30), $);
#48=LwsProcedureCall(#61, (), #60);
#49=LwsProcedureCall(#34, (), #69);
#50=LwsQualifiedIdentifier(#72, .F., ''Write_An_Ending_Statement'', ());
#51=LwsQualifiedIdentifier(#41, .F., ''Put'', (#7));
#52=LwsAggregate(#17, .F., (#1));
#53=LwsQualifiedIdentifier(#23, .F., ''Counter'', ());
#54=LwsDecimalLiteral(#9, .F., ''7'');
#55=LwsProcedureCall(#26, (), #25);
#56=LwsArgumentsSelector(#39, #18);
#57=LwsQualifiedIdentifier(#27, .F., ''Counter'', ());
#58=LwsProcedureDeclaration(#22, (), .F., #67);
#59=LwsArgumentsSelector(#31, #10);
#60=LwsQualifiedIdentifier(#48, .F., ''New_Line'', ());
#61=LwsBlockBody(#2, (#48, #6), ());
#62=LwsProcedureCall(#35, (), #8);
#63=LwsCompoundName(#71, (''Write_An_Ending_Statement''));
#64=LwsAggregate(#44, .F., (#24));
#65=LwsProcedureCall(#26, (), #31);
#66=LwsDecimalLiteral(#9, .F., ''1'');
#67=LwsCompoundName(#58, (''Write_And_Increment''));
#68=LwsProcedureCall(#40, (), #46);
#69=LwsQualifiedIdentifier(#49, .F., ''Write_And_Increment'', ());
#70=LwsProcedureCall(#40, (), #39);
#71=LwsProcedureDeclaration(#2, (), .F., #63);
#72=LwsProcedureCall(#35, (), #50);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectDeclaration(#57, (''Dogs'', ''Cats'', ''Animals''), .F., .F., #37, $);
#2=LwsQualifiedIdentifier(#50, .F., ''Dogs'', ());
#3=LwsArgumentsSelector(#48, #33);
#4=LwsFormalParameter(#20, (''Total''), .outputMode., #8, $);
#5=LwsQualifiedIdentifier(#53, .F., ''Total_Number_Of_Animals'', (#14));
#6=LwsAggregate(#22, .F., (#11));
#7=LwsQualifiedIdentifier(#38, .F., ''INTEGER'', ());
#8=LwsQualifiedIdentifier(#4, .F., ''INTEGER'', ());
#9=LwsQualifiedIdentifier(#43, .F., ''Variety1'', ());
#10=LwsAssignment(#16, (), #26, #12);
#11=LwsStringLiteral(#6, .F., ''The total number of animals is'');
#12=LwsDecimalLiteral(#10, .F., ''4'');
#13=LwsFormalParameter(#20, (''Variety2''), .inputMode., #31, $);
#14=LwsArgumentsSelector(#5, #50);
#15=LwsQualifiedIdentifier(#49, .F., ''INTEGER'', ());
#16=LwsBlockBody(#57, (#46, #10, #53, #23, #28, #47), ());
#17=LwsParsingResult($, (#57), $);
#18=LwsFormalParameter(#25, (''Variety1''), .inputMode., #24, $);
#19=LwsDecimalLiteral(#46, .F., ''3'');
#20=LwsProcedureDeclaration(#36, (#27, #13, #4), .F., #32);
#21=LwsBlockBody(#36, (#45), ());
#22=LwsArgumentsSelector(#42, #6);
#23=LwsProcedureCall(#16, (), #42);
#24=LwsQualifiedIdentifier(#18, .F., ''INTEGER'', ());
#25=LwsProcedureDeclaration(#57, (#18, #49, #38), .F., #54);
#26=LwsQualifiedIdentifier(#10, .F., ''Cats'', ());
#27=LwsFormalParameter(#20, (''Variety1''), .inputMode., #52, $);
#28=LwsProcedureCall(#16, (), #48);
#29=LwsQualifiedIdentifier(#47, .F., ''New_Line'', ());
#30=LwsQualifiedIdentifier(#43, .F., ''Variety2'', ());
#31=LwsQualifiedIdentifier(#13, .F., ''INTEGER'', ());
#32=LwsCompoundName(#20, (''Total_Number_Of_Animals''));
#33=LwsAggregate(#3, .F., (#51, #44));
#34=LwsQualifiedIdentifier(#46, .F., ''Dogs'', ());
#35=LwsQualifiedIdentifier(#37, .F., ''INTEGER'', ());
#36=LwsSubprogramBody(#57, (), #20, #21);
#37=LwsSubtypeIndication(#1, #35, $);
#38=LwsFormalParameter(#25, (''Total''), .outputMode., #7, $);
#39=LwsQualifiedIdentifier(#45, .F., ''Total'', ());
#40=LwsQualifiedIdentifier(#50, .F., ''Cats'', ());
#41=LwsProcedureDeclaration(#57, (), .F., #56);
#42=LwsQualifiedIdentifier(#23, .F., ''Put'', (#22));
#43=LwsPlusExpression(#45, .F., #9, #30);
#44=LwsDecimalLiteral(#33, .F., ''3'');
#45=LwsAssignment(#21, (), #39, #43);
#46=LwsAssignment(#16, (), #34, #19);
#47=LwsProcedureCall(#16, (), #29);
#48=LwsQualifiedIdentifier(#28, .F., ''Put'', (#3));
#49=LwsFormalParameter(#25, (''Variety2''), .inputMode., #15, $);
#50=LwsAggregate(#14, .F., (#2, #40, #55));
#51=LwsQualifiedIdentifier(#33, .F., ''Animals'', ());
#52=LwsQualifiedIdentifier(#27, .F., ''INTEGER'', ());
#53=LwsProcedureCall(#16, (), #5);
#54=LwsCompoundName(#25, (''Total_Number_Of_Animals''));
#55=LwsQualifiedIdentifier(#50, .F., ''Animals'', ());
#56=LwsCompoundName(#41, (''Proced3''));
#57=LwsSubprogramBody(#17, (#1, #25, #36), #41, #16);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubprogramBody(#8, (#47), #20, #10);
#2=LwsQualifiedIdentifier(#42, .F., ''Put_Line'', (#5));
#3=LwsQualifiedIdentifier(#21, .F., ''Put_Line'', (#4));
#4=LwsArgumentsSelector(#3, #9);
#5=LwsArgumentsSelector(#2, #7);
#6=LwsArgumentsSelector(#41, #11);
#7=LwsAggregate(#5, .F., (#58));
#8=LwsParsingResult($, (#1), $);
#9=LwsAggregate(#4, .F., (#33));
#10=LwsBlockBody(#1, (#45, #37, #42), ());
#11=LwsAggregate(#6, .F., (#31));
#12=LwsProcedureCall(#40, (), #32);
#13=LwsCompoundName(#20, (''Nesting''));
#14=LwsCompoundName(#24, (''Bottom_Layer''));
#15=LwsCompoundName(#25, (''Second_Layer''));
#16=LwsArgumentsSelector(#32, #34);
#17=LwsSubprogramBody(#49, (), #24, #56);
#18=LwsArgumentsSelector(#51, #26);
#19=LwsQualifiedIdentifier(#54, .F., ''Bottom_Layer'', ());
#20=LwsProcedureDeclaration(#1, (), .F., #13);
#21=LwsProcedureCall(#56, (), #3);
#22=LwsBlockBody(#49, (#23, #54, #52), ());
#23=LwsProcedureCall(#22, (), #51);
#24=LwsProcedureDeclaration(#17, (), .F., #14);
#25=LwsProcedureDeclaration(#49, (), .F., #15);
#26=LwsAggregate(#18, .F., (#38));
#27=LwsQualifiedIdentifier(#52, .F., ''Put_Line'', (#28));
#28=LwsArgumentsSelector(#27, #29);
#29=LwsAggregate(#28, .F., (#30));
#30=LwsStringLiteral(#29, .F., ''We are back up to the Second Layer.'');
#31=LwsStringLiteral(#11, .F., ''This is procedure Triple talking to you.'');
#32=LwsQualifiedIdentifier(#12, .F., ''Put_Line'', (#16));
#33=LwsStringLiteral(#9, .F., ''This is the Bottom Layer talking.'');
#34=LwsAggregate(#16, .F., (#36));
#35=LwsArgumentsSelector(#55, #39);
#36=LwsStringLiteral(#34, .F., ''We are back up to the procedure named Triple.'');
#37=LwsProcedureCall(#10, (), #46);
#38=LwsStringLiteral(#26, .F., ''This is the Second Layer talking.'');
#39=LwsAggregate(#35, .F., (#48));
#40=LwsBlockBody(#47, (#44, #53, #12), ());
#41=LwsQualifiedIdentifier(#44, .F., ''Put_Line'', (#6));
#42=LwsProcedureCall(#10, (), #2);
#43=LwsQualifiedIdentifier(#53, .F., ''Second_Layer'', ());
#44=LwsProcedureCall(#40, (), #41);
#45=LwsProcedureCall(#10, (), #55);
#46=LwsQualifiedIdentifier(#37, .F., ''Triple'', ());
#47=LwsSubprogramBody(#1, (#49), #57, #40);
#48=LwsStringLiteral(#39, .F., ''Start the triple nesting here.'');
#49=LwsSubprogramBody(#47, (#17), #25, #22);
#50=LwsCompoundName(#57, (''Triple''));
#51=LwsQualifiedIdentifier(#23, .F., ''Put_Line'', (#18));
#52=LwsProcedureCall(#22, (), #27);
#53=LwsProcedureCall(#40, (), #43);
#54=LwsProcedureCall(#22, (), #19);
#55=LwsQualifiedIdentifier(#45, .F., ''Put_Line'', (#35));
#56=LwsBlockBody(#17, (#21), ());
#57=LwsProcedureDeclaration(#47, (), .F., #50);
#58=LwsStringLiteral(#7, .F., ''Finished, and back to the top level.'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#65, .F., (#55, #66));
#2=LwsDecimalLiteral(#28, .F., ''12'');
#3=LwsBlockBody(#30, (#71), ());
#4=LwsAggregate(#69, .F., (#13));
#5=LwsStringLiteral(#56, .F., ''The sum of 12 and 12 is'');
#6=LwsFormalParameter(#17, (''Val1'', ''Val2''), $, #36, $);
#7=LwsQualifiedIdentifier(#29, .F., ''INTEGER'', ());
#8=LwsProcedureCall(#33, (), #10);
#9=LwsQualifiedIdentifier(#27, .F., ''Twelve'', ());
#10=LwsQualifiedIdentifier(#8, .F., ''Put'', (#51));
#11=LwsQualifiedIdentifier(#62, .F., ''New_Line'', ());
#12=LwsQualifiedIdentifier(#21, .F., ''Val'', ());
#13=LwsStringLiteral(#4, .F., ''The square of 12 is'');
#14=LwsQualifiedIdentifier(#28, .F., ''Twelve'', ());
#15=LwsQualifiedIdentifier(#61, .F., ''Sum'', ());
#16=LwsDecimalLiteral(#26, .F., ''12'');
#17=LwsFunctionDeclaration(#30, (#6), .F., #49, #35);
#18=LwsArgumentsSelector(#67, #28);
#19=LwsPlusExpression(#71, .F., #39, #53);
#20=LwsProcedureCall(#33, (), #46);
#21=LwsMultExpression(#42, .F., #12, #59);
#22=LwsFormalParameter(#38, (''Val''), $, #58, $);
#23=LwsSubprogramBody(#48, (#26, #24, #31, #41, #30), #70, #33);
#24=LwsObjectDeclaration(#23, (''Sum''), .F., .F., #72, $);
#25=LwsQualifiedIdentifier(#43, .F., ''Put'', (#69));
#26=LwsObjectDeclaration(#23, (''Twelve''), .F., .F., #54, #16);
#27=LwsAggregate(#44, .F., (#9));
#28=LwsAggregate(#18, .F., (#14, #2));
#29=LwsFormalParameter(#31, (''Val''), $, #7, $);
#30=LwsSubprogramBody(#23, (), #17, #3);
#31=LwsFunctionDeclaration(#23, (#29), .F., #40, #52);
#32=LwsQualifiedIdentifier(#72, .F., ''INTEGER'', ());
#33=LwsBlockBody(#23, (#43, #64, #73, #61, #20, #8, #62), ());
#34=LwsQualifiedIdentifier(#64, .F., ''Put'', (#65));
#35=LwsQualifiedIdentifier(#17, .F., ''INTEGER'', ());
#36=LwsQualifiedIdentifier(#6, .F., ''INTEGER'', ());
#37=LwsCompoundName(#70, (''Funct''));
#38=LwsFunctionDeclaration(#41, (#22), .F., #75, #57);
#39=LwsQualifiedIdentifier(#19, .F., ''Val1'', ());
#40=LwsCompoundName(#31, (''Square''));
#41=LwsSubprogramBody(#23, (), #38, #47);
#42=LwsReturnStatement(#47, (), #21);
#43=LwsProcedureCall(#33, (), #25);
#44=LwsArgumentsSelector(#55, #27);
#45=LwsQualifiedIdentifier(#60, .F., ''Sum'', ());
#46=LwsQualifiedIdentifier(#20, .F., ''Put'', (#50));
#47=LwsBlockBody(#41, (#42), ());
#48=LwsParsingResult($, (#23), $);
#49=LwsCompoundName(#17, (''Sum_Of_Numbers''));
#50=LwsArgumentsSelector(#46, #56);
#51=LwsArgumentsSelector(#10, #60);
#52=LwsQualifiedIdentifier(#31, .F., ''INTEGER'', ());
#53=LwsQualifiedIdentifier(#19, .F., ''Val2'', ());
#54=LwsSubtypeIndication(#26, #68, $);
#55=LwsQualifiedIdentifier(#1, .F., ''Square'', (#44));
#56=LwsAggregate(#50, .F., (#5));
#57=LwsQualifiedIdentifier(#38, .F., ''INTEGER'', ());
#58=LwsQualifiedIdentifier(#22, .F., ''INTEGER'', ());
#59=LwsQualifiedIdentifier(#21, .F., ''Val'', ());
#60=LwsAggregate(#51, .F., (#45, #63));
#61=LwsAssignment(#33, (), #15, #67);
#62=LwsProcedureCall(#33, (), #11);
#63=LwsDecimalLiteral(#60, .F., ''4'');
#64=LwsProcedureCall(#33, (), #34);
#65=LwsArgumentsSelector(#34, #1);
#66=LwsDecimalLiteral(#1, .F., ''4'');
#67=LwsQualifiedIdentifier(#61, .F., ''Sum_Of_Numbers'', (#18));
#68=LwsQualifiedIdentifier(#54, .F., ''INTEGER'', ());
#69=LwsArgumentsSelector(#25, #4);
#70=LwsProcedureDeclaration(#23, (), .F., #37);
#71=LwsReturnStatement(#3, (), #19);
#72=LwsSubtypeIndication(#24, #32, $);
#73=LwsProcedureCall(#33, (), #74);
#74=LwsQualifiedIdentifier(#73, .F., ''New_line'', ());
#75=LwsCompoundName(#38, (''Square''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#6, (''Level2_Prime''));
#2=LwsObjectDeclaration(#16, (''Data''), .F., .F., #7, $);
#3=LwsCompoundName(#10, (''Scope''));
#4=LwsSubprogramBody(#11, (#8), #35, #26);
#5=LwsQualifiedIdentifier(#36, .F., ''INTEGER'', ());
#6=LwsProcedureDeclaration(#16, (), .F., #1);
#7=LwsSubtypeIndication(#2, #18, $);
#8=LwsObjectDeclaration(#4, (''Count''), .F., .F., #36, $);
#9=LwsNullStatement(#28, ());
#10=LwsProcedureDeclaration(#29, (), .F., #3);
#11=LwsSubprogramBody(#29, (#15, #4, #16), #24, #37);
#12=LwsSubtypeIndication(#13, #23, $);
#13=LwsObjectDeclaration(#29, (''Count''), .F., .F., #12, $);
#14=LwsSubtypeIndication(#15, #25, $);
#15=LwsObjectDeclaration(#11, (''Index''), .F., .F., #14, $);
#16=LwsSubprogramBody(#11, (#2), #6, #19);
#17=LwsCompoundName(#24, (''Level1''));
#18=LwsQualifiedIdentifier(#7, .F., ''INTEGER'', ());
#19=LwsBlockBody(#16, (#20), ());
#20=LwsNullStatement(#19, ());
#21=LwsNullStatement(#26, ());
#22=LwsBlockBody(#29, (#38), ());
#23=LwsQualifiedIdentifier(#12, .F., ''INTEGER'', ());
#24=LwsProcedureDeclaration(#11, (), .F., #17);
#25=LwsQualifiedIdentifier(#14, .F., ''INTEGER'', ());
#26=LwsBlockBody(#4, (#21), ());
#27=LwsCompoundName(#32, (''Other_Level1''));
#28=LwsBlockBody(#34, (#9), ());
#29=LwsSubprogramBody(#31, (#13, #11, #34), #10, #22);
#30=LwsNullStatement(#37, ());
#31=LwsParsingResult($, (#29), $);
#32=LwsProcedureDeclaration(#34, (), .F., #27);
#33=LwsCompoundName(#35, (''Level2''));
#34=LwsSubprogramBody(#29, (), #32, #28);
#35=LwsProcedureDeclaration(#4, (), .F., #33);
#36=LwsSubtypeIndication(#8, #5, $);
#37=LwsBlockBody(#11, (#30), ());
#38=LwsNullStatement(#22, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBlockBody(#72, (#11), ());
#2=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#3=LwsSubtypeIndication(#12, #2, $);
#4=LwsBlockBody(#42, (#13, #23, #47), ());
#5=LwsQualifiedIdentifier(#47, .F., ''Index'', ());
#6=LwsNullStatement(#69, ());
#7=LwsCompoundName(#66, (''Level2''));
#8=LwsQualifiedIdentifier(#11, .F., ''Index'', ());
#9=LwsCompoundName(#15, (''Scope2''));
#10=LwsSubprogramBody(#26, (#36), #66, #31);
#11=LwsAssignment(#1, (), #54, #8);
#12=LwsObjectDeclaration(#38, (''Outer_Index''), .F., .F., #3, $);
#13=LwsAssignment(#4, (), #46, #21);
#14=LwsQualifiedIdentifier(#63, .F., ''Scope2'', (#50));
#15=LwsProcedureDeclaration(#72, (), .F., #9);
#16=LwsCompoundName(#24, (''Other_Level1''));
#17=LwsQualifiedIdentifier(#32, .F., ''Count'', ());
#18=LwsCompoundName(#25, (''Level1''));
#19=LwsQualifiedIdentifier(#20, .F., ''INTEGER'', ());
#20=LwsSubtypeIndication(#61, #19, $);
#21=LwsPlusExpression(#13, .F., #34, #67);
#22=LwsQualifiedIdentifier(#44, .F., ''Scope2'', (#56));
#23=LwsAssignment(#4, (), #59, #63);
#24=LwsProcedureDeclaration(#40, (), .F., #16);
#25=LwsProcedureDeclaration(#26, (), .F., #18);
#26=LwsSubprogramBody(#72, (#64, #10, #42), #25, #69);
#27=LwsNamedSelector(#67, ''Count'');
#28=LwsQualifiedIdentifier(#51, .F., ''Outer_Index'', ());
#29=LwsNamedSelector(#68, ''Index'');
#30=LwsQualifiedIdentifier(#51, .F., ''Scope2'', (#35));
#31=LwsBlockBody(#10, (#44), ());
#32=LwsAssignment(#53, (), #17, #33);
#33=LwsQualifiedIdentifier(#32, .F., ''Index'', ());
#34=LwsQualifiedIdentifier(#21, .F., ''Index'', ());
#35=LwsNamedSelector(#30, ''Index'');
#36=LwsObjectDeclaration(#10, (''Count''), .F., .F., #43, $);
#37=LwsQualifiedIdentifier(#44, .F., ''Count'', ());
#38=LwsObjectRenamingDeclaration(#42, #68, #12, #12);
#39=LwsNamedSelector(#45, ''Index'');
#40=LwsSubprogramBody(#72, (), #24, #53);
#41=LwsQualifiedIdentifier(#43, .F., ''INTEGER'', ());
#42=LwsSubprogramBody(#26, (#61, #38), #65, #4);
#43=LwsSubtypeIndication(#36, #41, $);
#44=LwsAssignment(#31, (), #37, #22);
#45=LwsQualifiedIdentifier(#63, .F., ''Scope2'', (#49, #39));
#46=LwsQualifiedIdentifier(#13, .F., ''Count'', ());
#47=LwsAssignment(#4, (), #5, #51);
#48=LwsObjectDeclaration(#72, (''Count'', ''Index''), .F., .F., #62, $);
#49=LwsNamedSelector(#45, ''Level1'');
#50=LwsNamedSelector(#14, ''Index'');
#51=LwsPlusExpression(#47, .F., #28, #30);
#52=LwsParsingResult($, (#72), $);
#53=LwsBlockBody(#40, (#32), ());
#54=LwsQualifiedIdentifier(#11, .F., ''Count'', ());
#55=LwsQualifiedIdentifier(#57, .F., ''INTEGER'', ());
#56=LwsNamedSelector(#22, ''Count'');
#57=LwsSubtypeIndication(#64, #55, $);
#58=LwsCompoundName(#65, (''Level2_Prime''));
#59=LwsQualifiedIdentifier(#23, .F., ''Index'', ());
#60=LwsQualifiedIdentifier(#62, .F., ''INTEGER'', ());
#61=LwsObjectDeclaration(#42, (''Data'', ''Index'', ''Count''), .F., .F., #20, $);
#62=LwsSubtypeIndication(#48, #60, $);
#63=LwsPlusExpression(#23, .F., #45, #14);
#64=LwsObjectDeclaration(#26, (''Index'', ''Count''), .F., .F., #57, $);
#65=LwsProcedureDeclaration(#42, (), .F., #58);
#66=LwsProcedureDeclaration(#10, (), .F., #7);
#67=LwsQualifiedIdentifier(#21, .F., ''Scope2'', (#70, #27));
#68=LwsQualifiedIdentifier(#38, .F., ''Scope2'', (#71, #29));
#69=LwsBlockBody(#26, (#6), ());
#70=LwsNamedSelector(#67, ''Level1'');
#71=LwsNamedSelector(#68, ''Level1'');
#72=LwsSubprogramBody(#52, (#48, #26, #40), #15, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#75, #76);
#2=LwsQualifiedIdentifier(#116, .F., ''Index'', ());
#3=LwsStringLiteral(#12, .F., ''In the main block      - values are'');
#4=LwsQualifiedIdentifier(#126, .F., ''Stuff'', ());
#5=LwsStringLiteral(#31, .F., ''Back to the main block - values are'');
#6=LwsQualifiedIdentifier(#105, .F., ''Put'', (#81));
#7=LwsQualifiedIdentifier(#123, .F., ''New_Line'', ());
#8=LwsNegativeExpression(#33, .F., #65);
#9=LwsQualifiedIdentifier(#49, .F., ''Index'', ());
#10=LwsProcedureCall(#91, (), #117);
#11=LwsQualifiedIdentifier(#125, .F., ''Put'', (#60));
#12=LwsAggregate(#81, .F., (#3));
#13=LwsDecimalLiteral(#49, .F., ''157'');
#14=LwsQualifiedIdentifier(#124, .F., ''INTEGER'', ());
#15=LwsObjectDeclaration(#62, (''Index'', ''Stuff''), .F., .F., #67, #157);
#16=LwsArgumentsSelector(#103, #93);
#17=LwsProcedureCall(#147, (), #73);
#18=LwsProcedureCall(#22, (), #75);
#19=LwsArgumentsSelector(#53, #116);
#20=LwsArgumentsSelector(#30, #97);
#21=LwsArgumentsSelector(#135, #136);
#22=LwsBlockBody(#92, (#102, #165, #105, #128, #166, #123, #62, #107, #156, #18, #84, #39, #79, #55, #164, #146), ());
#23=LwsQualifiedIdentifier(#107, .F., ''Put'', (#141));
#24=LwsArgumentsSelector(#108, #109);
#25=LwsSubtypeIndication(#33, #68, $);
#26=LwsArgumentsSelector(#138, #139);
#27=LwsQualifiedIdentifier(#55, .F., ''Put'', (#83));
#28=LwsAggregate(#83, .F., (#142, #61));
#29=LwsArgumentsSelector(#42, #111);
#30=LwsQualifiedIdentifier(#128, .F., ''Put'', (#20));
#31=LwsAggregate(#140, .F., (#5));
#32=LwsStringLiteral(#52, .F., ''Back to the main block - values are'');
#33=LwsObjectDeclaration(#39, (''Index'', ''Stuff''), .F., .F., #25, #8);
#34=LwsQualifiedIdentifier(#97, .F., ''Index'', ());
#35=LwsAggregate(#106, .F., (#99));
#36=LwsDecimalLiteral(#44, .F., ''5'');
#37=LwsQualifiedIdentifier(#66, .F., ''Who'', (#58));
#38=LwsArgumentsSelector(#131, #126);
#39=LwsBlockStatement(#22, (), ''Who'', (#33), #91);
#40=LwsProcedureCall(#91, (), #138);
#41=LwsQualifiedIdentifier(#165, .F., ''Count'', ());
#42=LwsQualifiedIdentifier(#100, .F., ''Put'', (#29));
#43=LwsDecimalLiteral(#102, .F., ''27'');
#44=LwsAggregate(#145, .F., (#85, #36));
#45=LwsDecimalLiteral(#66, .F., ''5'');
#46=LwsQualifiedIdentifier(#164, .F., ''Put'', (#145));
#47=LwsQualifiedIdentifier(#137, .F., ''Put'', (#77));
#48=LwsDecimalLiteral(#157, .F., ''345'');
#49=LwsAssignment(#91, (), #9, #13);
#50=LwsQualifiedIdentifier(#134, .F., ''Put'', (#151));
#51=LwsNamedSelector(#86, ''Index'');
#52=LwsAggregate(#141, .F., (#32));
#53=LwsQualifiedIdentifier(#118, .F., ''Put'', (#19));
#54=LwsAggregate(#143, .F., (#89, #96));
#55=LwsProcedureCall(#22, (), #27);
#56=LwsQualifiedIdentifier(#166, .F., ''Put'', (#143));
#57=LwsNamedSelector(#88, ''Index'');
#58=LwsNamedSelector(#37, ''Stuff'');
#59=LwsDecimalLiteral(#76, .F., ''5'');
#60=LwsArgumentsSelector(#11, #159);
#61=LwsDecimalLiteral(#28, .F., ''5'');
#62=LwsBlockStatement(#22, (), $, (#15), #147);
#63=LwsAggregate(#151, .F., (#86, #114));
#64=LwsAggregate(#161, .F., (#88, #119));
#65=LwsDecimalLiteral(#8, .F., ''345'');
#66=LwsAggregate(#77, .F., (#37, #45));
#67=LwsSubtypeIndication(#15, #130, $);
#68=LwsQualifiedIdentifier(#25, .F., ''INTEGER'', ());
#69=LwsCompoundName(#115, (''Blocks''));
#70=LwsQualifiedIdentifier(#111, .F., ''Blocks'', (#101));
#71=LwsObjectDeclaration(#92, (''Index'', ''Count''), .F., .F., #124, $);
#72=LwsAggregate(#168, .F., (#121, #132));
#73=LwsQualifiedIdentifier(#17, .F., ''Put'', (#168));
#74=LwsDecimalLiteral(#93, .F., ''5'');
#75=LwsQualifiedIdentifier(#18, .F., ''Put'', (#1));
#76=LwsAggregate(#1, .F., (#122, #59));
#77=LwsArgumentsSelector(#47, #66);
#78=LwsDecimalLiteral(#139, .F., ''5'');
#79=LwsProcedureCall(#22, (), #163);
#80=LwsQualifiedIdentifier(#146, .F., ''New_Line'', ());
#81=LwsArgumentsSelector(#6, #12);
#82=LwsDecimalLiteral(#109, .F., ''5'');
#83=LwsArgumentsSelector(#27, #28);
#84=LwsProcedureCall(#22, (), #112);
#85=LwsQualifiedIdentifier(#44, .F., ''Count'', ());
#86=LwsQualifiedIdentifier(#63, .F., ''Blocks'', (#51));
#87=LwsDecimalLiteral(#111, .F., ''5'');
#88=LwsQualifiedIdentifier(#64, .F., ''Who'', (#57));
#89=LwsQualifiedIdentifier(#54, .F., ''Count'', ());
#90=LwsQualifiedIdentifier(#102, .F., ''Index'', ());
#91=LwsBlockBody(#39, (#49, #125, #134, #118, #10, #120, #137, #40, #148), ());
#92=LwsSubprogramBody(#129, (#71), #115, #22);
#93=LwsAggregate(#16, .F., (#149, #74));
#94=LwsAssignment(#147, (), #158, #169);
#95=LwsDecimalLiteral(#97, .F., ''5'');
#96=LwsDecimalLiteral(#54, .F., ''5'');
#97=LwsAggregate(#20, .F., (#34, #95));
#98=LwsProcedureCall(#147, (), #167);
#99=LwsStringLiteral(#35, .F., ''In the embedded block  - values are'');
#100=LwsProcedureCall(#147, (), #42);
#101=LwsNamedSelector(#70, ''Index'');
#102=LwsAssignment(#22, (), #90, #43);
#103=LwsQualifiedIdentifier(#127, .F., ''Put'', (#16));
#104=LwsDecimalLiteral(#126, .F., ''5'');
#105=LwsProcedureCall(#22, (), #6);
#106=LwsArgumentsSelector(#167, #35);
#107=LwsProcedureCall(#22, (), #23);
#108=LwsQualifiedIdentifier(#156, .F., ''Put'', (#24));
#109=LwsAggregate(#24, .F., (#153, #82));
#110=LwsQualifiedIdentifier(#113, .F., ''New_Line'', ());
#111=LwsAggregate(#29, .F., (#70, #87));
#112=LwsQualifiedIdentifier(#84, .F., ''New_Line'', ());
#113=LwsProcedureCall(#147, (), #110);
#114=LwsDecimalLiteral(#63, .F., ''5'');
#115=LwsProcedureDeclaration(#92, (), .F., #69);
#116=LwsAggregate(#19, .F., (#2, #160));
#117=LwsQualifiedIdentifier(#10, .F., ''Put'', (#161));
#118=LwsProcedureCall(#91, (), #53);
#119=LwsDecimalLiteral(#64, .F., ''5'');
#120=LwsProcedureCall(#91, (), #135);
#121=LwsQualifiedIdentifier(#72, .F., ''Count'', ());
#122=LwsQualifiedIdentifier(#76, .F., ''Count'', ());
#123=LwsProcedureCall(#22, (), #7);
#124=LwsSubtypeIndication(#71, #14, $);
#125=LwsProcedureCall(#91, (), #11);
#126=LwsAggregate(#38, .F., (#4, #104));
#127=LwsProcedureCall(#147, (), #103);
#128=LwsProcedureCall(#22, (), #30);
#129=LwsParsingResult($, (#92), $);
#130=LwsQualifiedIdentifier(#67, .F., ''INTEGER'', ());
#131=LwsQualifiedIdentifier(#155, .F., ''Put'', (#38));
#132=LwsDecimalLiteral(#72, .F., ''5'');
#133=LwsStringLiteral(#159, .F., ''In the block named Who - values are'');
#134=LwsProcedureCall(#91, (), #50);
#135=LwsQualifiedIdentifier(#120, .F., ''Put'', (#21));
#136=LwsAggregate(#21, .F., (#150, #162));
#137=LwsProcedureCall(#91, (), #47);
#138=LwsQualifiedIdentifier(#40, .F., ''Put'', (#26));
#139=LwsAggregate(#26, .F., (#152, #78));
#140=LwsArgumentsSelector(#163, #31);
#141=LwsArgumentsSelector(#23, #52);
#142=LwsQualifiedIdentifier(#28, .F., ''Index'', ());
#143=LwsArgumentsSelector(#56, #54);
#144=LwsQualifiedIdentifier(#148, .F., ''New_Line'', ());
#145=LwsArgumentsSelector(#46, #44);
#146=LwsProcedureCall(#22, (), #80);
#147=LwsBlockBody(#62, (#94, #98, #100, #127, #155, #17, #113), ());
#148=LwsProcedureCall(#91, (), #144);
#149=LwsQualifiedIdentifier(#93, .F., ''Index'', ());
#150=LwsQualifiedIdentifier(#136, .F., ''Stuff'', ());
#151=LwsArgumentsSelector(#50, #63);
#152=LwsQualifiedIdentifier(#139, .F., ''Count'', ());
#153=LwsQualifiedIdentifier(#109, .F., ''Index'', ());
#154=LwsDecimalLiteral(#165, .F., ''33'');
#155=LwsProcedureCall(#147, (), #131);
#156=LwsProcedureCall(#22, (), #108);
#157=LwsNegativeExpression(#15, .F., #48);
#158=LwsQualifiedIdentifier(#94, .F., ''Index'', ());
#159=LwsAggregate(#60, .F., (#133));
#160=LwsDecimalLiteral(#116, .F., ''5'');
#161=LwsArgumentsSelector(#117, #64);
#162=LwsDecimalLiteral(#136, .F., ''5'');
#163=LwsQualifiedIdentifier(#79, .F., ''Put'', (#140));
#164=LwsProcedureCall(#22, (), #46);
#165=LwsAssignment(#22, (), #41, #154);
#166=LwsProcedureCall(#22, (), #56);
#167=LwsQualifiedIdentifier(#98, .F., ''Put'', (#106));
#168=LwsArgumentsSelector(#73, #72);
#169=LwsDecimalLiteral(#94, .F., ''157'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBody9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPlusExpression(#45, .F., #56, #68);
#2=LwsBlockBody(#47, (#43), ());
#3=LwsBlockBody(#4, (#13, #28, #12), ());
#4=LwsBlockStatement(#43, (), $, (#65, #69, #52), #3);
#5=LwsQualifiedIdentifier(#34, .F., ''Index'', ());
#6=LwsQualifiedIdentifier(#56, .F., ''STOP'', ());
#7=LwsQualifiedIdentifier(#16, .F., ''FLOAT'', ());
#8=LwsQualifiedIdentifier(#17, .F., ''INTEGER'', ());
#9=LwsQualifiedIdentifier(#19, .F., ''INTEGER'', ());
#10=LwsQualifiedIdentifier(#13, .F., ''Count_Stuff'', ());
#11=LwsAggregate(#22, .F., (#61));
#12=LwsLoopStatement(#3, (), $, #63, (#35));
#13=LwsAssignment(#3, (), #10, #45);
#14=LwsProcedureCall(#43, (), #18);
#15=LwsQualifiedIdentifier(#28, .F., ''Put'', (#22));
#16=LwsSubtypeIndication(#46, #7, $);
#17=LwsSubtypeIndication(#69, #8, $);
#18=LwsQualifiedIdentifier(#14, .F., ''Put'', (#44));
#19=LwsSubtypeIndication(#52, #9, $);
#20=LwsExplicitRange(#25, .F., #31, #29);
#21=LwsQualifiedIdentifier(#64, .F., ''STOP'', ());
#22=LwsArgumentsSelector(#15, #11);
#23=LwsAggregate(#36, .F., (#60));
#24=LwsQualifiedIdentifier(#35, .F., ''Put'', (#41));
#25=LwsMembershipIteration(#43, ''Index'', .F., #20);
#26=LwsDecimalLiteral(#62, .F., ''5'');
#27=LwsProcedureDeclaration(#47, (), .F., #49);
#28=LwsProcedureCall(#3, (), #15);
#29=LwsDecimalLiteral(#20, .F., ''10'');
#30=LwsObjectDeclaration(#47, (''Dog'', ''Cat''), .F., .F., #57, $);
#31=LwsDecimalLiteral(#20, .F., ''1'');
#32=LwsAggregate(#41, .F., (#66, #40));
#33=LwsQualifiedIdentifier(#64, .F., ''START'', ());
#34=LwsAggregate(#44, .F., (#5, #54));
#35=LwsProcedureCall(#12, (), #24);
#36=LwsArgumentsSelector(#51, #23);
#37=LwsQualifiedIdentifier(#67, .F., ''New_Line'', ());
#38=LwsQualifiedIdentifier(#48, .F., ''INTEGER'', ());
#39=LwsDecimalLiteral(#45, .F., ''222'');
#40=LwsDecimalLiteral(#32, .F., ''5'');
#41=LwsArgumentsSelector(#24, #32);
#42=LwsQualifiedIdentifier(#57, .F., ''INTEGER'', ());
#43=LwsLoopStatement(#2, (), $, #25, (#58, #14, #4, #67));
#44=LwsArgumentsSelector(#18, #34);
#45=LwsPlusExpression(#13, .F., #1, #39);
#46=LwsObjectDeclaration(#47, (''Pig'', ''Cow''), .F., .F., #16, $);
#47=LwsSubprogramBody(#59, (#30, #46), #27, #2);
#48=LwsSubtypeIndication(#65, #38, $);
#49=LwsCompoundName(#27, (''Automatc''));
#50=LwsQualifiedIdentifier(#56, .F., ''START'', ());
#51=LwsQualifiedIdentifier(#58, .F., ''Put'', (#36));
#52=LwsObjectDeclaration(#4, (''Count_Stuff''), .F., .F., #19, $);
#53=LwsQualifiedIdentifier(#62, .F., ''START'', ());
#54=LwsDecimalLiteral(#34, .F., ''3'');
#55=LwsQualifiedIdentifier(#65, .F., ''Index'', ());
#56=LwsPlusExpression(#1, .F., #50, #6);
#57=LwsSubtypeIndication(#30, #42, $);
#58=LwsProcedureCall(#43, (), #51);
#59=LwsParsingResult($, (#47), $);
#60=LwsStringLiteral(#23, .F., ''The value of Index is'');
#61=LwsStringLiteral(#11, .F., '' --->'');
#62=LwsPlusExpression(#69, .F., #53, #26);
#63=LwsMembershipIteration(#12, ''Index'', .F., #64);
#64=LwsExplicitRange(#63, .F., #33, #21);
#65=LwsObjectDeclaration(#4, (''START''), .F., .T., #48, #55);
#66=LwsQualifiedIdentifier(#32, .F., ''Index'', ());
#67=LwsProcedureCall(#43, (), #37);
#68=LwsQualifiedIdentifier(#1, .F., ''Index'', ());
#69=LwsObjectDeclaration(#4, (''STOP''), .F., .T., #17, #62);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramBodyStubDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#2, (''U''), .inputOutputMode., #4, $);
#2=LwsProcedureDeclaration(#5, (#1), .F., #6);
#3=LwsParsingResult($, (#5), $);
#4=LwsQualifiedIdentifier(#1, .F., ''REAL'', ());
#5=LwsSubprogramBodyStubDeclaration(#3, #2);
#6=LwsCompoundName(#2, (''TRANSFORM''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''DOT_PRODUCT'', ());
#2=LwsFormalParameter(#3, (''X'', ''Y''), $, #4, $);
#3=LwsOperatorOverloadDeclaration(#7, (#2), .F., #8, #5, #8);
#4=LwsQualifiedIdentifier(#2, .F., ''VECTOR'', ());
#5=LwsQualifiedIdentifier(#3, .F., ''REAL'', ());
#6=LwsParsingResult($, (#7), $);
#7=LwsSubprogramRenamingDeclaration(#6, #1, #3);
#8=LwsStringDesignator(#3, ''"*"'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#9, .F., ''CELL'', ());
#2=LwsQualifiedIdentifier(#8, .F., ''LINK'', ());
#3=LwsQualifiedIdentifier(#8, .F., ''HEAD'', ());
#4=LwsSubprogramRenamingDeclaration(#7, #5, #9);
#5=LwsQualifiedIdentifier(#4, .F., ''MIN_CELL'', ());
#6=LwsCompoundName(#9, (''MINIMUM''));
#7=LwsParsingResult($, (#4), $);
#8=LwsFormalParameter(#9, (''L''), $, #2, #3);
#9=LwsFunctionDeclaration(#4, (#8), .F., #6, #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#4, (''GREATER''));
#2=LwsQualifiedIdentifier(#3, .F., ''NEXT'', ());
#3=LwsSubprogramRenamingDeclaration(#6, #2, #4);
#4=LwsFunctionDeclaration(#3, (), .F., #1, #5);
#5=LwsQualifiedIdentifier(#4, .F., ''RELATION_TYPE'', ());
#6=LwsParsingResult($, (#3), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#7, ''Disk_Head_Scheduler'');
#2=LwsCompoundName(#11, (''Disk_Write''));
#3=LwsSubprogramRenamingDeclaration(#5, #7, #11);
#4=LwsFormalParameter(#11, (''Track_Name''), .inputMode., #12, $);
#5=LwsParsingResult($, (#3), $);
#6=LwsNamedSelector(#7, ''Transmit'');
#7=LwsQualifiedIdentifier(#3, .F., ''System_Specific'', (#10, #1, #6));
#8=LwsFormalParameter(#11, (''Item''), .inputMode., #9, $);
#9=LwsQualifiedIdentifier(#8, .F., ''Data'', ());
#10=LwsNamedSelector(#7, ''Device_Drivers'');
#11=LwsProcedureDeclaration(#3, (#4, #8), .F., #2);
#12=LwsQualifiedIdentifier(#4, .F., ''Track'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#6), $);
#2=LwsQualifiedIdentifier(#5, .F., ''K'', ());
#3=LwsFormalParameter(#10, (''C''), .inputMode., #4, $);
#4=LwsQualifiedIdentifier(#3, .F., ''Character'', ());
#5=LwsAggregate(#9, .F., (#2));
#6=LwsSubprogramRenamingDeclaration(#1, #8, #10);
#7=LwsCompoundName(#10, (''My_Write''));
#8=LwsQualifiedIdentifier(#6, .F., ''Pool'', (#9, #11));
#9=LwsArgumentsSelector(#8, #5);
#10=LwsProcedureDeclaration(#6, (#3), .F., #7);
#11=LwsNamedSelector(#8, ''Write'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsStringLiteral(#2, .F., ''+'');
#2=LwsSubprogramRenamingDeclaration(#7, #1, #8);
#3=LwsCompoundName(#8, (''Real_Plus''));
#4=LwsFormalParameter(#8, (''Left'', ''Right''), $, #5, $);
#5=LwsQualifiedIdentifier(#4, .F., ''Real'', ());
#6=LwsQualifiedIdentifier(#8, .F., ''Real'', ());
#7=LwsParsingResult($, (#2), $);
#8=LwsFunctionDeclaration(#2, (#4), .F., #3, #6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubprogramRenamingDeclaration7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFunctionDeclaration(#2, (), .F., #3, #6);
#2=LwsSubprogramRenamingDeclaration(#5, #4, #1);
#3=LwsCompoundName(#1, (''Rouge''));
#4=LwsQualifiedIdentifier(#2, .F., ''Red'', ());
#5=LwsParsingResult($, (#2), $);
#6=LwsQualifiedIdentifier(#1, .F., ''Color'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsSubtypeDeclaration(#1, ''RAINBOW'', #8);
#3=LwsQualifiedIdentifier(#6, .F., ''RED'', ());
#4=LwsQualifiedIdentifier(#6, .F., ''BLUE'', ());
#5=LwsRangeConstraint(#8, #6);
#6=LwsExplicitRange(#5, .F., #3, #4);
#7=LwsQualifiedIdentifier(#8, .F., ''COLOR'', ());
#8=LwsSubtypeIndication(#2, #7, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#4, #3, $);
#2=LwsParsingResult($, (#4), $);
#3=LwsQualifiedIdentifier(#1, .F., ''RAINBOW'', ());
#4=LwsSubtypeDeclaration(#2, ''RED_BLUE'', #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''INTEGER'', ());
#2=LwsDecimalLiteral(#5, .F., ''10'');
#3=LwsRangeConstraint(#7, #5);
#4=LwsSubtypeDeclaration(#9, ''SMALLINT'', #7);
#5=LwsExplicitRange(#3, .F., #6, #2);
#6=LwsNegativeExpression(#5, .F., #8);
#7=LwsSubtypeIndication(#4, #1, #3);
#8=LwsDecimalLiteral(#6, .F., ''10'');
#9=LwsParsingResult($, (#4), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#2, #5);
#2=LwsQualifiedIdentifier(#8, .F., ''MATRIX'', (#1));
#3=LwsDecimalLiteral(#7, .F., ''10'');
#4=LwsDecimalLiteral(#7, .F., ''1'');
#5=LwsAggregate(#1, .F., (#7, #11));
#6=LwsParsingResult($, (#9), $);
#7=LwsExplicitRange(#5, .F., #4, #3);
#8=LwsSubtypeIndication(#9, #2, $);
#9=LwsSubtypeDeclaration(#6, ''SQUARE'', #8);
#10=LwsDecimalLiteral(#11, .F., ''1'');
#11=LwsExplicitRange(#5, .F., #10, #12);
#12=LwsDecimalLiteral(#11, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#2, .F., (#7));
#2=LwsArgumentsSelector(#5, #1);
#3=LwsSubtypeDeclaration(#6, ''MALE'', #4);
#4=LwsSubtypeIndication(#3, #5, $);
#5=LwsQualifiedIdentifier(#4, .F., ''PERSON'', (#2));
#6=LwsParsingResult($, (#3), $);
#7=LwsComponentAssociation(#1, #10, (#8));
#8=LwsExpressionChoice(#7, #9);
#9=LwsQualifiedIdentifier(#8, .F., ''SEX'', ());
#10=LwsQualifiedIdentifier(#7, .F., ''M'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testSubtypeDeclaration6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#5, ''indexed_table_range'');
#2=LwsSubtypeIndication(#4, #5, $);
#3=LwsParsingResult($, (#4), $);
#4=LwsSubtypeDeclaration(#3, ''Task_Lists_Range'', #2);
#5=LwsQualifiedIdentifier(#2, .F., ''Task_Lists'', (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBody1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsMembershipIteration(#5, ''Index'', .F., #12);
#2=LwsAggregate(#13, .F., (#9));
#3=LwsDecimalLiteral(#12, .F., ''4'');
#4=LwsDecimalLiteral(#10, .F., ''0.0'');
#5=LwsLoopStatement(#7, (), $, #1, (#10, #8));
#6=LwsQualifiedIdentifier(#8, .F., ''Put_Line'', (#13));
#7=LwsBlockBody(#15, (#5), ());
#8=LwsProcedureCall(#5, (), #6);
#9=LwsStringLiteral(#2, .F., ''This is a short line'');
#10=LwsDelayStatement(#5, (), #4);
#11=LwsDecimalLiteral(#12, .F., ''1'');
#12=LwsExplicitRange(#1, .F., #11, #3);
#13=LwsArgumentsSelector(#6, #2);
#14=LwsParsingResult($, (#15), $);
#15=LwsTaskBody(#14, (), ''SHORT_LINE'', #7);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBody2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#33, .F., ''Start_Sums'', ());
#2=LwsQualifiedIdentifier(#11, .F., ''E_No'', ());
#3=LwsSubtypeIndication(#20, #13, $);
#4=LwsArgumentsSelector(#18, #5);
#5=LwsAggregate(#4, .F., (#14, #16));
#6=LwsQualifiedIdentifier(#27, .F., ''Result'', ());
#7=LwsQualifiedIdentifier(#37, .F., ''INTEGER'', ());
#8=LwsObjectDeclaration(#15, (''Local_E_No''), .F., .F., #37, $);
#9=LwsQualifiedIdentifier(#28, .F., ''Total'', ());
#10=LwsQualifiedIdentifier(#30, .F., ''INTEGER'', ());
#11=LwsAssignment(#33, (), #36, #2);
#12=LwsExplicitRange(#26, .F., #29, #38);
#13=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', ());
#14=LwsQualifiedIdentifier(#5, .F., ''Local_E_No'', ());
#15=LwsTaskBody(#34, (#20, #8), ''SUMMING_TASK_TYPE'', #31);
#16=LwsQualifiedIdentifier(#5, .F., ''Index'', ());
#17=LwsFormalParameter(#33, (''E_No''), .inputMode., #35, $);
#18=LwsQualifiedIdentifier(#24, .F., ''Hours_Worked'', (#4));
#19=LwsQualifiedIdentifier(#27, .F., ''Total'', ());
#20=LwsObjectDeclaration(#15, (''Total''), .F., .F., #3, #32);
#21=LwsLoopStatement(#31, (), $, #26, (#28));
#22=LwsQualifiedIdentifier(#24, .F., ''Total'', ());
#23=LwsAcceptStatement(#31, (), #25, (#30), (#27), ());
#24=LwsPlusExpression(#28, .F., #22, #18);
#25=LwsQualifiedIdentifier(#23, .F., ''Return_Sum'', ());
#26=LwsMembershipIteration(#21, ''Index'', .F., #12);
#27=LwsAssignment(#23, (), #6, #19);
#28=LwsAssignment(#21, (), #9, #24);
#29=LwsDecimalLiteral(#12, .F., ''1'');
#30=LwsFormalParameter(#23, (''Result''), .outputMode., #10, $);
#31=LwsBlockBody(#15, (#33, #21, #23), ());
#32=LwsDecimalLiteral(#20, .F., ''0'');
#33=LwsAcceptStatement(#31, (), #1, (#17), (#11), ());
#34=LwsParsingResult($, (#15), $);
#35=LwsQualifiedIdentifier(#17, .F., ''INTEGER'', ());
#36=LwsQualifiedIdentifier(#11, .F., ''Local_E_No'', ());
#37=LwsSubtypeIndication(#8, #7, $);
#38=LwsQualifiedIdentifier(#12, .F., ''Days'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBody3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAcceptStatement(#83, (), #38, (#26), (#77), ());
#2=LwsSubtypeIndication(#51, #36, #18);
#3=LwsArgumentsSelector(#27, #7);
#4=LwsBlockBody(#58, (#43), ());
#5=LwsAggregate(#86, .F., (#16));
#6=LwsObjectDeclaration(#58, (''COUNT''), .F., .F., #10, #69);
#7=LwsAggregate(#3, .F., (#61));
#8=LwsAcceptAlternative(#57, #33, (#76, #62, #29));
#9=LwsDecimalLiteral(#33, .F., ''0'');
#10=LwsSubtypeIndication(#6, #64, #25);
#11=LwsAssignment(#83, (), #54, #68);
#12=LwsDecimalLiteral(#68, .F., ''1'');
#13=LwsPlusExpression(#67, .F., #46, #85);
#14=LwsQualifiedIdentifier(#67, .F., ''COUNT'', ());
#15=LwsLessThanExpression(#83, .F., #82, #31);
#16=LwsQualifiedIdentifier(#5, .F., ''OUT_INDEX'', ());
#17=LwsModExpression(#41, .F., #28, #48);
#18=LwsRangeConstraint(#2, #23);
#19=LwsDecimalLiteral(#51, .F., ''1'');
#20=LwsQualifiedIdentifier(#33, .F., ''COUNT'', ());
#21=LwsParsingResult($, (#58), $);
#22=LwsComponentSubtype(#35, .F., #56);
#23=LwsExplicitRange(#18, .F., #53, #73);
#24=LwsDecimalLiteral(#32, .F., ''0'');
#25=LwsRangeConstraint(#10, #32);
#26=LwsFormalParameter(#1, (''C''), .inputMode., #39, $);
#27=LwsQualifiedIdentifier(#77, .F., ''POOL'', (#3));
#28=LwsQualifiedIdentifier(#17, .F., ''OUT_INDEX'', ());
#29=LwsAssignment(#8, (), #70, #63);
#30=LwsQualifiedIdentifier(#32, .F., ''POOL_SIZE'', ());
#31=LwsQualifiedIdentifier(#15, .F., ''POOL_SIZE'', ());
#32=LwsExplicitRange(#25, .F., #24, #30);
#33=LwsGreaterThanExpression(#8, .F., #20, #9);
#34=LwsQualifiedIdentifier(#84, .F., ''POOL'', (#86));
#35=LwsArrayType(#72, (#49), #22);
#36=LwsQualifiedIdentifier(#2, .F., ''INTEGER'', ());
#37=LwsQualifiedIdentifier(#56, .F., ''CHARACTER'', ());
#38=LwsQualifiedIdentifier(#1, .F., ''WRITE'', ());
#39=LwsQualifiedIdentifier(#26, .F., ''CHARACTER'', ());
#40=LwsModExpression(#68, .F., #50, #74);
#41=LwsPlusExpression(#62, .F., #17, #75);
#42=LwsQualifiedIdentifier(#62, .F., ''OUT_INDEX'', ());
#43=LwsLoopStatement(#4, (), $, $, (#57));
#44=LwsQualifiedIdentifier(#49, .F., ''POOL_SIZE'', ());
#45=LwsObjectDeclaration(#58, (''POOL_SIZE''), .F., .T., #80, #59);
#46=LwsQualifiedIdentifier(#13, .F., ''COUNT'', ());
#47=LwsQualifiedIdentifier(#84, .F., ''C'', ());
#48=LwsQualifiedIdentifier(#17, .F., ''POOL_SIZE'', ());
#49=LwsExplicitRange(#35, .F., #52, #44);
#50=LwsQualifiedIdentifier(#40, .F., ''IN_INDEX'', ());
#51=LwsObjectDeclaration(#58, (''IN_INDEX'', ''OUT_INDEX''), .F., .F., #2, #19);
#52=LwsDecimalLiteral(#49, .F., ''1'');
#53=LwsDecimalLiteral(#23, .F., ''1'');
#54=LwsQualifiedIdentifier(#11, .F., ''IN_INDEX'', ());
#55=LwsDecimalLiteral(#63, .F., ''1'');
#56=LwsSubtypeIndication(#22, #37, $);
#57=LwsSelectiveWaitStatement(#43, (), (#83, #8, #71), ());
#58=LwsTaskBody(#21, (#45, #72, #6, #51), ''BUFFER'', #4);
#59=LwsDecimalLiteral(#45, .F., ''100'');
#60=LwsQualifiedIdentifier(#80, .F., ''INTEGER'', ());
#61=LwsQualifiedIdentifier(#7, .F., ''IN_INDEX'', ());
#62=LwsAssignment(#8, (), #42, #41);
#63=LwsMinusExpression(#29, .F., #66, #55);
#64=LwsQualifiedIdentifier(#10, .F., ''INTEGER'', ());
#65=LwsQualifiedIdentifier(#76, .F., ''READ'', ());
#66=LwsQualifiedIdentifier(#63, .F., ''COUNT'', ());
#67=LwsAssignment(#83, (), #14, #13);
#68=LwsPlusExpression(#11, .F., #40, #12);
#69=LwsDecimalLiteral(#6, .F., ''0'');
#70=LwsQualifiedIdentifier(#29, .F., ''COUNT'', ());
#71=LwsTerminateAlternative(#57, $);
#72=LwsObjectDeclaration(#58, (''POOL''), .F., .F., #35, $);
#73=LwsQualifiedIdentifier(#23, .F., ''POOL_SIZE'', ());
#74=LwsQualifiedIdentifier(#40, .F., ''POOL_SIZE'', ());
#75=LwsDecimalLiteral(#41, .F., ''1'');
#76=LwsAcceptStatement(#8, (), #65, (#79), (#84), ());
#77=LwsAssignment(#1, (), #27, #78);
#78=LwsQualifiedIdentifier(#77, .F., ''C'', ());
#79=LwsFormalParameter(#76, (''C''), .outputMode., #81, $);
#80=LwsSubtypeIndication(#45, #60, $);
#81=LwsQualifiedIdentifier(#79, .F., ''CHARACTER'', ());
#82=LwsQualifiedIdentifier(#15, .F., ''COUNT'', ());
#83=LwsAcceptAlternative(#57, #15, (#1, #11, #67));
#84=LwsAssignment(#76, (), #47, #34);
#85=LwsDecimalLiteral(#13, .F., ''1'');
#86=LwsArgumentsSelector(#34, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBody4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#3, .F., (#14));
#2=LwsTaskDeclaration(#33, ''Inner'', $);
#3=LwsArgumentsSelector(#5, #1);
#4=LwsQualifiedIdentifier(#7, .F., ''A'', (#27));
#5=LwsQualifiedIdentifier(#34, .F., ''T'', (#12, #3));
#6=LwsSubtypeIndication(#35, #32, $);
#7=LwsAssignment(#19, (), #18, #4);
#8=LwsObjectDeclaration(#33, (''Int''), .T., .F., #30, $);
#9=LwsBlockBody(#21, (#34), ());
#10=LwsQualifiedIdentifier(#20, .F., ''A'', ());
#11=LwsQualifiedIdentifier(#30, .F., ''Integer'', ());
#12=LwsNamedSelector(#5, ''E'');
#13=LwsObjectDeclaration(#33, (''X''), .F., .F., #20, $);
#14=LwsQualifiedIdentifier(#1, .F., ''Int'', (#15));
#15=LwsAccessAttribute(#14);
#16=LwsQualifiedIdentifier(#19, .F., ''E'', ());
#17=LwsQualifiedIdentifier(#31, .F., ''Integer'', ());
#18=LwsQualifiedIdentifier(#7, .F., ''X'', ());
#19=LwsAcceptStatement(#22, (), #16, (#31), (#7), ());
#20=LwsSubtypeIndication(#13, #10, $);
#21=LwsTaskBody(#33, (), ''Inner'', #9);
#22=LwsBlockBody(#33, (#19), ());
#23=LwsAggregate(#27, .F., (#25));
#24=LwsTaskBody(#28, (), ''T'', #26);
#25=LwsQualifiedIdentifier(#23, .F., ''Z'', ());
#26=LwsBlockBody(#24, (#33), ());
#27=LwsArgumentsSelector(#4, #23);
#28=LwsParsingResult($, (#24), $);
#29=LwsFullTypeDeclaration(#33, ''A'', $, #35);
#30=LwsSubtypeIndication(#8, #11, $);
#31=LwsFormalParameter(#19, (''Z''), .accessMode., #17, $);
#32=LwsQualifiedIdentifier(#6, .F., ''Integer'', ());
#33=LwsBlockStatement(#26, (), $, (#29, #13, #8, #2, #21), #22);
#34=LwsProcedureCall(#9, (), #5);
#35=LwsAccessToObject(#29, .allAccessMode., #6);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBody5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAccessAttribute(#9);
#2=LwsAggregate(#4, .F., (#9));
#3=LwsQualifiedIdentifier(#7, .F., ''T'', (#6, #4));
#4=LwsArgumentsSelector(#3, #2);
#5=LwsParsingResult($, (#8), $);
#6=LwsNamedSelector(#3, ''E'');
#7=LwsProcedureCall(#10, (), #3);
#8=LwsTaskBody(#5, (), ''Inner'', #10);
#9=LwsQualifiedIdentifier(#2, .F., ''Int'', (#1));
#10=LwsBlockBody(#8, (#7), ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskBodyStubDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsTaskBodyStubDeclaration(#1, ''MainLoop'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryDeclaration(#10, ''WRITE'', $, (#2));
#2=LwsFormalParameter(#1, (''E''), .inputMode., #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''ITEM'', ());
#4=LwsEntryDeclaration(#10, ''READ'', $, (#5));
#5=LwsFormalParameter(#4, (''V''), .outputMode., #6, $);
#6=LwsQualifiedIdentifier(#5, .F., ''ITEM'', ());
#7=LwsTaskDefinition(#9, #10, $);
#8=LwsParsingResult($, (#9), $);
#9=LwsTaskDeclaration(#8, ''PRODUCER_CONSUMER'', #7);
#10=LwsTaskPart(#7, (#4, #1), ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsTaskDefinition(#4, #5, $);
#2=LwsQualifiedIdentifier(#9, .F., ''ITEM'', ());
#3=LwsParsingResult($, (#4), $);
#4=LwsTaskDeclaration(#3, ''CONTROLLER'', #1);
#5=LwsTaskPart(#1, (#6), ());
#6=LwsEntryDeclaration(#5, ''REQUEST'', #7, (#9));
#7=LwsDiscreteRange(#6, .F., #8, $);
#8=LwsQualifiedIdentifier(#7, .F., ''LEVEL'', ());
#9=LwsFormalParameter(#6, (''D''), $, #2, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsTaskDefinition(#13, #5, $);
#2=LwsQualifiedIdentifier(#3, .F., ''INDEX'', ());
#3=LwsFormalParameter(#14, (''N''), .inputMode., #2, $);
#4=LwsFormalParameter(#14, (''E''), .inputMode., #6, $);
#5=LwsTaskPart(#1, (#7, #14), ());
#6=LwsQualifiedIdentifier(#4, .F., ''ITEM'', ());
#7=LwsEntryDeclaration(#5, ''READ'', $, (#10, #12));
#8=LwsQualifiedIdentifier(#10, .F., ''INDEX'', ());
#9=LwsQualifiedIdentifier(#12, .F., ''ITEM'', ());
#10=LwsFormalParameter(#7, (''N''), .inputMode., #8, $);
#11=LwsParsingResult($, (#13), $);
#12=LwsFormalParameter(#7, (''V''), .outputMode., #9, $);
#13=LwsTaskDeclaration(#11, ''PROTECTED_ARRAY'', #1);
#14=LwsEntryDeclaration(#5, ''WRITE'', $, (#3, #4));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsTaskDeclaration(#2, ''PROTECTED_ARRAY'', $);
#2=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskTypeDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryDeclaration(#2, ''RELEASE'', $, ());
#2=LwsTaskPart(#3, (#4, #1), ());
#3=LwsTaskDefinition(#5, #2, $);
#4=LwsEntryDeclaration(#2, ''SEIZE'', $, ());
#5=LwsTaskTypeDeclaration(#6, ''RESOURCE'', #3, $);
#6=LwsParsingResult($, (#5), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskTypeDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsTaskDefinition(#10, #7, $);
#2=LwsFormalParameter(#8, (''C''), .outputMode., #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''CHARACTER'', ());
#4=LwsFormalParameter(#5, (''C''), .inputMode., #9, $);
#5=LwsEntryDeclaration(#7, ''WRITE'', $, (#4));
#6=LwsParsingResult($, (#10), $);
#7=LwsTaskPart(#1, (#8, #5), ());
#8=LwsEntryDeclaration(#7, ''READ'', $, (#2));
#9=LwsQualifiedIdentifier(#4, .F., ''CHARACTER'', ());
#10=LwsTaskTypeDeclaration(#6, ''KEYBOARD_DRIVER'', #1, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskTypeDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#8, (''C''), .outputMode., #10, $);
#2=LwsDiscriminantSpecification(#5, (#3));
#3=LwsDiscriminantAttribute(#2, (''ID''), .F., #9, $);
#4=LwsTaskDefinition(#5, #7, $);
#5=LwsTaskTypeDeclaration(#6, ''Keyboard_Driver'', #4, #2);
#6=LwsParsingResult($, (#5), $);
#7=LwsTaskPart(#4, (#8, #13), ());
#8=LwsEntryDeclaration(#7, ''Read'', $, (#1));
#9=LwsQualifiedIdentifier(#3, .F., ''Keyboard_ID'', ());
#10=LwsQualifiedIdentifier(#1, .F., ''Character'', ());
#11=LwsFormalParameter(#13, (''C''), .inputMode., #12, $);
#12=LwsQualifiedIdentifier(#11, .F., ''Character'', ());
#13=LwsEntryDeclaration(#7, ''Write'', $, (#11));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTaskTypeDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsEntryDeclaration(#3, ''Shut_Down'', $, ());
#2=LwsEntryDeclaration(#3, ''Next_Work_Item'', $, (#4));
#3=LwsTaskPart(#5, (#2, #1), ());
#4=LwsFormalParameter(#2, (''WI''), .inputMode., #6, $);
#5=LwsTaskDefinition(#7, #3, $);
#6=LwsQualifiedIdentifier(#4, .F., ''Work_Item'', ());
#7=LwsTaskTypeDeclaration(#8, ''Server'', #5, $);
#8=LwsParsingResult($, (#7), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTimedEntryCall1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#5, #7);
#2=LwsNamedSelector(#5, ''REQUEST'');
#3=LwsDelayStatement(#8, (), #10);
#4=LwsParsingResult($, (#8), $);
#5=LwsQualifiedIdentifier(#11, .F., ''CONTROLLER'', (#2, #6, #1));
#6=LwsArgumentsSelector(#5, #12);
#7=LwsAggregate(#1, .F., (#9));
#8=LwsTimedEntryCall(#4, (), (#11), (#3));
#9=LwsQualifiedIdentifier(#7, .F., ''SOME_ITEM'', ());
#10=LwsDecimalLiteral(#3, .F., ''45.0'');
#11=LwsEntryCall(#8, (), #5);
#12=LwsAggregate(#6, .F., (#13));
#13=LwsQualifiedIdentifier(#12, .F., ''MEDIUM'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeConversion1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''2'');
#2=LwsArgumentsSelector(#5, #7);
#3=LwsMultExpression(#7, .F., #1, #6);
#4=LwsParsingResult($, (#5), $);
#5=LwsQualifiedIdentifier(#4, .F., ''REAL'', (#2));
#6=LwsQualifiedIdentifier(#3, .F., ''J'', ());
#7=LwsAggregate(#2, .F., (#3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeConversion2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#2, #3);
#2=LwsQualifiedIdentifier(#5, .F., ''INTEGER'', (#1));
#3=LwsAggregate(#1, .F., (#4));
#4=LwsDecimalLiteral(#3, .F., ''1.6'');
#5=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeConversion3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#5, #6);
#2=LwsNegativeExpression(#6, .F., #4);
#3=LwsParsingResult($, (#5), $);
#4=LwsDecimalLiteral(#2, .F., ''0.4'');
#5=LwsQualifiedIdentifier(#3, .F., ''INTEGER'', (#1));
#6=LwsAggregate(#1, .F., (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeConversion4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAggregate(#3, .F., (#6));
#2=LwsQualifiedIdentifier(#5, .F., ''SEQUENCE'', (#3));
#3=LwsArgumentsSelector(#2, #1);
#4=LwsExplicitRange(#9, .F., #7, #8);
#5=LwsParsingResult($, (#2), $);
#6=LwsQualifiedIdentifier(#1, .F., ''LEDGER'', (#10));
#7=LwsDecimalLiteral(#4, .F., ''31'');
#8=LwsDecimalLiteral(#4, .F., ''42'');
#9=LwsAggregate(#10, .F., (#4));
#10=LwsArgumentsSelector(#6, #9);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFullTypeDeclaration(#8, ''COLOR'', $, #9);
#2=LwsStringEnumerationId(#9, ''RED'');
#3=LwsStringEnumerationId(#9, ''YELLOW'');
#4=LwsStringEnumerationId(#9, ''GREEN'');
#5=LwsStringEnumerationId(#9, ''BLACK'');
#6=LwsStringEnumerationId(#9, ''BROWN'');
#7=LwsStringEnumerationId(#9, ''BLUE'');
#8=LwsParsingResult($, (#1), $);
#9=LwsEnumerationType(#1, (#10, #2, #3, #4, #7, #6, #5));
#10=LwsStringEnumerationId(#9, ''WHITE'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration10 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExplicitRange(#8, .F., #2, #12);
#2=LwsQualifiedIdentifier(#1, .F., ''RED'', ());
#3=LwsQualifiedIdentifier(#9, .F., ''BOOLEAN'', ());
#4=LwsComponentSubtype(#6, .F., #9);
#5=LwsDiscreteRange(#6, .F., #7, #8);
#6=LwsArrayType(#10, (#5), #4);
#7=LwsQualifiedIdentifier(#5, .F., ''COLOR'', ());
#8=LwsRangeConstraint(#5, #1);
#9=LwsSubtypeIndication(#4, #3, $);
#10=LwsFullTypeDeclaration(#11, ''MIX'', $, #6);
#11=LwsParsingResult($, (#10), $);
#12=LwsQualifiedIdentifier(#1, .F., ''GREEN'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#7, .F., ''LENGTH'', ());
#2=LwsArgumentsSelector(#16, #4);
#3=LwsParsingResult($, (#14), $);
#4=LwsAggregate(#2, .F., (#7));
#5=LwsDiscriminantSpecification(#14, (#10));
#6=LwsDefinedRecordType(#14, .F., .F., .F., #13);
#7=LwsExplicitRange(#4, .F., #9, #1);
#8=LwsComponentAttribute(#13, (''IMAGE''), #15, $);
#9=LwsDecimalLiteral(#7, .F., ''1'');
#10=LwsDiscriminantAttribute(#5, (''LENGTH''), .F., #12, $);
#11=LwsSubtypeIndication(#15, #16, $);
#12=LwsQualifiedIdentifier(#10, .F., ''INTEGER'', ());
#13=LwsRecordDefinition(#6, (#8), $);
#14=LwsFullTypeDeclaration(#3, ''VAR_LINE'', #5, #6);
#15=LwsComponentSubtype(#8, .F., #11);
#16=LwsQualifiedIdentifier(#11, .F., ''STRING'', (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration12 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#6, .F., ''CHARACTER'', ());
#2=LwsIndex(#7, #8);
#3=LwsFullTypeDeclaration(#4, ''STRING'', $, #7);
#4=LwsParsingResult($, (#3), $);
#5=LwsComponentSubtype(#7, .F., #6);
#6=LwsSubtypeIndication(#5, #1, $);
#7=LwsArrayType(#3, (#2), #5);
#8=LwsQualifiedIdentifier(#2, .F., ''POSITIVE'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration13 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAttribute(#12, (''DAY''), #6, $);
#2=LwsSubtypeIndication(#20, #21, $);
#3=LwsQualifiedIdentifier(#18, .F., ''INTEGER'', ());
#4=LwsRangeConstraint(#18, #9);
#5=LwsDecimalLiteral(#9, .F., ''4000'');
#6=LwsComponentSubtype(#1, .F., #7);
#7=LwsSubtypeIndication(#6, #14, #22);
#8=LwsDecimalLiteral(#19, .F., ''1'');
#9=LwsExplicitRange(#4, .F., #13, #5);
#10=LwsComponentAttribute(#12, (''MONTH''), #20, $);
#11=LwsParsingResult($, (#23), $);
#12=LwsRecordDefinition(#15, (#1, #10, #16), $);
#13=LwsDecimalLiteral(#9, .F., ''0'');
#14=LwsQualifiedIdentifier(#7, .F., ''INTEGER'', ());
#15=LwsDefinedRecordType(#23, .F., .F., .F., #12);
#16=LwsComponentAttribute(#12, (''YEAR''), #17, $);
#17=LwsComponentSubtype(#16, .F., #18);
#18=LwsSubtypeIndication(#17, #3, #4);
#19=LwsExplicitRange(#22, .F., #8, #24);
#20=LwsComponentSubtype(#10, .F., #2);
#21=LwsQualifiedIdentifier(#2, .F., ''MONTH_NAME'', ());
#22=LwsRangeConstraint(#7, #19);
#23=LwsFullTypeDeclaration(#11, ''DATE'', $, #15);
#24=LwsDecimalLiteral(#19, .F., ''31'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration14 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#12, #18, $);
#2=LwsDiscriminantAttribute(#14, (''SIZE''), .F., #3, $);
#3=LwsQualifiedIdentifier(#2, .F., ''BUFFER_SIZE'', ());
#4=LwsExplicitRange(#13, .F., #15, #11);
#5=LwsDefinedRecordType(#7, .F., .F., .F., #20);
#6=LwsComponentSubtype(#19, .F., #9);
#7=LwsFullTypeDeclaration(#16, ''BUFFER'', #14, #5);
#8=LwsArgumentsSelector(#10, #13);
#9=LwsSubtypeIndication(#6, #10, $);
#10=LwsQualifiedIdentifier(#9, .F., ''STRING'', (#8));
#11=LwsQualifiedIdentifier(#4, .F., ''SIZE'', ());
#12=LwsComponentSubtype(#21, .F., #1);
#13=LwsAggregate(#8, .F., (#4));
#14=LwsDiscriminantSpecification(#7, (#2));
#15=LwsDecimalLiteral(#4, .F., ''1'');
#16=LwsParsingResult($, (#7), $);
#17=LwsDecimalLiteral(#21, .F., ''0'');
#18=LwsQualifiedIdentifier(#1, .F., ''BUFFER_SIZE'', ());
#19=LwsComponentAttribute(#20, (''VALUE''), #6, $);
#20=LwsRecordDefinition(#5, (#21, #19), $);
#21=LwsComponentAttribute(#20, (''POS''), #12, #17);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration15 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsComponentAttribute(#11, (''CYLINDER''), #16, $);
#2=LwsRecordDefinition(#29, (#23), #27);
#3=LwsComponentAttribute(#26, (''LINE_COUNT''), #22, $);
#4=LwsSubtypeIndication(#22, #31, #14);
#5=LwsExplicitRange(#14, .F., #30, #32);
#6=LwsComponentSubtype(#23, .F., #18);
#7=LwsComponentSubtype(#34, .F., #15);
#8=LwsExpressionChoice(#28, #25);
#9=LwsParsingResult($, (#17), $);
#10=LwsOtherChoice(#13);
#11=LwsRecordDefinition(#13, (#1, #34), $);
#12=LwsQualifiedIdentifier(#20, .F., ''DEVICE'', ());
#13=LwsVariantComponentAttribute(#27, (#10), #11);
#14=LwsRangeConstraint(#4, #5);
#15=LwsSubtypeIndication(#7, #21, $);
#16=LwsComponentSubtype(#1, .F., #33);
#17=LwsFullTypeDeclaration(#9, ''PERIPHERAL'', #35, #29);
#18=LwsSubtypeIndication(#6, #24, $);
#19=LwsSimpleIdentifier(#27, .F., ''UNIT'');
#20=LwsDiscriminantAttribute(#35, (''UNIT''), .F., #12, $);
#21=LwsQualifiedIdentifier(#15, .F., ''TRACK_NUMBER'', ());
#22=LwsComponentSubtype(#3, .F., #4);
#23=LwsComponentAttribute(#2, (''STATUS''), #6, $);
#24=LwsQualifiedIdentifier(#18, .F., ''STATE'', ());
#25=LwsQualifiedIdentifier(#8, .F., ''PRINTER'', ());
#26=LwsRecordDefinition(#28, (#3), $);
#27=LwsVariantRecordPart(#2, #19, (#28, #13));
#28=LwsVariantComponentAttribute(#27, (#8), #26);
#29=LwsDefinedRecordType(#17, .F., .F., .F., #2);
#30=LwsDecimalLiteral(#5, .F., ''1'');
#31=LwsQualifiedIdentifier(#4, .F., ''INTEGER'', ());
#32=LwsQualifiedIdentifier(#5, .F., ''PAGE_SIZE'', ());
#33=LwsSubtypeIndication(#16, #36, $);
#34=LwsComponentAttribute(#11, (''TRACK''), #7, $);
#35=LwsDiscriminantSpecification(#17, (#20));
#36=LwsQualifiedIdentifier(#33, .F., ''CYLINDER_INDEX'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration16 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFullTypeDeclaration(#5, ''BUFFER_NAME'', $, #3);
#2=LwsSubtypeIndication(#3, #4, $);
#3=LwsAccessToObject(#1, $, #2);
#4=LwsQualifiedIdentifier(#2, .F., ''BUFFER'', ());
#5=LwsParsingResult($, (#1), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration17 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGenericDiscriminant(#6);
#2=LwsComponentSubtype(#7, .F., #9);
#3=LwsQualifiedIdentifier(#9, .F., ''STATE'', ());
#4=LwsParsingResult($, (#6), $);
#5=LwsDefinedRecordType(#6, .F., .F., .F., #8);
#6=LwsFullTypeDeclaration(#4, ''PERIPHERAL'', #1, #5);
#7=LwsComponentAttribute(#8, (''STATUS''), #2, $);
#8=LwsRecordDefinition(#5, (#7), $);
#9=LwsSubtypeIndication(#2, #3, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#4, .F., ''1'');
#2=LwsRangeConstraint(#3, #4);
#3=LwsRangeIntegerType(#5, #2);
#4=LwsExplicitRange(#2, .F., #1, #6);
#5=LwsFullTypeDeclaration(#7, ''COLUMN'', $, #3);
#6=LwsDecimalLiteral(#4, .F., ''72'');
#7=LwsParsingResult($, (#5), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''10'');
#2=LwsComponentSubtype(#8, .F., #4);
#3=LwsExplicitRange(#8, .F., #9, #1);
#4=LwsSubtypeIndication(#2, #5, $);
#5=LwsQualifiedIdentifier(#4, .F., ''INTEGER'', ());
#6=LwsParsingResult($, (#7), $);
#7=LwsFullTypeDeclaration(#6, ''TABLE'', $, #8);
#8=LwsArrayType(#7, (#3), #2);
#9=LwsDecimalLiteral(#3, .F., ''1'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#5, #4, $);
#2=LwsParsingResult($, (#3), $);
#3=LwsFullTypeDeclaration(#2, ''LOCAL_COORDINATE'', $, #5);
#4=LwsQualifiedIdentifier(#1, .F., ''COORDINATE'', ());
#5=LwsDerivedType(#3, #1, .F., $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExplicitRange(#5, .F., #3, #4);
#2=LwsDerivedType(#8, #9, .F., $);
#3=LwsQualifiedIdentifier(#1, .F., ''TUE'', ());
#4=LwsQualifiedIdentifier(#1, .F., ''THU'', ());
#5=LwsRangeConstraint(#9, #1);
#6=LwsParsingResult($, (#8), $);
#7=LwsQualifiedIdentifier(#9, .F., ''DAY'', ());
#8=LwsFullTypeDeclaration(#6, ''MIDWEEK'', $, #2);
#9=LwsSubtypeIndication(#2, #7, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#6), $);
#2=LwsQualifiedIdentifier(#5, .F., ''KEY_MANAGER'', (#4));
#3=LwsDerivedType(#6, #5, .F., $);
#4=LwsNamedSelector(#2, ''KEY'');
#5=LwsSubtypeIndication(#3, #2, $);
#6=LwsFullTypeDeclaration(#1, ''SPECIAL_KEY'', $, #3);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#7), $);
#2=LwsDecimalLiteral(#8, .F., ''7'');
#3=LwsExplicitRange(#6, .F., #4, #5);
#4=LwsDecimalLiteral(#3, .F., ''0.0'');
#5=LwsDecimalLiteral(#3, .F., ''1.0E35'');
#6=LwsRangeConstraint(#8, #3);
#7=LwsFullTypeDeclaration(#1, ''MASS'', $, #8);
#8=LwsFloatingType(#7, #6, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''0.0'');
#2=LwsRangeConstraint(#5, #3);
#3=LwsExplicitRange(#2, .F., #1, #4);
#4=LwsDecimalLiteral(#3, .F., ''255.0'');
#5=LwsOrdinaryFixedType(#7, #2, #6);
#6=LwsDecimalLiteral(#5, .F., ''0.125'');
#7=LwsFullTypeDeclaration(#8, ''VOLT'', $, #5);
#8=LwsParsingResult($, (#7), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testTypeDeclaration9 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsIndex(#5, #7);
#2=LwsParsingResult($, (#8), $);
#3=LwsComponentSubtype(#5, .F., #4);
#4=LwsSubtypeIndication(#3, #6, $);
#5=LwsArrayType(#8, (#1), #3);
#6=LwsQualifiedIdentifier(#4, .F., ''REAL'', ());
#7=LwsQualifiedIdentifier(#1, .F., ''INTEGER'', ());
#8=LwsFullTypeDeclaration(#2, ''VECTOR'', $, #5);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUnaryPlus1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDecimalLiteral(#3, .F., ''10'');
#2=LwsParsingResult($, (#3), $);
#3=LwsPositiveExpression(#2, .F., #1);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUnarySub1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsNegativeExpression(#1, .F., #3);
#3=LwsDecimalLiteral(#2, .F., ''10'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#3, (''P''));
#2=LwsUnitInterface(#4, #3, ());
#3=LwsWithClause(#2, (#1), (#1));
#4=LwsParsingResult($, (#2), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith11 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#4, (''P'', ''K''));
#2=LwsParsingResult($, (#3), $);
#3=LwsUnitInterface(#2, #4, ());
#4=LwsWithClause(#3, (#1), (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith12 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsWithClause(#8, (#2), (#2));
#2=LwsCompoundName(#1, (''P'', ''K''));
#3=LwsQualifiedIdentifier(#7, .F., ''A'', ());
#4=LwsQualifiedIdentifier(#7, .F., ''B'', ());
#5=LwsQualifiedIdentifier(#7, .F., ''C'', ());
#6=LwsParsingResult($, (#8), $);
#7=LwsUseClause(#8, (#3, #4, #5), (#3, #4, #5));
#8=LwsUnitInterface(#6, #1, (#7));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith13 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''B'', ());
#2=LwsQualifiedIdentifier(#5, .F., ''C'', ());
#3=LwsCompoundName(#7, (''P'', ''K''));
#4=LwsCompoundName(#7, (''H''));
#5=LwsUseClause(#8, (#6, #1, #2), (#6, #1, #2));
#6=LwsQualifiedIdentifier(#5, .F., ''A'', ());
#7=LwsWithClause(#8, (#3, #4), (#3, #4));
#8=LwsUnitInterface(#9, #7, (#5));
#9=LwsParsingResult($, (#8), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUseClause(#6, (#3), (#3));
#2=LwsWithClause(#6, (#5), (#5));
#3=LwsQualifiedIdentifier(#1, .F., ''P'', ());
#4=LwsParsingResult($, (#6), $);
#5=LwsCompoundName(#2, (''P''));
#6=LwsUnitInterface(#4, #2, (#1));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith3 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsWithClause(#8, (#3), (#3));
#2=LwsParsingResult($, (#8), $);
#3=LwsCompoundName(#1, (''P''));
#4=LwsQualifiedIdentifier(#7, .F., ''P'', ());
#5=LwsUseClause(#8, (#6), (#6));
#6=LwsQualifiedIdentifier(#5, .F., ''P'', ());
#7=LwsUseClause(#8, (#4), (#4));
#8=LwsUnitInterface(#2, #1, (#7, #5));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith4 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#9, ''A'');
#2=LwsParsingResult($, (#3), $);
#3=LwsUnitInterface(#2, #10, (#6, #7));
#4=LwsQualifiedIdentifier(#7, .F., ''P'', (#8));
#5=LwsCompoundName(#10, (''P''));
#6=LwsUseClause(#3, (#9), (#9));
#7=LwsUseClause(#3, (#4), (#4));
#8=LwsNamedSelector(#4, ''B'');
#9=LwsQualifiedIdentifier(#6, .F., ''P'', (#1));
#10=LwsWithClause(#3, (#5), (#5));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith5 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUseClause(#10, (#14), (#14));
#2=LwsNamedSelector(#14, ''A'');
#3=LwsParsingResult($, (#10, #13, #24), $);
#4=LwsQualifiedIdentifier(#15, .F., ''P'', (#17));
#5=LwsCompoundName(#9, (''E''));
#6=LwsCompoundName(#18, (''P'', ''PP''));
#7=LwsNamedSelector(#23, ''B'');
#8=LwsCompoundName(#16, (''X'', ''PP''));
#9=LwsWithClause(#24, (#5), (#5));
#10=LwsUnitInterface(#3, #18, (#1, #15));
#11=LwsUseClause(#13, (#12), (#12));
#12=LwsQualifiedIdentifier(#11, .F., ''X'', (#20, #19));
#13=LwsUnitInterface(#3, #16, (#11, #21));
#14=LwsQualifiedIdentifier(#1, .F., ''P'', (#22, #2));
#15=LwsUseClause(#10, (#4), (#4));
#16=LwsWithClause(#13, (#8), (#8));
#17=LwsNamedSelector(#4, ''B'');
#18=LwsWithClause(#10, (#6), (#6));
#19=LwsNamedSelector(#12, ''A'');
#20=LwsNamedSelector(#12, ''PP'');
#21=LwsUseClause(#13, (#23), (#23));
#22=LwsNamedSelector(#14, ''PP'');
#23=LwsQualifiedIdentifier(#21, .F., ''X'', (#7));
#24=LwsUnitInterface(#3, #9, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith6 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#3), $);
#2=LwsCompoundName(#4, (''P'', ''K''));
#3=LwsUnitInterface(#1, #4, ());
#4=LwsWithClause(#3, (#2), (#2));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith7 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsParsingResult($, (#2), $);
#2=LwsUnitInterface(#1, #3, ());
#3=LwsWithClause(#2, (#4), (#4));
#4=LwsCompoundName(#3, (''P'', ''K''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_testUseWith8 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#3, (''P'', ''K''));
#2=LwsParsingResult($, (#4), $);
#3=LwsWithClause(#4, (#1), (#1));
#4=LwsUnitInterface(#2, #3, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_EOFExceptionExample [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUnit(#4, .F., (#44), #17);
#2=LwsProcedureCall(#36, (), #28);
#3=LwsAggregate(#43, .F., (#21, #49));
#4=LwsParsingResult($, (#1), $);
#5=LwsDecimalLiteral(#33, .F., ''100'');
#6=LwsProcedureCall(#45, (), #7);
#7=LwsQualifiedIdentifier(#6, .F., ''Put_Line'', (#30));
#8=LwsCatenationExpression(#50, .F., #35, #9);
#9=LwsStringLiteral(#8, .F., ''-----------'');
#10=LwsCompoundName(#16, (''ReadOut''));
#11=LwsProcedureCall(#42, (), #25);
#12=LwsQualifiedIdentifier(#48, .F., ''S'', ());
#13=LwsWithClause(#44, (#46), (#46));
#14=LwsUseClause(#44, (#15), (#15));
#15=LwsQualifiedIdentifier(#14, .F., ''Ada'', (#51));
#16=LwsProcedureDeclaration(#17, (), .F., #10);
#17=LwsSubprogramBody(#1, (#20, #53), #16, #42);
#18=LwsSubtypeIndication(#53, #24, $);
#19=LwsStringLiteral(#39, .F., ''-----------------------------------------------------'');
#20=LwsObjectDeclaration(#17, (''S''), .F., .F., #23, $);
#21=LwsQualifiedIdentifier(#3, .F., ''S'', ());
#22=LwsReturnStatement(#45, (), $);
#23=LwsSubtypeIndication(#20, #41, $);
#24=LwsQualifiedIdentifier(#18, .F., ''Integer'', ());
#25=LwsQualifiedIdentifier(#11, .F., ''Put_Line'', (#54));
#26=LwsAggregate(#54, .F., (#39));
#27=LwsArgumentsSelector(#28, #48);
#28=LwsQualifiedIdentifier(#2, .F., ''Get_Line'', (#27));
#29=LwsNamedExceptionChoice(#45, #34);
#30=LwsArgumentsSelector(#7, #50);
#31=LwsQualifiedIdentifier(#48, .F., ''N'', ());
#32=LwsArgumentsSelector(#41, #52);
#33=LwsExplicitRange(#52, .F., #37, #5);
#34=LwsQualifiedIdentifier(#29, .F., ''End_Error'', ());
#35=LwsStringLiteral(#8, .F., ''-----------------------------------------------------'');
#36=LwsLoopStatement(#42, (), $, $, (#2, #47));
#37=LwsDecimalLiteral(#33, .F., ''1'');
#38=LwsStringLiteral(#39, .F., ''-----------'');
#39=LwsCatenationExpression(#26, .F., #19, #38);
#40=LwsQualifiedIdentifier(#47, .F., ''Get_Line'', (#43));
#41=LwsQualifiedIdentifier(#23, .F., ''String'', (#32));
#42=LwsBlockBody(#17, (#11, #36), (#45));
#43=LwsArgumentsSelector(#40, #3);
#44=LwsUnitInterface(#1, #13, (#14));
#45=LwsExceptionHandler(#42, $, (#29), (#6, #22));
#46=LwsCompoundName(#13, (''Ada'', ''Text_IO''));
#47=LwsProcedureCall(#36, (), #40);
#48=LwsAggregate(#27, .F., (#12, #31));
#49=LwsQualifiedIdentifier(#3, .F., ''N'', ());
#50=LwsAggregate(#30, .F., (#8));
#51=LwsNamedSelector(#15, ''Text_IO'');
#52=LwsAggregate(#32, .F., (#33));
#53=LwsObjectDeclaration(#17, (''N''), .F., .F., #18, $);
#54=LwsArgumentsSelector(#25, #26);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a01_simple1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsBlockBody(#24, (#21), ());
#2=LwsQualifiedIdentifier(#33, .F., ''BOOLEAN'', ());
#3=LwsQualifiedIdentifier(#31, .F., ''Put'', ());
#4=LwsProcedureDeclaration(#24, (), .F., #20);
#5=LwsBlockBody(#7, (#31), ());
#6=LwsBlockBody(#11, (#28), ());
#7=LwsSubprogramBody(#24, (), #8, #5);
#8=LwsProcedureDeclaration(#7, (), .F., #30);
#9=LwsProcedureDeclaration(#11, (), .F., #27);
#10=LwsProcedureCall(#22, (), #12);
#11=LwsSubprogramBody(#24, (), #9, #6);
#12=LwsQualifiedIdentifier(#10, .F., ''Put'', ());
#13=LwsCompoundName(#26, (''P1''));
#14=LwsQualifiedIdentifier(#15, .F., ''Put'', ());
#15=LwsProcedureCall(#23, (), #14);
#16=LwsParsingResult($, (#17), $);
#17=LwsUnit(#16, .F., (), #24);
#18=LwsSubprogramBody(#24, (), #33, #22);
#19=LwsQualifiedIdentifier(#21, .F., ''Put'', ());
#20=LwsCompoundName(#4, (''Simple1''));
#21=LwsProcedureCall(#1, (), #19);
#22=LwsBlockBody(#18, (#10), ());
#23=LwsBlockBody(#25, (#15), ());
#24=LwsSubprogramBody(#17, (#25, #11, #7, #18), #4, #1);
#25=LwsSubprogramBody(#24, (), #26, #23);
#26=LwsProcedureDeclaration(#25, (), .F., #13);
#27=LwsCompoundName(#9, (''P2''));
#28=LwsProcedureCall(#6, (), #29);
#29=LwsQualifiedIdentifier(#28, .F., ''Put'', ());
#30=LwsCompoundName(#8, (''P3''));
#31=LwsProcedureCall(#5, (), #3);
#32=LwsCompoundName(#33, (''F1''));
#33=LwsFunctionDeclaration(#18, (), .F., #32, #2);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a02_simple2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubprogramBody(#25, (), #22, #28);
#2=LwsBlockBody(#29, (#15), ());
#3=LwsCompoundName(#18, (''Simple2''));
#4=LwsQualifiedIdentifier(#30, .F., ''BOOLEAN'', ());
#5=LwsBlockBody(#7, (#21), ());
#6=LwsCompoundName(#27, (''P2''));
#7=LwsSubprogramBody(#25, (), #8, #5);
#8=LwsProcedureDeclaration(#7, (), .F., #19);
#9=LwsProcedureCall(#20, (), #10);
#10=LwsQualifiedIdentifier(#9, .F., ''Put'', ());
#11=LwsCompoundName(#22, (''P3''));
#12=LwsProcedureCall(#28, (), #17);
#13=LwsBlockBody(#25, (#35), ());
#14=LwsQualifiedIdentifier(#32, .F., ''INTEGER'', ());
#15=LwsProcedureCall(#2, (), #34);
#16=LwsQualifiedIdentifier(#35, .F., ''Put'', ());
#17=LwsQualifiedIdentifier(#12, .F., ''Put'', ());
#18=LwsProcedureDeclaration(#25, (), .F., #3);
#19=LwsCompoundName(#8, (''P1''));
#20=LwsBlockBody(#26, (#9), ());
#21=LwsProcedureCall(#5, (), #33);
#22=LwsProcedureDeclaration(#1, (), .F., #11);
#23=LwsParsingResult($, (#24), $);
#24=LwsUnit(#23, .F., (), #25);
#25=LwsSubprogramBody(#24, (#7, #26, #1, #29), #18, #13);
#26=LwsSubprogramBody(#25, (), #27, #20);
#27=LwsProcedureDeclaration(#26, (), .F., #6);
#28=LwsBlockBody(#1, (#12), ());
#29=LwsSubprogramBody(#25, (), #30, #2);
#30=LwsFunctionDeclaration(#29, (#32), .F., #31, #4);
#31=LwsCompoundName(#30, (''F1''));
#32=LwsFormalParameter(#30, (''X''), .inputOutputMode., #14, $);
#33=LwsQualifiedIdentifier(#21, .F., ''Put'', ());
#34=LwsQualifiedIdentifier(#15, .F., ''Put'', ());
#35=LwsProcedureCall(#13, (), #16);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a03_firstText [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsIfClause(#12, #62, (#14));
#2=LwsIfStatement(#32, (), (#58), $);
#3=LwsProcedureDeclaration(#30, (), .F., #26);
#4=LwsOrExpression(#49, .F., #44, #9);
#5=LwsNullLiteral(#62, .F., ''null'');
#6=LwsLessThanExpression(#44, .T., #56, #8);
#7=LwsQualifiedIdentifier(#29, .F., ''var1'', ());
#8=LwsDecimalLiteral(#6, .F., ''3'');
#9=LwsEqualExpression(#4, .T., #19, #36);
#10=LwsExpressionChoice(#41, #28);
#11=LwsQualifiedIdentifier(#15, .F., ''Putline'', ());
#12=LwsIfStatement(#32, (), (#1), $);
#13=LwsParsingResult($, (#63), $);
#14=LwsNullStatement(#1, ());
#15=LwsProcedureCall(#41, (), #11);
#16=LwsDecimalLiteral(#20, .F., ''4'');
#17=LwsDecimalLiteral(#20, .F., ''15'');
#18=LwsQualifiedIdentifier(#66, .F., ''Putline'', ());
#19=LwsDecimalLiteral(#9, .F., ''5'');
#20=LwsGreaterThanExpression(#44, .T., #17, #16);
#21=LwsQualifiedIdentifier(#23, .F., ''Putline'', ());
#22=LwsQualifiedIdentifier(#25, .F., ''Putline'', ());
#23=LwsProcedureCall(#35, (), #21);
#24=LwsEqualExpression(#37, .T., #52, #34);
#25=LwsProcedureCall(#67, (), #22);
#26=LwsCompoundName(#3, (''FirstText''));
#27=LwsQualifiedIdentifier(#64, .F., ''var2'', ());
#28=LwsQualifiedIdentifier(#10, .F., ''B'', ());
#29=LwsAssignment(#32, (), #7, #64);
#30=LwsSubprogramBody(#63, (), #3, #32);
#31=LwsProcedureCall(#58, (), #48);
#32=LwsBlockBody(#30, (#40, #29, #50, #12, #2, #43, #67, #60, #35), ());
#33=LwsIfClause(#43, #37, (#66));
#34=LwsDecimalLiteral(#24, .F., ''5'');
#35=LwsLoopStatement(#32, (), $, $, (#23));
#36=LwsDecimalLiteral(#9, .F., ''5'');
#37=LwsAndExpression(#33, .F., #24, #46);
#38=LwsProcedureCall(#57, (), #61);
#39=LwsExpressionChoice(#57, #54);
#40=LwsNullStatement(#32, ());
#41=LwsCaseAlternative(#60, (#10), (#15));
#42=LwsDecimalLiteral(#64, .F., ''4'');
#43=LwsIfStatement(#32, (), (#33), $);
#44=LwsOrExpression(#4, .F., #20, #6);
#45=LwsDecimalLiteral(#55, .F., ''4'');
#46=LwsGreaterThanExpression(#37, .T., #47, #65);
#47=LwsDecimalLiteral(#46, .F., ''6'');
#48=LwsQualifiedIdentifier(#31, .F., ''Putline'', ());
#49=LwsWhileIteration(#67, #4);
#50=LwsProcedureCall(#32, (), #51);
#51=LwsQualifiedIdentifier(#50, .F., ''Putline'', ());
#52=LwsDecimalLiteral(#24, .F., ''4'');
#53=LwsNullLiteral(#62, .F., ''null'');
#54=LwsQualifiedIdentifier(#39, .F., ''A'', ());
#55=LwsEqualExpression(#58, .F., #45, #59);
#56=LwsDecimalLiteral(#6, .F., ''4'');
#57=LwsCaseAlternative(#60, (#39), (#38));
#58=LwsIfClause(#2, #55, (#31));
#59=LwsDecimalLiteral(#55, .F., ''5'');
#60=LwsCaseStatement(#32, (), #68, (#57, #41));
#61=LwsQualifiedIdentifier(#38, .F., ''Putline'', ());
#62=LwsEqualExpression(#1, .F., #5, #53);
#63=LwsUnit(#13, .F., (), #30);
#64=LwsAndExpression(#29, .F., #27, #42);
#65=LwsDecimalLiteral(#46, .F., ''7'');
#66=LwsProcedureCall(#33, (), #18);
#67=LwsLoopStatement(#32, (), $, #49, (#25));
#68=LwsQualifiedIdentifier(#60, .F., ''aCase'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a04_simpleFunction [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPlusExpression(#23, .F., #51, #29);
#2=LwsQualifiedIdentifier(#29, .F., ''Y'', ());
#3=LwsDecimalLiteral(#6, .F., ''14'');
#4=LwsSubprogramBody(#42, (#33, #19), #50, #12);
#5=LwsQualifiedIdentifier(#15, .F., ''Integer'', ());
#6=LwsAggregate(#46, .F., (#55, #3));
#7=LwsAggregate(#38, .F., (#20));
#8=LwsQualifiedIdentifier(#48, .F., ''New_Line'', ());
#9=LwsNamedSelector(#37, ''Io'');
#10=LwsCompoundName(#15, (''Sumsqr''));
#11=LwsProcedureCall(#12, (), #32);
#12=LwsBlockBody(#4, (#16, #17, #11, #40, #48), ());
#13=LwsQualifiedIdentifier(#16, .F., ''I'', ());
#14=LwsArgumentsSelector(#52, #35);
#15=LwsFunctionDeclaration(#19, (#24), .F., #10, #5);
#16=LwsAssignment(#12, (), #13, #21);
#17=LwsProcedureCall(#12, (), #52);
#18=LwsQualifiedIdentifier(#35, .F., ''I'', ());
#19=LwsSubprogramBody(#4, (), #15, #44);
#20=LwsQualifiedIdentifier(#7, .F., ''Sumsqr'', (#30));
#21=LwsQualifiedIdentifier(#16, .F., ''Sumsqr'', (#46));
#22=LwsQualifiedIdentifier(#29, .F., ''Y'', ());
#23=LwsReturnStatement(#44, (), #1);
#24=LwsFormalParameter(#15, (''X'', ''Y''), $, #43, $);
#25=LwsQualifiedIdentifier(#51, .F., ''X'', ());
#26=LwsUnitInterface(#42, #39, (#41));
#27=LwsDecimalLiteral(#53, .F., ''4'');
#28=LwsCompoundName(#39, (''Gnat'', ''Io''));
#29=LwsMultExpression(#1, .F., #22, #2);
#30=LwsArgumentsSelector(#20, #53);
#31=LwsSubtypeIndication(#33, #36, $);
#32=LwsQualifiedIdentifier(#11, .F., ''New_Line'', ());
#33=LwsObjectDeclaration(#4, (''I''), .F., .F., #31, $);
#34=LwsQualifiedIdentifier(#40, .F., ''Put'', (#38));
#35=LwsAggregate(#14, .F., (#18));
#36=LwsQualifiedIdentifier(#31, .F., ''Integer'', ());
#37=LwsQualifiedIdentifier(#41, .F., ''Gnat'', (#9));
#38=LwsArgumentsSelector(#34, #7);
#39=LwsWithClause(#26, (#28), (#28));
#40=LwsProcedureCall(#12, (), #34);
#41=LwsUseClause(#26, (#37), (#37));
#42=LwsUnit(#45, .F., (#26), #4);
#43=LwsQualifiedIdentifier(#24, .F., ''Integer'', ());
#44=LwsBlockBody(#19, (#23), ());
#45=LwsParsingResult($, (#42), $);
#46=LwsArgumentsSelector(#21, #6);
#47=LwsQualifiedIdentifier(#53, .F., ''I'', ());
#48=LwsProcedureCall(#12, (), #8);
#49=LwsCompoundName(#50, (''f1''));
#50=LwsProcedureDeclaration(#4, (), .F., #49);
#51=LwsMultExpression(#1, .F., #54, #25);
#52=LwsQualifiedIdentifier(#17, .F., ''Put'', (#14));
#53=LwsAggregate(#30, .F., (#47, #27));
#54=LwsQualifiedIdentifier(#51, .F., ''X'', ());
#55=LwsDecimalLiteral(#6, .F., ''3'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a05_simpleArrayExample [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsGreaterThanExpression(#48, .F., #59, #33);
#2=LwsParsingResult($, (#52), $);
#3=LwsSubprogramBody(#52, (#43, #25), #71, #57);
#4=LwsQualifiedIdentifier(#10, .F., ''Get'', (#44));
#5=LwsProcedureCall(#57, (), #49);
#6=LwsStringLiteral(#36, .F., ''> '');
#7=LwsArrayType(#43, (#54), #42);
#8=LwsUnitInterface(#52, #64, (#35));
#9=LwsQualifiedIdentifier(#30, .F., ''A'', ());
#10=LwsProcedureCall(#15, (), #4);
#11=LwsQualifiedIdentifier(#39, .F., ''I'', ());
#12=LwsQualifiedIdentifier(#32, .F., ''A'', (#41));
#13=LwsProcedureCall(#47, (), #58);
#14=LwsQualifiedIdentifier(#26, .F., ''Integer'', ());
#15=LwsLoopStatement(#57, (), $, #60, (#34, #10));
#16=LwsIfStatement(#47, (), (#48), $);
#17=LwsNamedAttribute(#33, ''First'');
#18=LwsProcedureCall(#48, (), #68);
#19=LwsAggregate(#31, .F., (#70));
#20=LwsCompoundName(#71, (''Arr1''));
#21=LwsQualifiedIdentifier(#29, .F., ''I'', ());
#22=LwsProcedureCall(#57, (), #23);
#23=LwsQualifiedIdentifier(#22, .F., ''Put'', (#61));
#24=LwsStringLiteral(#45, .F., ''['');
#25=LwsObjectDeclaration(#3, (''I''), .F., .F., #26, $);
#26=LwsSubtypeIndication(#25, #14, $);
#27=LwsAggregate(#38, .F., (#50));
#28=LwsCompoundName(#64, (''Gnat'', ''Io''));
#29=LwsAggregate(#41, .F., (#21));
#30=LwsNamedRange(#51, .F., #9, $);
#31=LwsArgumentsSelector(#58, #19);
#32=LwsAggregate(#44, .F., (#12));
#33=LwsQualifiedIdentifier(#1, .F., ''A'', (#17));
#34=LwsProcedureCall(#15, (), #67);
#35=LwsUseClause(#8, (#62), (#62));
#36=LwsAggregate(#46, .F., (#6));
#37=LwsDecimalLiteral(#54, .F., ''1'');
#38=LwsArgumentsSelector(#49, #27);
#39=LwsAggregate(#53, .F., (#11));
#40=LwsDecimalLiteral(#56, .F., ''1'');
#41=LwsArgumentsSelector(#12, #29);
#42=LwsComponentSubtype(#7, .F., #69);
#43=LwsObjectDeclaration(#3, (''A''), .F., .F., #7, $);
#44=LwsArgumentsSelector(#4, #32);
#45=LwsAggregate(#61, .F., (#24));
#46=LwsArgumentsSelector(#67, #36);
#47=LwsLoopStatement(#57, (), $, #51, (#13, #16));
#48=LwsIfClause(#16, #1, (#18));
#49=LwsQualifiedIdentifier(#5, .F., ''Put_Line'', (#38));
#50=LwsStringLiteral(#27, .F., '']'');
#51=LwsMembershipIteration(#47, ''I'', .T., #30);
#52=LwsUnit(#2, .F., (#8), #3);
#53=LwsArgumentsSelector(#70, #39);
#54=LwsExplicitRange(#7, .F., #37, #65);
#55=LwsQualifiedIdentifier(#69, .F., ''Integer'', ());
#56=LwsExplicitRange(#60, .F., #40, #66);
#57=LwsBlockBody(#3, (#15, #22, #47, #5), ());
#58=LwsQualifiedIdentifier(#13, .F., ''Put'', (#31));
#59=LwsQualifiedIdentifier(#1, .F., ''I'', ());
#60=LwsMembershipIteration(#15, ''I'', .F., #56);
#61=LwsArgumentsSelector(#23, #45);
#62=LwsQualifiedIdentifier(#35, .F., ''Gnat'', (#63));
#63=LwsNamedSelector(#62, ''Io'');
#64=LwsWithClause(#8, (#28), (#28));
#65=LwsDecimalLiteral(#54, .F., ''5'');
#66=LwsDecimalLiteral(#56, .F., ''5'');
#67=LwsQualifiedIdentifier(#34, .F., ''Put'', (#46));
#68=LwsQualifiedIdentifier(#18, .F., ''Put'', ());
#69=LwsSubtypeIndication(#42, #55, $);
#70=LwsQualifiedIdentifier(#19, .F., ''A'', (#53));
#71=LwsProcedureDeclaration(#3, (), .F., #20);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a06_larger1 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#130, .F., ''Put'', ());
#2=LwsUnitInterface(#79, #106, ());
#3=LwsSubtypeIndication(#25, #89, $);
#4=LwsIfStatement(#123, (), (#122), $);
#5=LwsDecimalLiteral(#65, .F., ''5'');
#6=LwsStringEnumerationId(#67, ''TUE'');
#7=LwsSubtypeDeclaration(#99, ''RED_BLUE'', #72);
#8=LwsDecimalLiteral(#127, .F., ''7'');
#9=LwsGreaterThanExpression(#44, .T., #21, #16);
#10=LwsStringEnumerationId(#67, ''FRI'');
#11=LwsCompoundName(#38, (''P2''));
#12=LwsProcedureCall(#74, (), #50);
#13=LwsNullLiteral(#24, .F., ''null'');
#14=LwsIfClause(#60, #48, (#27));
#15=LwsCompoundName(#80, (''Larger1''));
#16=LwsDecimalLiteral(#9, .F., ''4'');
#17=LwsStringEnumerationId(#67, ''WED'');
#18=LwsCompoundName(#75, (''Screen_Output''));
#19=LwsSubprogramBody(#99, (), #119, #109);
#20=LwsQualifiedIdentifier(#72, .F., ''RAINBOW'', ());
#21=LwsDecimalLiteral(#9, .F., ''15'');
#22=LwsCaseAlternative(#63, (#110), (#40));
#23=LwsQualifiedIdentifier(#105, .F., ''var1'', ());
#24=LwsEqualExpression(#90, .F., #95, #13);
#25=LwsObjectDeclaration(#99, (''I''), .F., .F., #3, $);
#26=LwsFunctionDeclaration(#111, (#133), .F., #82, #93);
#27=LwsProcedureCall(#14, (), #83);
#28=LwsLoopStatement(#123, (), $, $, (#132));
#29=LwsUnitInterface(#79, #30, ());
#30=LwsWithClause(#29, (#112), (#112));
#31=LwsWithClause(#64, (#47), (#47));
#32=LwsQualifiedIdentifier(#110, .F., ''B'', ());
#33=LwsExpressionChoice(#54, #128);
#34=LwsParsingResult($, (#79), $);
#35=LwsProcedureCall(#62, (), #39);
#36=LwsNullStatement(#90, ());
#37=LwsQualifiedIdentifier(#84, .F., ''Putline'', ());
#38=LwsProcedureDeclaration(#115, (), .F., #11);
#39=LwsQualifiedIdentifier(#35, .F., ''Put'', ());
#40=LwsProcedureCall(#22, (), #126);
#41=LwsNumberDeclaration(#99, (''MAX''), #98);
#42=LwsProcedureCall(#123, (), #69);
#43=LwsDecimalLiteral(#127, .F., ''6'');
#44=LwsOrExpression(#117, .F., #9, #46);
#45=LwsQualifiedIdentifier(#56, .F., ''INTEGER'', ());
#46=LwsLessThanExpression(#44, .T., #121, #87);
#47=LwsCompoundName(#31, (''Values''));
#48=LwsAndExpression(#14, .F., #53, #127);
#49=LwsCompoundName(#106, (''Stack''));
#50=LwsQualifiedIdentifier(#12, .F., ''Put'', ());
#51=LwsDecimalLiteral(#76, .F., ''5'');
#52=LwsQualifiedIdentifier(#132, .F., ''Putline'', ());
#53=LwsEqualExpression(#48, .T., #131, #125);
#54=LwsCaseAlternative(#63, (#33), (#103));
#55=LwsQualifiedIdentifier(#103, .F., ''Putline'', ());
#56=LwsSubtypeIndication(#97, #45, #108);
#57=LwsCompoundName(#119, (''P1''));
#58=LwsQualifiedIdentifier(#133, .F., ''INTEGER'', ());
#59=LwsQualifiedIdentifier(#101, .F., ''Putline'', ());
#60=LwsIfStatement(#123, (), (#14), $);
#61=LwsBlockBody(#111, (#130), ());
#62=LwsBlockBody(#115, (#35), ());
#63=LwsCaseStatement(#123, (), #73, (#54, #22));
#64=LwsUnitInterface(#79, #31, ());
#65=LwsEqualExpression(#122, .F., #78, #5);
#66=LwsCompoundName(#124, (''P3''));
#67=LwsEnumerationType(#77, (#96, #6, #17, #129, #10, #118, #94));
#68=LwsQualifiedIdentifier(#70, .F., ''A'', ());
#69=LwsQualifiedIdentifier(#42, .F., ''Putline'', ());
#70=LwsReturnStatement(#123, (), #68);
#71=LwsIfStatement(#123, (), (#90), $);
#72=LwsSubtypeIndication(#7, #20, $);
#73=LwsQualifiedIdentifier(#63, .F., ''aCase'', ());
#74=LwsBlockBody(#91, (#12), ());
#75=LwsWithClause(#107, (#18), (#18));
#76=LwsEqualExpression(#117, .T., #88, #51);
#77=LwsFullTypeDeclaration(#99, ''DAY'', $, #67);
#78=LwsDecimalLiteral(#65, .F., ''4'');
#79=LwsUnit(#34, .F., (#29, #107, #2, #64), #99);
#80=LwsProcedureDeclaration(#99, (), .F., #15);
#81=LwsProcedureCall(#109, (), #85);
#82=LwsCompoundName(#26, (''F1''));
#83=LwsQualifiedIdentifier(#27, .F., ''Putline'', ());
#84=LwsProcedureCall(#114, (), #37);
#85=LwsQualifiedIdentifier(#81, .F., ''Put'', ());
#86=LwsDecimalLiteral(#120, .F., ''5'');
#87=LwsDecimalLiteral(#46, .F., ''3'');
#88=LwsDecimalLiteral(#76, .F., ''5'');
#89=LwsQualifiedIdentifier(#3, .F., ''Integer'', ());
#90=LwsIfClause(#71, #24, (#36));
#91=LwsSubprogramBody(#99, (), #124, #74);
#92=LwsQualifiedIdentifier(#104, .F., ''var2'', ());
#93=LwsQualifiedIdentifier(#26, .F., ''BOOLEAN'', ());
#94=LwsStringEnumerationId(#67, ''SUN'');
#95=LwsNullLiteral(#24, .F., ''null'');
#96=LwsStringEnumerationId(#67, ''MON'');
#97=LwsSubtypeDeclaration(#99, ''SMALL_INT'', #56);
#98=LwsDecimalLiteral(#41, .F., ''5'');
#99=LwsSubprogramBody(#79, (#25, #41, #77, #7, #97, #19, #115, #91, #111), #80, #123);
#100=LwsDecimalLiteral(#104, .F., ''4'');
#101=LwsProcedureCall(#122, (), #59);
#102=LwsWhileIteration(#114, #117);
#103=LwsProcedureCall(#54, (), #55);
#104=LwsAndExpression(#105, .F., #92, #100);
#105=LwsAssignment(#123, (), #23, #104);
#106=LwsWithClause(#2, (#49), (#49));
#107=LwsUnitInterface(#79, #75, ());
#108=LwsRangeConstraint(#56, #120);
#109=LwsBlockBody(#19, (#81), ());
#110=LwsExpressionChoice(#22, #32);
#111=LwsSubprogramBody(#99, (), #26, #61);
#112=LwsCompoundName(#30, (''Except''));
#113=LwsNullStatement(#123, ());
#114=LwsLoopStatement(#123, (), $, #102, (#84));
#115=LwsSubprogramBody(#99, (), #38, #62);
#116=LwsDecimalLiteral(#120, .F., ''10'');
#117=LwsOrExpression(#102, .F., #44, #76);
#118=LwsStringEnumerationId(#67, ''SAT'');
#119=LwsProcedureDeclaration(#19, (), .F., #57);
#120=LwsExplicitRange(#108, .F., #86, #116);
#121=LwsDecimalLiteral(#46, .F., ''4'');
#122=LwsIfClause(#4, #65, (#101));
#123=LwsBlockBody(#99, (#113, #105, #42, #71, #4, #60, #114, #63, #28, #70), ());
#124=LwsProcedureDeclaration(#91, (), .F., #66);
#125=LwsDecimalLiteral(#53, .F., ''5'');
#126=LwsQualifiedIdentifier(#40, .F., ''Putline'', ());
#127=LwsGreaterThanExpression(#48, .T., #43, #8);
#128=LwsQualifiedIdentifier(#33, .F., ''A'', ());
#129=LwsStringEnumerationId(#67, ''THU'');
#130=LwsProcedureCall(#61, (), #1);
#131=LwsDecimalLiteral(#53, .F., ''4'');
#132=LwsProcedureCall(#28, (), #52);
#133=LwsFormalParameter(#26, (''X''), .inputOutputMode., #58, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a07_larger2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#126, .F., ''A'', ());
#2=LwsLoopStatement(#36, (), $, #87, (#104));
#3=LwsLessThanExpression(#154, .T., #30, #121);
#4=LwsQualifiedIdentifier(#73, .F., ''A'', ());
#5=LwsQualifiedIdentifier(#53, .F., ''Put'', ());
#6=LwsNullLiteral(#43, .F., ''null'');
#7=LwsReturnStatement(#105, (), #136);
#8=LwsQualifiedIdentifier(#44, .F., ''C'', ());
#9=LwsEnumerationType(#57, (#52, #133, #62, #167, #106, #38, #40));
#10=LwsEqualExpression(#14, .F., #174, #100);
#11=LwsMultExpression(#60, .F., #35, #156);
#12=LwsExpoExpression(#79, .F., #51, #19);
#13=LwsQualifiedIdentifier(#58, .F., ''B'', ());
#14=LwsIfClause(#157, #10, (#82));
#15=LwsLoopStatement(#36, (), $, $, (#55));
#16=LwsAndExpression(#102, .F., #39, #54);
#17=LwsQualifiedIdentifier(#24, .F., ''Put'', ());
#18=LwsAssignment(#36, (), #98, #170);
#19=LwsDecimalLiteral(#12, .F., ''2'');
#20=LwsIfStatement(#36, (), (#102), $);
#21=LwsQualifiedIdentifier(#68, .F., ''Put'', ());
#22=LwsQualifiedIdentifier(#89, .F., ''A'', ());
#23=LwsBlockBody(#37, (#53), ());
#24=LwsProcedureCall(#105, (), #17);
#25=LwsMinusExpression(#126, .F., #92, #172);
#26=LwsCaseAlternative(#107, (#58), (#77));
#27=LwsProcedureDeclaration(#70, (), .F., #66);
#28=LwsUnitInterface(#99, #80, ());
#29=LwsCompoundName(#32, (''Values''));
#30=LwsDecimalLiteral(#3, .F., ''4'');
#31=LwsOrExpression(#87, .F., #154, #103);
#32=LwsWithClause(#160, (#29), (#29));
#33=LwsDecimalLiteral(#170, .F., ''4'');
#34=LwsUseClause(#124, (#90), (#90));
#35=LwsQualifiedIdentifier(#11, .F., ''A'', ());
#36=LwsBlockBody(#70, (#161, #18, #67, #119, #47, #145, #153, #157, #20, #2, #107, #15, #130), ());
#37=LwsSubprogramBody(#70, (), #135, #23);
#38=LwsStringEnumerationId(#9, ''SAT'');
#39=LwsEqualExpression(#16, .T., #84, #41);
#40=LwsStringEnumerationId(#9, ''SUN'');
#41=LwsDecimalLiteral(#39, .F., ''5'');
#42=LwsCaseAlternative(#107, (#159), (#88));
#43=LwsEqualExpression(#76, .F., #163, #6);
#44=LwsMultExpression(#79, .F., #97, #8);
#45=LwsProcedureDeclaration(#165, (), .F., #85);
#46=LwsExplicitRange(#50, .F., #109, #74);
#47=LwsProcedureCall(#36, (), #158);
#48=LwsCompoundName(#128, (''TEXT_IO''));
#49=LwsFormalParameter(#117, (''X''), .inputOutputMode., #141, $);
#50=LwsRangeConstraint(#149, #46);
#51=LwsQualifiedIdentifier(#12, .F., ''B'', ());
#52=LwsStringEnumerationId(#9, ''MON'');
#53=LwsProcedureCall(#23, (), #5);
#54=LwsGreaterThanExpression(#16, .T., #175, #152);
#55=LwsProcedureCall(#15, (), #122);
#56=LwsQualifiedIdentifier(#89, .F., ''B'', ());
#57=LwsFullTypeDeclaration(#70, ''DAY'', $, #9);
#58=LwsExpressionChoice(#26, #13);
#59=LwsQualifiedIdentifier(#130, .F., ''a'', ());
#60=LwsAssignment(#105, (), #125, #11);
#61=LwsProcedureCall(#102, (), #132);
#62=LwsStringEnumerationId(#9, ''WED'');
#63=LwsDecimalLiteral(#138, .F., ''4'');
#64=LwsNumberDeclaration(#70, (''MAX''), #96);
#65=LwsQualifiedIdentifier(#97, .F., ''A'', ());
#66=LwsCompoundName(#27, (''Larger2''));
#67=LwsAssignment(#36, (), #142, #79);
#68=LwsProcedureCall(#114, (), #21);
#69=LwsCompoundName(#117, (''F1''));
#70=LwsSubprogramBody(#99, (#137, #64, #57, #78, #115, #131, #37, #165, #151), #27, #36);
#71=LwsQualifiedIdentifier(#117, .F., ''BOOLEAN'', ());
#72=LwsAggregate(#150, .F., (#73));
#73=LwsMultExpression(#72, .F., #4, #86);
#74=LwsDecimalLiteral(#46, .F., ''10'');
#75=LwsParsingResult($, (#99), $);
#76=LwsIfClause(#153, #43, (#147));
#77=LwsProcedureCall(#26, (), #134);
#78=LwsSubtypeDeclaration(#70, ''RED_BLUE'', #113);
#79=LwsMinusExpression(#67, .F., #12, #44);
#80=LwsWithClause(#28, (#168), (#168));
#81=LwsUnitInterface(#99, #127, ());
#82=LwsProcedureCall(#14, (), #146);
#83=LwsSubtypeIndication(#137, #140, $);
#84=LwsDecimalLiteral(#39, .F., ''4'');
#85=LwsCompoundName(#45, (''P3''));
#86=LwsQualifiedIdentifier(#73, .F., ''B'', ());
#87=LwsWhileIteration(#2, #31);
#88=LwsProcedureCall(#42, (), #164);
#89=LwsAggregate(#166, .F., (#22, #56));
#90=LwsQualifiedIdentifier(#34, .F., ''REAL_OPERATIONS'', ());
#91=LwsQualifiedIdentifier(#143, .F., ''Put'', ());
#92=LwsQualifiedIdentifier(#25, .F., ''A'', ());
#93=LwsQualifiedIdentifier(#145, .F., ''Putline'', (#150));
#94=LwsQualifiedIdentifier(#104, .F., ''Putline'', ());
#95=LwsDecimalLiteral(#103, .F., ''5'');
#96=LwsDecimalLiteral(#64, .F., ''5'');
#97=LwsMultExpression(#44, .F., #101, #65);
#98=LwsQualifiedIdentifier(#18, .F., ''var1'', ());
#99=LwsUnit(#75, .F., (#28, #81, #123, #160, #124), #70);
#100=LwsDecimalLiteral(#10, .F., ''5'');
#101=LwsDecimalLiteral(#97, .F., ''4'');
#102=LwsIfClause(#20, #16, (#61));
#103=LwsEqualExpression(#31, .T., #144, #95);
#104=LwsProcedureCall(#2, (), #94);
#105=LwsBlockBody(#151, (#24, #60, #126, #7), ());
#106=LwsStringEnumerationId(#9, ''FRI'');
#107=LwsCaseStatement(#36, (), #108, (#42, #26));
#108=LwsQualifiedIdentifier(#107, .F., ''aCase'', ());
#109=LwsDecimalLiteral(#46, .F., ''5'');
#110=LwsQualifiedIdentifier(#149, .F., ''INTEGER'', ());
#111=LwsDecimalLiteral(#138, .F., ''15'');
#112=LwsCompoundName(#127, (''Screen_Output''));
#113=LwsSubtypeIndication(#78, #162, $);
#114=LwsBlockBody(#165, (#68), ());
#115=LwsSubtypeDeclaration(#70, ''SMALL_INT'', #149);
#116=LwsBlockBody(#131, (#143), ());
#117=LwsFunctionDeclaration(#151, (#49), .F., #69, #71);
#118=LwsProcedureDeclaration(#131, (), .F., #155);
#119=LwsProcedureCall(#36, (), #171);
#120=LwsQualifiedIdentifier(#159, .F., ''A'', ());
#121=LwsDecimalLiteral(#3, .F., ''3'');
#122=LwsQualifiedIdentifier(#55, .F., ''Putline'', ());
#123=LwsUnitInterface(#99, #148, ());
#124=LwsUnitInterface(#99, #128, (#34));
#125=LwsQualifiedIdentifier(#60, .F., ''A'', ());
#126=LwsAssignment(#105, (), #1, #25);
#127=LwsWithClause(#81, (#112), (#112));
#128=LwsWithClause(#124, (#48, #129), (#48, #129));
#129=LwsCompoundName(#128, (''REAL_OPERATIONS''));
#130=LwsReturnStatement(#36, (), #59);
#131=LwsSubprogramBody(#70, (), #118, #116);
#132=LwsQualifiedIdentifier(#61, .F., ''Putline'', ());
#133=LwsStringEnumerationId(#9, ''TUE'');
#134=LwsQualifiedIdentifier(#77, .F., ''Putline'', ());
#135=LwsProcedureDeclaration(#37, (), .F., #169);
#136=LwsQualifiedIdentifier(#7, .F., ''A'', ());
#137=LwsObjectDeclaration(#70, (''A''), .F., .F., #83, $);
#138=LwsGreaterThanExpression(#154, .T., #111, #63);
#139=LwsCompoundName(#148, (''Stack''));
#140=LwsQualifiedIdentifier(#83, .F., ''Integer'', ());
#141=LwsQualifiedIdentifier(#49, .F., ''INTEGER'', ());
#142=LwsQualifiedIdentifier(#67, .F., ''D'', ());
#143=LwsProcedureCall(#116, (), #91);
#144=LwsDecimalLiteral(#103, .F., ''5'');
#145=LwsProcedureCall(#36, (), #93);
#146=LwsQualifiedIdentifier(#82, .F., ''Putline'', ());
#147=LwsNullStatement(#76, ());
#148=LwsWithClause(#123, (#139), (#139));
#149=LwsSubtypeIndication(#115, #110, #50);
#150=LwsArgumentsSelector(#93, #72);
#151=LwsSubprogramBody(#70, (), #117, #105);
#152=LwsDecimalLiteral(#54, .F., ''7'');
#153=LwsIfStatement(#36, (), (#76), $);
#154=LwsOrExpression(#31, .F., #138, #3);
#155=LwsCompoundName(#118, (''P1''));
#156=LwsQualifiedIdentifier(#11, .F., ''A'', ());
#157=LwsIfStatement(#36, (), (#14), $);
#158=LwsQualifiedIdentifier(#47, .F., ''Putline'', (#166));
#159=LwsExpressionChoice(#42, #120);
#160=LwsUnitInterface(#99, #32, ());
#161=LwsNullStatement(#36, ());
#162=LwsQualifiedIdentifier(#113, .F., ''RAINBOW'', ());
#163=LwsNullLiteral(#43, .F., ''null'');
#164=LwsQualifiedIdentifier(#88, .F., ''Putline'', ());
#165=LwsSubprogramBody(#70, (), #45, #114);
#166=LwsArgumentsSelector(#158, #89);
#167=LwsStringEnumerationId(#9, ''THU'');
#168=LwsCompoundName(#80, (''Except''));
#169=LwsCompoundName(#135, (''P2''));
#170=LwsAndExpression(#18, .F., #173, #33);
#171=LwsQualifiedIdentifier(#119, .F., ''Putline'', ());
#172=LwsQualifiedIdentifier(#25, .F., ''MAX'', ());
#173=LwsQualifiedIdentifier(#170, .F., ''var2'', ());
#174=LwsDecimalLiteral(#10, .F., ''4'');
#175=LwsDecimalLiteral(#54, .F., ''6'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a08_calculator [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsObjectDeclaration(#14, (''In_Val''), .F., .F., #60, $);
#2=LwsQualifiedIdentifier(#19, .F., ''In_Val'', ());
#3=LwsCaseStatement(#76, (), #103, (#62, #34, #92, #75, #13, #16, #77, #91));
#4=LwsProcedureCall(#77, (), #25);
#5=LwsQualifiedIdentifier(#73, .F., ''Disp'', ());
#6=LwsQualifiedIdentifier(#51, .F., ''Disp'', ());
#7=LwsAssignment(#16, (), #111, #116);
#8=LwsArgumentsSelector(#122, #93);
#9=LwsMultExpression(#31, .F., #22, #41);
#10=LwsQualifiedIdentifier(#108, .F., ''Disp'', ());
#11=LwsQualifiedIdentifier(#59, .F., ''Integer'', ());
#12=LwsQualifiedIdentifier(#60, .F., ''Integer'', ());
#13=LwsCaseAlternative(#3, (#54), (#96));
#14=LwsSubprogramBody(#117, (#50, #32, #1), #100, #23);
#15=LwsProcedureCall(#76, (), #99);
#16=LwsCaseAlternative(#3, (#109), (#7));
#17=LwsProcedureCall(#91, (), #122);
#18=LwsQualifiedIdentifier(#72, .F., ''In_Val'', ());
#19=LwsAssignment(#62, (), #87, #2);
#20=LwsCompoundName(#49, (''Gnat'', ''Io''));
#21=LwsQualifiedIdentifier(#26, .F., ''Gnat'', (#42));
#22=LwsQualifiedIdentifier(#9, .F., ''Disp'', ());
#23=LwsBlockBody(#14, (#76), ());
#24=LwsAssignment(#34, (), #90, #108);
#25=LwsQualifiedIdentifier(#4, .F., ''Put_Line'', (#28));
#26=LwsUseClause(#38, (#21), (#21));
#27=LwsProcedureCall(#76, (), #63);
#28=LwsArgumentsSelector(#25, #71);
#29=LwsQualifiedIdentifier(#118, .F., ''Op'', ());
#30=LwsQualifiedIdentifier(#80, .F., ''Op'', ());
#31=LwsAssignment(#75, (), #67, #9);
#32=LwsObjectDeclaration(#14, (''Disp''), .F., .F., #59, #105);
#33=LwsStringLiteral(#35, .F., ''> '');
#34=LwsCaseAlternative(#3, (#36), (#24));
#35=LwsAggregate(#115, .F., (#33));
#36=LwsExpressionChoice(#34, #37);
#37=LwsStringLiteral(#36, .F., ''+'');
#38=LwsUnitInterface(#117, #49, (#26));
#39=LwsQualifiedIdentifier(#83, .F., ''Text_IO'', (#114));
#40=LwsQualifiedIdentifier(#57, .F., ''Get'', (#47));
#41=LwsQualifiedIdentifier(#9, .F., ''In_Val'', ());
#42=LwsNamedSelector(#21, ''Io'');
#43=LwsUnitInterface(#117, #48, ());
#44=LwsStringLiteral(#45, .F., ''-'');
#45=LwsExpressionChoice(#92, #44);
#46=LwsMinusExpression(#51, .F., #94, #95);
#47=LwsArgumentsSelector(#40, #118);
#48=LwsWithClause(#43, (#104), (#104));
#49=LwsWithClause(#38, (#20), (#20));
#50=LwsObjectDeclaration(#14, (''Op''), .F., .F., #78, $);
#51=LwsAssignment(#92, (), #6, #46);
#52=LwsStringLiteral(#112, .F., ''9'');
#53=LwsStringLiteral(#54, .F., ''/'');
#54=LwsExpressionChoice(#13, #53);
#55=LwsQualifiedIdentifier(#96, .F., ''Disp'', ());
#56=LwsAggregate(#102, .F., (#120));
#57=LwsProcedureCall(#65, (), #40);
#58=LwsProcedureCall(#76, (), #97);
#59=LwsSubtypeIndication(#32, #11, $);
#60=LwsSubtypeIndication(#1, #12, $);
#61=LwsQualifiedIdentifier(#116, .F., ''In_Val'', ());
#62=LwsCaseAlternative(#3, (#84), (#19));
#63=LwsQualifiedIdentifier(#27, .F., ''Put'', (#115));
#64=LwsParsingResult($, (#117), $);
#65=LwsLoopStatement(#76, (), $, $, (#57, #119));
#66=LwsExpressionChoice(#75, #98);
#67=LwsQualifiedIdentifier(#31, .F., ''Disp'', ());
#68=LwsOtherChoice(#91);
#69=LwsQualifiedIdentifier(#78, .F., ''Character'', ());
#70=LwsStringLiteral(#71, .F., ''Please specify an operation.'');
#71=LwsAggregate(#28, .F., (#70));
#72=LwsAggregate(#121, .F., (#18));
#73=LwsDivExpression(#96, .F., #5, #113);
#74=LwsProcedureCall(#76, (), #88);
#75=LwsCaseAlternative(#3, (#66), (#31));
#76=LwsLoopStatement(#23, (), $, $, (#58, #15, #27, #65, #85, #74, #83, #3));
#77=LwsCaseAlternative(#3, (#79), (#4));
#78=LwsSubtypeIndication(#50, #69, $);
#79=LwsRangeChoice(#77, #112);
#80=LwsCatenationExpression(#123, .F., #82, #30);
#81=LwsQualifiedIdentifier(#116, .F., ''Disp'', ());
#82=LwsStringLiteral(#80, .F., ''What is '');
#83=LwsProcedureCall(#76, (), #39);
#84=LwsExpressionChoice(#62, #86);
#85=LwsExitStatement(#76, (), $, $);
#86=LwsStringLiteral(#84, .F., ''='');
#87=LwsQualifiedIdentifier(#19, .F., ''Disp'', ());
#88=LwsQualifiedIdentifier(#74, .F., ''Get'', (#121));
#89=LwsStringLiteral(#112, .F., ''0'');
#90=LwsQualifiedIdentifier(#24, .F., ''Disp'', ());
#91=LwsCaseAlternative(#3, (#68), (#17));
#92=LwsCaseAlternative(#3, (#45), (#51));
#93=LwsAggregate(#8, .F., (#123));
#94=LwsQualifiedIdentifier(#46, .F., ''Disp'', ());
#95=LwsQualifiedIdentifier(#46, .F., ''In_Val'', ());
#96=LwsAssignment(#13, (), #55, #73);
#97=LwsQualifiedIdentifier(#58, .F., ''Put'', (#102));
#98=LwsStringLiteral(#66, .F., ''*'');
#99=LwsQualifiedIdentifier(#15, .F., ''New_Line'', ());
#100=LwsProcedureDeclaration(#14, (), .F., #106);
#101=LwsStringLiteral(#123, .F., ''?'');
#102=LwsArgumentsSelector(#97, #56);
#103=LwsQualifiedIdentifier(#3, .F., ''Op'', ());
#104=LwsCompoundName(#48, (''Text_IO''));
#105=LwsDecimalLiteral(#32, .F., ''0'');
#106=LwsCompoundName(#100, (''Calc''));
#107=LwsStringLiteral(#109, .F., ''^'');
#108=LwsPlusExpression(#24, .F., #10, #110);
#109=LwsExpressionChoice(#16, #107);
#110=LwsQualifiedIdentifier(#108, .F., ''In_Val'', ());
#111=LwsQualifiedIdentifier(#7, .F., ''Disp'', ());
#112=LwsExplicitRange(#79, .F., #89, #52);
#113=LwsQualifiedIdentifier(#73, .F., ''In_Val'', ());
#114=LwsNamedSelector(#39, ''Skip_Line'');
#115=LwsArgumentsSelector(#63, #35);
#116=LwsExpoExpression(#7, .F., #81, #61);
#117=LwsUnit(#64, .F., (#43, #38), #14);
#118=LwsAggregate(#47, .F., (#29));
#119=LwsExitStatement(#65, (), $, $);
#120=LwsQualifiedIdentifier(#56, .F., ''Disp'', ());
#121=LwsArgumentsSelector(#88, #72);
#122=LwsQualifiedIdentifier(#17, .F., ''Put_Line'', (#8));
#123=LwsCatenationExpression(#93, .F., #80, #101);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a09_quadratic_equation [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#5, .F., ''REAL_FUNCTIONS'', ());
#2=LwsMinusExpression(#88, .F., #86, #78);
#3=LwsQualifiedIdentifier(#20, .F., ''REAL'', ());
#4=LwsIfClause(#94, #16, (#32));
#5=LwsUseClause(#50, (#17, #79, #1), (#17, #79, #1));
#6=LwsArgumentsSelector(#37, #10);
#7=LwsQualifiedIdentifier(#88, .F., ''D'', ());
#8=LwsDecimalLiteral(#16, .F., ''0'');
#9=LwsMultExpression(#39, .T., #68, #26);
#10=LwsAggregate(#6, .F., (#73));
#11=LwsProcedureCall(#12, (), #85);
#12=LwsBlockBody(#50, (#21, #28, #62, #88, #94, #11), ());
#13=LwsUseClause(#25, (#38), (#38));
#14=LwsArgumentsSelector(#84, #18);
#15=LwsQualifiedIdentifier(#60, .F., ''B'', ());
#16=LwsLessThanExpression(#4, .F., #35, #8);
#17=LwsQualifiedIdentifier(#5, .F., ''REAL_IO'', ());
#18=LwsAggregate(#14, .F., (#58));
#19=LwsQualifiedIdentifier(#66, .F., ''B'', ());
#20=LwsSubtypeIndication(#23, #3, $);
#21=LwsProcedureCall(#12, (), #44);
#22=LwsQualifiedIdentifier(#64, .F., ''C'', ());
#23=LwsObjectDeclaration(#50, (''A'', ''B'', ''C'', ''D''), .F., .F., #20, $);
#24=LwsDecimalLiteral(#77, .F., ''2'');
#25=LwsUnitInterface(#63, #75, (#13));
#26=LwsQualifiedIdentifier(#9, .F., ''A'', ());
#27=LwsCompoundName(#97, (''QUADRATIC_EQUATION''));
#28=LwsProcedureCall(#12, (), #42);
#29=LwsQualifiedIdentifier(#34, .F., ''B'', ());
#30=LwsArgumentsSelector(#42, #34);
#31=LwsQualifiedIdentifier(#76, .F., ''A'', ());
#32=LwsProcedureCall(#4, (), #36);
#33=LwsQualifiedIdentifier(#62, .F., ''GET'', (#56));
#34=LwsAggregate(#30, .F., (#29));
#35=LwsQualifiedIdentifier(#16, .F., ''D'', ());
#36=LwsQualifiedIdentifier(#32, .F., ''PUT'', (#45));
#37=LwsQualifiedIdentifier(#82, .F., ''SQRT'', (#6));
#38=LwsQualifiedIdentifier(#13, .F., ''REAL_OPERATIONS'', ());
#39=LwsDivExpression(#52, .F., #82, #9);
#40=LwsQualifiedIdentifier(#57, .F., ''PUT'', (#47));
#41=LwsArgumentsSelector(#59, #48);
#42=LwsQualifiedIdentifier(#28, .F., ''GET'', (#30));
#43=LwsArgumentsSelector(#90, #52);
#44=LwsQualifiedIdentifier(#21, .F., ''GET'', (#71));
#45=LwsArgumentsSelector(#36, #51);
#46=LwsMinusExpression(#58, .T., #60, #80);
#47=LwsArgumentsSelector(#40, #53);
#48=LwsAggregate(#41, .F., (#67));
#49=LwsProcedureCall(#94, (), #59);
#50=LwsSubprogramBody(#63, (#23, #5), #97, #12);
#51=LwsAggregate(#45, .F., (#72));
#52=LwsAggregate(#43, .F., (#39));
#53=LwsAggregate(#47, .F., (#74));
#54=LwsParsingResult($, (#63), $);
#55=LwsQualifiedIdentifier(#86, .F., ''B'', ());
#56=LwsArgumentsSelector(#33, #64);
#57=LwsProcedureCall(#94, (), #40);
#58=LwsDivExpression(#18, .F., #46, #77);
#59=LwsQualifiedIdentifier(#49, .F., ''PUT'', (#41));
#60=LwsNegativeExpression(#46, .F., #15);
#61=LwsQualifiedIdentifier(#87, .F., ''D'', ());
#62=LwsProcedureCall(#12, (), #33);
#63=LwsUnit(#54, .F., (#25), #50);
#64=LwsAggregate(#56, .F., (#22));
#65=LwsQualifiedIdentifier(#91, .F., ''A'', ());
#66=LwsNegativeExpression(#82, .F., #19);
#67=LwsStringLiteral(#48, .F., '' X2 = '');
#68=LwsDecimalLiteral(#9, .F., ''2'');
#69=LwsCompoundName(#75, (''REAL_OPERATIONS''));
#70=LwsProcedureCall(#94, (), #84);
#71=LwsArgumentsSelector(#44, #76);
#72=LwsStringLiteral(#51, .F., ''Imaginary Roots.'');
#73=LwsQualifiedIdentifier(#10, .F., ''D'', ());
#74=LwsStringLiteral(#53, .F., ''Real Roots : X1 = '');
#75=LwsWithClause(#25, (#81, #69), (#81, #69));
#76=LwsAggregate(#71, .F., (#31));
#77=LwsMultExpression(#58, .T., #24, #95);
#78=LwsMultExpression(#2, .F., #91, #96);
#79=LwsQualifiedIdentifier(#5, .F., ''TEXT_IO'', ());
#80=LwsQualifiedIdentifier(#46, .F., ''SQRT'', (#83));
#81=LwsCompoundName(#75, (''TEXT_IO''));
#82=LwsPlusExpression(#39, .T., #66, #37);
#83=LwsArgumentsSelector(#80, #87);
#84=LwsQualifiedIdentifier(#70, .F., ''PUT'', (#14));
#85=LwsQualifiedIdentifier(#11, .F., ''NEW_LINE'', ());
#86=LwsExpoExpression(#2, .F., #55, #92);
#87=LwsAggregate(#83, .F., (#61));
#88=LwsAssignment(#12, (), #7, #2);
#89=LwsProcedureCall(#94, (), #90);
#90=LwsQualifiedIdentifier(#89, .F., ''PUT'', (#43));
#91=LwsMultExpression(#78, .F., #93, #65);
#92=LwsDecimalLiteral(#86, .F., ''2'');
#93=LwsDecimalLiteral(#91, .F., ''4'');
#94=LwsIfStatement(#12, (), (#4), (#57, #70, #49, #89));
#95=LwsQualifiedIdentifier(#77, .F., ''A'', ());
#96=LwsQualifiedIdentifier(#78, .F., ''C'', ());
#97=LwsProcedureDeclaration(#50, (), .F., #27);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a10_numericConstantsAndExpressions [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsProcedureCall(#72, (), #29);
#2=LwsProcedureCall(#72, (), #56);
#3=LwsQualifiedIdentifier(#21, .F., ''Mike'', ());
#4=LwsQualifiedIdentifier(#13, .F., ''John_Smith'', ());
#5=LwsStringLiteral(#78, .F., ''3*Mike + 2*Alice + 11 is '');
#6=LwsQualifiedIdentifier(#99, .F., ''John_Smith'', ());
#7=LwsQualifiedIdentifier(#30, .F., ''Get'', (#93));
#8=LwsProcedureCall(#72, (), #46);
#9=LwsQualifiedIdentifier(#82, .F., ''New_Line'', ());
#10=LwsQualifiedIdentifier(#100, .F., ''F'', ());
#11=LwsDecimalLiteral(#32, .F., ''2'');
#12=LwsArgumentsSelector(#58, #18);
#13=LwsAssignment(#72, (), #4, #36);
#14=LwsProcedureCall(#72, (), #63);
#15=LwsQualifiedIdentifier(#38, .F., ''Float'', ());
#16=LwsQualifiedIdentifier(#43, .F., ''John_Smith'', ());
#17=LwsQualifiedIdentifier(#96, .F., ''Mike'', ());
#18=LwsAggregate(#12, .F., (#90));
#19=LwsArgumentsSelector(#34, #25);
#20=LwsPlusExpression(#99, .F., #21, #83);
#21=LwsPlusExpression(#20, .F., #3, #85);
#22=LwsObjectDeclaration(#61, (''F''), .F., .F., #38, #70);
#23=LwsProcedureCall(#72, (), #94);
#24=LwsProcedureCall(#72, (), #40);
#25=LwsAggregate(#19, .F., (#66));
#26=LwsArgumentsSelector(#66, #27);
#27=LwsAggregate(#26, .F., (#35));
#28=LwsDecimalLiteral(#65, .F., ''3.14159_265'');
#29=LwsQualifiedIdentifier(#1, .F., ''New_Line'', ());
#30=LwsProcedureCall(#72, (), #7);
#31=LwsQualifiedIdentifier(#50, .F., ''Alice'', ());
#32=LwsMultExpression(#57, .F., #11, #47);
#33=LwsArgumentsSelector(#76, #78);
#34=LwsQualifiedIdentifier(#89, .F., ''Put'', (#19));
#35=LwsQualifiedIdentifier(#27, .F., ''F'', ());
#36=LwsPlusExpression(#13, .F., #57, #98);
#37=LwsQualifiedIdentifier(#45, .F., ''Put'', (#55));
#38=LwsSubtypeIndication(#22, #15, $);
#39=LwsStringLiteral(#59, .F., ''Enter a number Mike: '');
#40=LwsQualifiedIdentifier(#24, .F., ''Get'', (#102));
#41=LwsArgumentsSelector(#46, #43);
#42=LwsQualifiedIdentifier(#53, .F., ''Float'', (#79));
#43=LwsAggregate(#41, .F., (#16));
#44=LwsObjectDeclaration(#61, (''Mike'', ''Alice''), .F., .F., #74, $);
#45=LwsProcedureCall(#72, (), #37);
#46=LwsQualifiedIdentifier(#8, .F., ''Put'', (#41));
#47=LwsQualifiedIdentifier(#32, .F., ''Alice'', ());
#48=LwsSubtypeIndication(#75, #84, $);
#49=LwsMultExpression(#57, .F., #52, #69);
#50=LwsAggregate(#102, .F., (#31));
#51=LwsStringLiteral(#77, .F., ''Enter a number Alice: '');
#52=LwsDecimalLiteral(#49, .F., ''3'');
#53=LwsPlusExpression(#65, .F., #71, #42);
#54=LwsQualifiedIdentifier(#74, .F., ''Integer'', ());
#55=LwsArgumentsSelector(#37, #59);
#56=LwsQualifiedIdentifier(#2, .F., ''Put'', (#73));
#57=LwsPlusExpression(#36, .F., #49, #32);
#58=LwsQualifiedIdentifier(#101, .F., ''Put'', (#12));
#59=LwsAggregate(#55, .F., (#39));
#60=LwsProcedureCall(#72, (), #92);
#61=LwsSubprogramBody(#95, (#44, #75, #22), #67, #72);
#62=LwsProcedureCall(#72, (), #76);
#63=LwsQualifiedIdentifier(#14, .F., ''Put'', (#81));
#64=LwsStringLiteral(#87, .F., ''A million more than Mike and Alice '');
#65=LwsPlusExpression(#100, .F., #53, #28);
#66=LwsQualifiedIdentifier(#25, .F., ''Integer'', (#26));
#67=LwsProcedureDeclaration(#61, (), .F., #97);
#68=LwsQualifiedIdentifier(#91, .F., ''John_Smith'', ());
#69=LwsQualifiedIdentifier(#49, .F., ''Mike'', ());
#70=LwsDecimalLiteral(#22, .F., ''1.0'');
#71=LwsQualifiedIdentifier(#53, .F., ''F'', ());
#72=LwsBlockBody(#61, (#45, #30, #2, #24, #13, #62, #60, #23, #99, #14, #8, #82, #100, #101, #89, #1), ());
#73=LwsArgumentsSelector(#56, #77);
#74=LwsSubtypeIndication(#44, #54, $);
#75=LwsObjectDeclaration(#61, (''John_Smith''), .F., .F., #48, $);
#76=LwsQualifiedIdentifier(#62, .F., ''Put'', (#33));
#77=LwsAggregate(#73, .F., (#51));
#78=LwsAggregate(#33, .F., (#5));
#79=LwsArgumentsSelector(#42, #80);
#80=LwsAggregate(#79, .F., (#88));
#81=LwsArgumentsSelector(#63, #87);
#82=LwsProcedureCall(#72, (), #9);
#83=LwsDecimalLiteral(#20, .F., ''1_000_000'');
#84=LwsQualifiedIdentifier(#48, .F., ''Integer'', ());
#85=LwsQualifiedIdentifier(#21, .F., ''Alice'', ());
#86=LwsArgumentsSelector(#92, #91);
#87=LwsAggregate(#81, .F., (#64));
#88=LwsQualifiedIdentifier(#80, .F., ''Mike'', ());
#89=LwsProcedureCall(#72, (), #34);
#90=LwsStringLiteral(#18, .F., ''And F as an integer is '');
#91=LwsAggregate(#86, .F., (#68));
#92=LwsQualifiedIdentifier(#60, .F., ''Put'', (#86));
#93=LwsArgumentsSelector(#7, #96);
#94=LwsQualifiedIdentifier(#23, .F., ''New_Line'', ());
#95=LwsUnit(#103, .F., (), #61);
#96=LwsAggregate(#93, .F., (#17));
#97=LwsCompoundName(#67, (''Numbers''));
#98=LwsBasedLiteral(#36, .F., ''2#1011#'');
#99=LwsAssignment(#72, (), #6, #20);
#100=LwsAssignment(#72, (), #10, #65);
#101=LwsProcedureCall(#72, (), #58);
#102=LwsArgumentsSelector(#40, #50);
#103=LwsParsingResult($, (#95), $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a11_cube [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsNamedSelector(#72, ''Glaux'');
#2=LwsBlockBody(#101, (#115), ());
#3=LwsWithClause(#42, (#43), (#43));
#4=LwsCompoundName(#109, (''Win32'', ''Glaux''));
#5=LwsBlockBody(#144, (#39, #26, #100, #15, #80, #46), ());
#6=LwsAggregate(#85, .F., (#90, #94, #52, #155));
#7=LwsQualifiedIdentifier(#137, .F., ''Win32'', (#45));
#8=LwsNegativeExpression(#31, .F., #82);
#9=LwsQualifiedIdentifier(#98, .F., ''Interfaces'', ());
#10=LwsQualifiedIdentifier(#21, .F., ''glClear'', (#58));
#11=LwsProcedureCall(#41, (), #35);
#12=LwsCompoundName(#73, (''MyReshape''));
#13=LwsUseClause(#144, (#72), (#72));
#14=LwsDecimalLiteral(#31, .F., ''0.0'');
#15=LwsProcedureCall(#5, (), #114);
#16=LwsUnitInterface(#95, #154, ());
#17=LwsArgumentsSelector(#122, #113);
#18=LwsAggregate(#103, .F., (#104));
#19=LwsProcedureDeclaration(#144, (), .F., #87);
#20=LwsDecimalLiteral(#149, .F., ''2.0'');
#21=LwsProcedureCall(#41, (), #10);
#22=LwsQualifiedIdentifier(#60, .F., ''glScalef'', (#61));
#23=LwsQualifiedIdentifier(#139, .F., ''GLenum'', ());
#24=LwsQualifiedIdentifier(#147, .F., ''W'', ());
#25=LwsParsingResult($, (#95), $);
#26=LwsProcedureCall(#5, (), #110);
#27=LwsArgumentsSelector(#157, #121);
#28=LwsDecimalLiteral(#50, .F., ''1.0'');
#29=LwsProcedureCall(#41, (), #161);
#30=LwsAggregate(#112, .F., (#77));
#31=LwsAggregate(#111, .F., (#14, #76, #8));
#32=LwsDecimalLiteral(#125, .F., ''1.0'');
#33=LwsSubprogramBody(#144, (), #73, #44);
#34=LwsDecimalLiteral(#149, .F., ''1.0'');
#35=LwsQualifiedIdentifier(#11, .F., ''glFlush'', ());
#36=LwsProcedureDeclaration(#101, (), .F., #99);
#37=LwsArgumentsSelector(#128, #123);
#38=LwsDecimalLiteral(#125, .F., ''20.0'');
#39=LwsProcedureCall(#5, (), #128);
#40=LwsQualifiedIdentifier(#147, .F., ''H'', ());
#41=LwsBlockBody(#93, (#21, #81, #29, #48, #60, #119, #11), ());
#42=LwsUnitInterface(#95, #3, ());
#43=LwsCompoundName(#3, (''Win32'', ''Glu''));
#44=LwsBlockBody(#33, (#135, #78, #74, #118, #83), ());
#45=LwsNamedSelector(#7, ''Glu'');
#46=LwsProcedureCall(#5, (), #122);
#47=LwsFormalParameter(#73, (''W'', ''H''), .inputMode., #138, $);
#48=LwsProcedureCall(#41, (), #75);
#49=LwsAggregate(#129, .F., (#64));
#50=LwsAggregate(#131, .F., (#105, #158, #28));
#51=LwsQualifiedIdentifier(#106, .F., ''Win32'', (#88));
#52=LwsDecimalLiteral(#6, .F., ''500'');
#53=LwsQualifiedIdentifier(#118, .F., ''glMatrixMode'', (#151));
#54=LwsQualifiedIdentifier(#74, .F., ''glFrustum'', (#134));
#55=LwsQualifiedIdentifier(#135, .F., ''glMatrixMode'', (#112));
#56=LwsArgumentsSelector(#92, #147);
#57=LwsDecimalLiteral(#125, .F., ''1.0'');
#58=LwsArgumentsSelector(#10, #148);
#59=LwsNegativeExpression(#125, .F., #68);
#60=LwsProcedureCall(#41, (), #22);
#61=LwsArgumentsSelector(#22, #149);
#62=LwsArgumentsSelector(#104, #152);
#63=LwsQualifiedIdentifier(#152, .F., ''Window_Name'', (#156));
#64=LwsQualifiedIdentifier(#49, .F., ''MyReshape'', (#66));
#65=LwsAggregate(#142, .F., (#91));
#66=LwsNamedAttribute(#64, ''Unrestricted_Access'');
#67=LwsNamedAttribute(#126, ''Unrestricted_Access'');
#68=LwsDecimalLiteral(#59, .F., ''1.0'');
#69=LwsNegativeExpression(#125, .F., #136);
#70=LwsCompoundName(#108, (''Win32'', ''Gl''));
#71=LwsAggregate(#151, .F., (#116));
#72=LwsQualifiedIdentifier(#13, .F., ''Win32'', (#1));
#73=LwsProcedureDeclaration(#33, (#47), .F., #12);
#74=LwsProcedureCall(#44, (), #54);
#75=LwsQualifiedIdentifier(#48, .F., ''glTranslatef'', (#111));
#76=LwsDecimalLiteral(#31, .F., ''0.0'');
#77=LwsQualifiedIdentifier(#30, .F., ''GL_PROJECTION'', ());
#78=LwsProcedureCall(#44, (), #146);
#79=LwsCompoundName(#117, (''Display''));
#80=LwsProcedureCall(#5, (), #162);
#81=LwsProcedureCall(#41, (), #159);
#82=LwsDecimalLiteral(#8, .F., ''5.0'');
#83=LwsProcedureCall(#44, (), #92);
#84=LwsDecimalLiteral(#147, .F., ''0'');
#85=LwsArgumentsSelector(#110, #6);
#86=LwsWithClause(#124, (#153), (#153));
#87=LwsCompoundName(#19, (''Cube''));
#88=LwsNamedSelector(#51, ''Gl'');
#89=LwsQualifiedIdentifier(#148, .F., ''GL_COLOR_BUFFER_BIT'', ());
#90=LwsDecimalLiteral(#6, .F., ''0'');
#91=LwsDecimalLiteral(#65, .F., ''1.0'');
#92=LwsQualifiedIdentifier(#83, .F., ''glViewport'', (#56));
#93=LwsSubprogramBody(#144, (), #117, #41);
#94=LwsDecimalLiteral(#6, .F., ''0'');
#95=LwsUnit(#25, .F., (#143, #42, #133, #16, #124), #144);
#96=LwsNamedAttribute(#104, ''Unchecked_Access'');
#97=LwsCompoundName(#154, (''Interfaces'', ''C''));
#98=LwsUseClause(#144, (#9), (#9));
#99=LwsCompoundName(#36, (''MyInit''));
#100=LwsAssignment(#5, (), #107, #102);
#101=LwsSubprogramBody(#144, (), #36, #2);
#102=LwsQualifiedIdentifier(#100, .F., ''auxInitWindow'', (#103));
#103=LwsArgumentsSelector(#102, #18);
#104=LwsQualifiedIdentifier(#18, .F., ''Window_Name'', (#62, #96));
#105=LwsDecimalLiteral(#50, .F., ''1.0'');
#106=LwsUseClause(#144, (#51), (#51));
#107=LwsQualifiedIdentifier(#100, .F., ''Res'', ());
#108=LwsWithClause(#143, (#70), (#70));
#109=LwsWithClause(#133, (#4), (#4));
#110=LwsQualifiedIdentifier(#26, .F., ''auxInitPosition'', (#85));
#111=LwsArgumentsSelector(#75, #31);
#112=LwsArgumentsSelector(#55, #30);
#113=LwsAggregate(#17, .F., (#126));
#114=LwsQualifiedIdentifier(#15, .F., ''MyInit'', ());
#115=LwsProcedureCall(#2, (), #157);
#116=LwsQualifiedIdentifier(#71, .F., ''GL_MODELVIEW'', ());
#117=LwsProcedureDeclaration(#93, (), .F., #79);
#118=LwsProcedureCall(#44, (), #53);
#119=LwsProcedureCall(#41, (), #150);
#120=LwsPlusExpression(#123, .F., #127, #132);
#121=LwsAggregate(#27, .F., (#160));
#122=LwsQualifiedIdentifier(#46, .F., ''auxMainLoop'', (#17));
#123=LwsAggregate(#37, .F., (#120));
#124=LwsUnitInterface(#95, #86, ());
#125=LwsAggregate(#134, .F., (#69, #57, #59, #32, #140, #38));
#126=LwsQualifiedIdentifier(#113, .F., ''Display'', (#67));
#127=LwsQualifiedIdentifier(#120, .F., ''AUX_SINGLE'', ());
#128=LwsQualifiedIdentifier(#39, .F., ''auxInitDisplayMode'', (#37));
#129=LwsArgumentsSelector(#162, #49);
#130=LwsDecimalLiteral(#149, .F., ''1.0'');
#131=LwsArgumentsSelector(#159, #50);
#132=LwsQualifiedIdentifier(#120, .F., ''AUX_RGB'', ());
#133=LwsUnitInterface(#95, #109, ());
#134=LwsArgumentsSelector(#54, #125);
#135=LwsProcedureCall(#44, (), #55);
#136=LwsDecimalLiteral(#69, .F., ''1.0'');
#137=LwsUseClause(#144, (#7), (#7));
#138=LwsQualifiedIdentifier(#47, .F., ''GLsizei'', ());
#139=LwsSubtypeIndication(#145, #23, $);
#140=LwsDecimalLiteral(#125, .F., ''1.5'');
#141=LwsDecimalLiteral(#147, .F., ''0'');
#142=LwsArgumentsSelector(#150, #65);
#143=LwsUnitInterface(#95, #108, ());
#144=LwsSubprogramBody(#95, (#106, #137, #13, #98, #145, #101, #33, #93), #19, #5);
#145=LwsObjectDeclaration(#144, (''Res''), .F., .F., #139, $);
#146=LwsQualifiedIdentifier(#78, .F., ''glLoadIdentity'', ());
#147=LwsAggregate(#56, .F., (#141, #84, #24, #40));
#148=LwsAggregate(#58, .F., (#89));
#149=LwsAggregate(#61, .F., (#34, #20, #130));
#150=LwsQualifiedIdentifier(#119, .F., ''auxWireCube'', (#142));
#151=LwsArgumentsSelector(#53, #71);
#152=LwsAggregate(#62, .F., (#63));
#153=LwsCompoundName(#86, (''Interfaces'', ''C'', ''Strings''));
#154=LwsWithClause(#16, (#97), (#97));
#155=LwsDecimalLiteral(#6, .F., ''500'');
#156=LwsNamedAttribute(#63, ''First'');
#157=LwsQualifiedIdentifier(#115, .F., ''glShadeModel'', (#27));
#158=LwsDecimalLiteral(#50, .F., ''1.0'');
#159=LwsQualifiedIdentifier(#81, .F., ''glColor3f'', (#131));
#160=LwsQualifiedIdentifier(#121, .F., ''GL_FLAT'', ());
#161=LwsQualifiedIdentifier(#29, .F., ''glLoadIdentity'', ());
#162=LwsQualifiedIdentifier(#80, .F., ''auxReshapeFunc'', (#129));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a13_sphere [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUnit(#106, .F., (#155, #46, #68, #111), #13);
#2=LwsDecimalLiteral(#133, .F., ''0'');
#3=LwsCompoundName(#47, (''MyReshape''));
#4=LwsArgumentsSelector(#15, #52);
#5=LwsQualifiedIdentifier(#43, .F., ''GLdouble'', (#12));
#6=LwsQualifiedIdentifier(#32, .F., ''gluPerspective'', (#82));
#7=LwsQualifiedIdentifier(#103, .F., ''Window_Name'', (#49, #66));
#8=LwsBlockBody(#124, (#10, #84, #38, #54, #100, #55, #143), ());
#9=LwsAggregate(#67, .F., (#17));
#10=LwsProcedureCall(#8, (), #172);
#11=LwsQualifiedIdentifier(#27, .F., ''glMatrixMode'', (#65));
#12=LwsArgumentsSelector(#5, #56);
#13=LwsSubprogramBody(#1, (#23, #116, #171, #121, #35, #124, #92, #152), #108, #79);
#14=LwsArgumentsSelector(#113, #57);
#15=LwsQualifiedIdentifier(#129, .F., ''glViewport'', (#4));
#16=LwsQualifiedIdentifier(#55, .F., ''glPopMatrix'', ());
#17=LwsQualifiedIdentifier(#9, .F., ''MyReshape'', (#88));
#18=LwsFormalParameter(#47, (''W''), .inputMode., #112, $);
#19=LwsQualifiedIdentifier(#145, .F., ''AUX_RGB'', ());
#20=LwsFormalParameter(#47, (''H''), .inputMode., #114, $);
#21=LwsQualifiedIdentifier(#169, .F., ''Lh'', ());
#22=LwsDecimalLiteral(#118, .F., ''0.0'');
#23=LwsUseClause(#13, (#51), (#51));
#24=LwsDecimalLiteral(#52, .F., ''0'');
#25=LwsQualifiedIdentifier(#97, .F., ''Res'', ());
#26=LwsNamedSelector(#51, ''Gl'');
#27=LwsProcedureCall(#77, (), #11);
#28=LwsArgumentsSelector(#138, #81);
#29=LwsProcedureCall(#79, (), #107);
#30=LwsWithClause(#68, (#167), (#167));
#31=LwsDecimalLiteral(#146, .F., ''1.0'');
#32=LwsProcedureCall(#77, (), #6);
#33=LwsQualifiedIdentifier(#53, .F., ''auxInitDisplayMode'', (#115));
#34=LwsDecimalLiteral(#59, .F., ''1'');
#35=LwsObjectDeclaration(#13, (''Res''), .F., .F., #69, $);
#36=LwsAggregate(#163, .F., (#39));
#37=LwsCompoundName(#72, (''Display''));
#38=LwsProcedureCall(#8, (), #174);
#39=LwsQualifiedIdentifier(#36, .F., ''GL_FLAT'', ());
#40=LwsDecimalLiteral(#52, .F., ''0'');
#41=LwsQualifiedIdentifier(#100, .F., ''auxWireSphere'', (#91));
#42=LwsQualifiedIdentifier(#139, .F., ''glLoadIdentity'', ());
#43=LwsDivExpression(#137, .F., #113, #5);
#44=LwsDecimalLiteral(#81, .F., ''400'');
#45=LwsProcedureCall(#79, (), #135);
#46=LwsUnitInterface(#1, #132, ());
#47=LwsProcedureDeclaration(#152, (#18, #20), .F., #3);
#48=LwsNamedSelector(#147, ''Glu'');
#49=LwsArgumentsSelector(#7, #102);
#50=LwsQualifiedIdentifier(#160, .F., ''GL_COLOR_BUFFER_BIT'', ());
#51=LwsQualifiedIdentifier(#23, .F., ''Win32'', (#26));
#52=LwsAggregate(#4, .F., (#40, #24, #78, #64));
#53=LwsProcedureCall(#79, (), #33);
#54=LwsProcedureCall(#8, (), #85);
#55=LwsProcedureCall(#8, (), #16);
#56=LwsAggregate(#12, .F., (#134));
#57=LwsAggregate(#14, .F., (#61));
#58=LwsQualifiedIdentifier(#169, .F., ''H'', ());
#59=LwsAssignment(#161, (), #162, #34);
#60=LwsArgumentsSelector(#85, #118);
#61=LwsQualifiedIdentifier(#57, .F., ''W'', ());
#62=LwsCompoundName(#108, (''Sphere''));
#63=LwsDecimalLiteral(#137, .F., ''20.0'');
#64=LwsQualifiedIdentifier(#52, .F., ''H'', ());
#65=LwsArgumentsSelector(#11, #125);
#66=LwsNamedAttribute(#7, ''Unchecked_Access'');
#67=LwsArgumentsSelector(#83, #9);
#68=LwsUnitInterface(#1, #30, ());
#69=LwsSubtypeIndication(#35, #136, $);
#70=LwsNegativeExpression(#118, .F., #101);
#71=LwsProcedureDeclaration(#92, (), .F., #148);
#72=LwsProcedureDeclaration(#124, (), .F., #37);
#73=LwsDecimalLiteral(#118, .F., ''0.0'');
#74=LwsObjectDeclaration(#152, (''Lh''), .F., .F., #76, $);
#75=LwsDecimalLiteral(#94, .F., ''1.0'');
#76=LwsSubtypeIndication(#74, #140, $);
#77=LwsBlockBody(#152, (#117, #129, #123, #139, #32, #27), ());
#78=LwsQualifiedIdentifier(#52, .F., ''W'', ());
#79=LwsBlockBody(#13, (#53, #120, #97, #45, #128, #29), ());
#80=LwsQualifiedIdentifier(#145, .F., ''AUX_SINGLE'', ());
#81=LwsAggregate(#28, .F., (#158, #149, #44, #122));
#82=LwsArgumentsSelector(#6, #137);
#83=LwsQualifiedIdentifier(#128, .F., ''auxReshapeFunc'', (#67));
#84=LwsProcedureCall(#8, (), #87);
#85=LwsQualifiedIdentifier(#54, .F., ''glTranslatef'', (#60));
#86=LwsBlockBody(#92, (#119), ());
#87=LwsQualifiedIdentifier(#84, .F., ''glColor3f'', (#153));
#88=LwsNamedAttribute(#17, ''Unrestricted_Access'');
#89=LwsWithClause(#111, (#90), (#90));
#90=LwsCompoundName(#89, (''Win32'', ''Glaux''));
#91=LwsArgumentsSelector(#41, #146);
#92=LwsSubprogramBody(#13, (), #71, #86);
#93=LwsArgumentsSelector(#107, #150);
#94=LwsAggregate(#153, .F., (#75, #95, #142));
#95=LwsDecimalLiteral(#94, .F., ''1.0'');
#96=LwsQualifiedIdentifier(#133, .F., ''H'', ());
#97=LwsAssignment(#79, (), #25, #144);
#98=LwsAggregate(#159, .F., (#99));
#99=LwsQualifiedIdentifier(#98, .F., ''GL_PROJECTION'', ());
#100=LwsProcedureCall(#8, (), #41);
#101=LwsDecimalLiteral(#70, .F., ''5.0'');
#102=LwsAggregate(#49, .F., (#127));
#103=LwsAggregate(#166, .F., (#7));
#104=LwsNamedSelector(#141, ''Glaux'');
#105=LwsQualifiedIdentifier(#123, .F., ''glMatrixMode'', (#159));
#106=LwsParsingResult($, (#1), $);
#107=LwsQualifiedIdentifier(#29, .F., ''auxMainLoop'', (#93));
#108=LwsProcedureDeclaration(#13, (), .F., #62);
#109=LwsNamedAttribute(#154, ''Unrestricted_Access'');
#110=LwsArgumentsSelector(#172, #160);
#111=LwsUnitInterface(#1, #89, ());
#112=LwsQualifiedIdentifier(#18, .F., ''GLsizei'', ());
#113=LwsQualifiedIdentifier(#43, .F., ''GLdouble'', (#14));
#114=LwsQualifiedIdentifier(#20, .F., ''GLsizei'', ());
#115=LwsArgumentsSelector(#33, #168);
#116=LwsUseClause(#13, (#147), (#147));
#117=LwsIfStatement(#77, (), (#161), (#169));
#118=LwsAggregate(#60, .F., (#73, #22, #70));
#119=LwsProcedureCall(#86, (), #164);
#120=LwsProcedureCall(#79, (), #138);
#121=LwsUseClause(#13, (#157), (#157));
#122=LwsDecimalLiteral(#81, .F., ''400'');
#123=LwsProcedureCall(#77, (), #105);
#124=LwsSubprogramBody(#13, (), #72, #8);
#125=LwsAggregate(#65, .F., (#126));
#126=LwsQualifiedIdentifier(#125, .F., ''GL_MODELVIEW'', ());
#127=LwsQualifiedIdentifier(#102, .F., ''Window_Name'', (#173));
#128=LwsProcedureCall(#79, (), #83);
#129=LwsProcedureCall(#77, (), #15);
#130=LwsWithClause(#155, (#131), (#131));
#131=LwsCompoundName(#130, (''Interfaces'', ''C''));
#132=LwsWithClause(#46, (#156), (#156));
#133=LwsEqualExpression(#161, .F., #96, #2);
#134=LwsQualifiedIdentifier(#56, .F., ''H'', ());
#135=LwsQualifiedIdentifier(#45, .F., ''MyInit'', ());
#136=LwsQualifiedIdentifier(#69, .F., ''GLenum'', ());
#137=LwsAggregate(#82, .F., (#165, #43, #170, #63));
#138=LwsQualifiedIdentifier(#120, .F., ''auxInitPosition'', (#28));
#139=LwsProcedureCall(#77, (), #42);
#140=LwsQualifiedIdentifier(#76, .F., ''GLsizei'', ());
#141=LwsQualifiedIdentifier(#171, .F., ''Win32'', (#104));
#142=LwsDecimalLiteral(#94, .F., ''1.0'');
#143=LwsProcedureCall(#8, (), #151);
#144=LwsQualifiedIdentifier(#97, .F., ''auxInitWindow'', (#166));
#145=LwsPlusExpression(#168, .F., #80, #19);
#146=LwsAggregate(#91, .F., (#31));
#147=LwsQualifiedIdentifier(#116, .F., ''Win32'', (#48));
#148=LwsCompoundName(#71, (''MyInit''));
#149=LwsDecimalLiteral(#81, .F., ''0'');
#150=LwsAggregate(#93, .F., (#154));
#151=LwsQualifiedIdentifier(#143, .F., ''glFlush'', ());
#152=LwsSubprogramBody(#13, (#74), #47, #77);
#153=LwsArgumentsSelector(#87, #94);
#154=LwsQualifiedIdentifier(#150, .F., ''Display'', (#109));
#155=LwsUnitInterface(#1, #130, ());
#156=LwsCompoundName(#132, (''Win32'', ''Gl''));
#157=LwsQualifiedIdentifier(#121, .F., ''Interfaces'', ());
#158=LwsDecimalLiteral(#81, .F., ''0'');
#159=LwsArgumentsSelector(#105, #98);
#160=LwsAggregate(#110, .F., (#50));
#161=LwsIfClause(#117, #133, (#59));
#162=LwsQualifiedIdentifier(#59, .F., ''Lh'', ());
#163=LwsArgumentsSelector(#164, #36);
#164=LwsQualifiedIdentifier(#119, .F., ''glShadeModel'', (#163));
#165=LwsDecimalLiteral(#137, .F., ''60.0'');
#166=LwsArgumentsSelector(#144, #103);
#167=LwsCompoundName(#30, (''Win32'', ''Glu''));
#168=LwsAggregate(#115, .F., (#145));
#169=LwsAssignment(#117, (), #21, #58);
#170=LwsDecimalLiteral(#137, .F., ''1.0'');
#171=LwsUseClause(#13, (#141), (#141));
#172=LwsQualifiedIdentifier(#10, .F., ''glClear'', (#110));
#173=LwsNamedAttribute(#127, ''First'');
#174=LwsQualifiedIdentifier(#38, .F., ''glPushMatrix'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a18_cube_glut [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsAssignment(#112, (), #134, #4);
#2=LwsProcedureCall(#112, (), #32);
#3=LwsQualifiedIdentifier(#100, .F., ''W'', ());
#4=LwsQualifiedIdentifier(#1, .F., ''glutCreateWindow'', (#168));
#5=LwsObjectDeclaration(#143, (''Window_Name''), .F., .T., #154, #141);
#6=LwsDecimalLiteral(#80, .F., ''1.0'');
#7=LwsArgumentsSelector(#19, #56);
#8=LwsQualifiedIdentifier(#152, .F., ''glutInitWindowSize'', (#33));
#9=LwsUnitInterface(#75, #160, ());
#10=LwsArgumentsSelector(#114, #63);
#11=LwsProcedureDeclaration(#28, (#140), .F., #97);
#12=LwsDecimalLiteral(#158, .F., ''1.0'');
#13=LwsProcedureCall(#95, (), #54);
#14=LwsAggregate(#138, .F., (#83));
#15=LwsDecimalLiteral(#80, .F., ''20.0'');
#16=LwsSubprogramBody(#143, (), #87, #26);
#17=LwsDecimalLiteral(#170, .F., ''0'');
#18=LwsDecimalLiteral(#82, .F., ''500'');
#19=LwsQualifiedIdentifier(#64, .F., ''glutDisplayFunc'', (#7));
#20=LwsWithClause(#53, (#65), (#65));
#21=LwsNamedAttribute(#66, ''Unrestricted_Access'');
#22=LwsQualifiedIdentifier(#122, .F., ''GL_COLOR_BUFFER_BIT'', ());
#23=LwsQualifiedIdentifier(#73, .F., ''GlFrustum'', (#31));
#24=LwsAggregate(#149, .F., (#25));
#25=LwsQualifiedIdentifier(#24, .F., ''Display_Mode'', ());
#26=LwsBlockBody(#16, (#46, #68, #86, #55, #145, #129, #153), ());
#27=LwsWithClause(#135, (#67), (#67));
#28=LwsSubprogramBody(#143, (), #11, #95);
#29=LwsProcedureCall(#112, (), #105);
#30=LwsDecimalLiteral(#170, .F., ''0'');
#31=LwsArgumentsSelector(#23, #80);
#32=LwsQualifiedIdentifier(#2, .F., ''MyInit'', ());
#33=LwsArgumentsSelector(#8, #82);
#34=LwsArgumentsSelector(#49, #81);
#35=LwsUseClause(#143, (#61), (#61));
#36=LwsUseClause(#143, (#118), (#118));
#37=LwsProcedureCall(#95, (), #124);
#38=LwsNamedSelector(#61, ''Gl'');
#39=LwsQualifiedIdentifier(#145, .F., ''GlScalef'', (#45));
#40=LwsProcedureCall(#112, (), #88);
#41=LwsProcedureCall(#112, (), #49);
#42=LwsQualifiedIdentifier(#154, .F., ''String'', ());
#43=LwsSubtypeIndication(#57, #94, $);
#44=LwsProcedureCall(#95, (), #48);
#45=LwsArgumentsSelector(#39, #89);
#46=LwsProcedureCall(#26, (), #137);
#47=LwsAggregate(#168, .F., (#109));
#48=LwsQualifiedIdentifier(#44, .F., ''GlLoadIdentity'', ());
#49=LwsQualifiedIdentifier(#41, .F., ''glutReshapeFunc'', (#34));
#50=LwsNamedAttribute(#159, ''Unrestricted_Access'');
#51=LwsQualifiedIdentifier(#142, .F., ''GLsizei'', (#62));
#52=LwsCompoundName(#87, (''Display''));
#53=LwsUnitInterface(#75, #20, ());
#54=LwsQualifiedIdentifier(#13, .F., ''GlMatrixMode'', (#106));
#55=LwsProcedureCall(#26, (), #132);
#56=LwsAggregate(#7, .F., (#66));
#57=LwsObjectDeclaration(#143, (''Res''), .F., .F., #43, $);
#58=LwsProcedureCall(#95, (), #167);
#59=LwsCompoundName(#92, (''MyInit''));
#60=LwsQualifiedIdentifier(#140, .F., ''Integer'', ());
#61=LwsQualifiedIdentifier(#35, .F., ''Win32'', (#38));
#62=LwsArgumentsSelector(#51, #100);
#63=LwsAggregate(#10, .F., (#103, #123, #169));
#64=LwsProcedureCall(#112, (), #19);
#65=LwsCompoundName(#20, (''Interfaces'', ''C'', ''Strings''));
#66=LwsQualifiedIdentifier(#56, .F., ''Display'', (#21));
#67=LwsCompoundName(#27, (''Glut''));
#68=LwsProcedureCall(#26, (), #114);
#69=LwsDecimalLiteral(#142, .F., ''0'');
#70=LwsProcedureCall(#112, (), #150);
#71=LwsWithClause(#102, (#136), (#136));
#72=LwsArgumentsSelector(#124, #119);
#73=LwsProcedureCall(#95, (), #23);
#74=LwsNegativeExpression(#80, .F., #96);
#75=LwsUnit(#126, .F., (#111, #9, #135, #102, #53), #143);
#76=LwsCompoundName(#108, (''Cube_Glut''));
#77=LwsArgumentsSelector(#137, #122);
#78=LwsDecimalLiteral(#166, .F., ''0.0'');
#79=LwsDecimalLiteral(#89, .F., ''1.0'');
#80=LwsAggregate(#31, .F., (#74, #104, #162, #6, #107, #15));
#81=LwsAggregate(#34, .F., (#159));
#82=LwsAggregate(#33, .F., (#133, #18));
#83=LwsQualifiedIdentifier(#14, .F., ''GL_FLAT'', ());
#84=LwsWithClause(#111, (#151), (#151));
#85=LwsDecimalLiteral(#142, .F., ''0'');
#86=LwsProcedureCall(#26, (), #157);
#87=LwsProcedureDeclaration(#16, (), .F., #52);
#88=LwsQualifiedIdentifier(#40, .F., ''glutInitDisplayMode'', (#149));
#89=LwsAggregate(#45, .F., (#79, #90, #131));
#90=LwsDecimalLiteral(#89, .F., ''2.0'');
#91=LwsQualifiedIdentifier(#142, .F., ''GLsizei'', (#98));
#92=LwsProcedureDeclaration(#144, (), .F., #59);
#93=LwsArgumentsSelector(#167, #142);
#94=LwsQualifiedIdentifier(#43, .F., ''Integer'', ());
#95=LwsBlockBody(#28, (#37, #44, #73, #13, #58), ());
#96=LwsDecimalLiteral(#74, .F., ''1.0'');
#97=LwsCompoundName(#11, (''MyReshape''));
#98=LwsArgumentsSelector(#91, #155);
#99=LwsQualifiedIdentifier(#153, .F., ''GlFlush'', ());
#100=LwsAggregate(#62, .F., (#3));
#101=LwsArgumentsSelector(#130, #158);
#102=LwsUnitInterface(#75, #71, ());
#103=LwsDecimalLiteral(#63, .F., ''1.0'');
#104=LwsDecimalLiteral(#80, .F., ''1.0'');
#105=LwsQualifiedIdentifier(#29, .F., ''glutInitWindowPosition'', (#115));
#106=LwsArgumentsSelector(#54, #164);
#107=LwsDecimalLiteral(#80, .F., ''1.5'');
#108=LwsProcedureDeclaration(#143, (), .F., #76);
#109=LwsQualifiedIdentifier(#47, .F., ''Window_Name'', ());
#110=LwsArgumentsSelector(#132, #166);
#111=LwsUnitInterface(#75, #84, ());
#112=LwsBlockBody(#143, (#40, #29, #152, #1, #2, #41, #64, #70), ());
#113=LwsCompoundName(#160, (''Win32'', ''Glu''));
#114=LwsQualifiedIdentifier(#68, .F., ''GlColor3f'', (#10));
#115=LwsArgumentsSelector(#105, #170);
#116=LwsDecimalLiteral(#162, .F., ''1.0'');
#117=LwsUseClause(#143, (#146), (#146));
#118=LwsQualifiedIdentifier(#36, .F., ''Interfaces'', ());
#119=LwsAggregate(#72, .F., (#121));
#120=LwsNamedSelector(#146, ''Glu'');
#121=LwsQualifiedIdentifier(#119, .F., ''GL_PROJECTION'', ());
#122=LwsAggregate(#77, .F., (#22));
#123=LwsDecimalLiteral(#63, .F., ''1.0'');
#124=LwsQualifiedIdentifier(#37, .F., ''GlMatrixMode'', (#72));
#125=LwsBlockBody(#144, (#161), ());
#126=LwsParsingResult($, (#75), $);
#127=LwsDecimalLiteral(#166, .F., ''0.0'');
#128=LwsNegativeExpression(#166, .F., #148);
#129=LwsProcedureCall(#26, (), #130);
#130=LwsQualifiedIdentifier(#129, .F., ''glutWireCube'', (#101));
#131=LwsDecimalLiteral(#89, .F., ''1.0'');
#132=LwsQualifiedIdentifier(#55, .F., ''GlTranslatef'', (#110));
#133=LwsDecimalLiteral(#82, .F., ''500'');
#134=LwsQualifiedIdentifier(#1, .F., ''Res'', ());
#135=LwsUnitInterface(#75, #27, ());
#136=LwsCompoundName(#71, (''Interfaces'', ''C''));
#137=LwsQualifiedIdentifier(#46, .F., ''GlClear'', (#77));
#138=LwsArgumentsSelector(#139, #14);
#139=LwsQualifiedIdentifier(#161, .F., ''GlShadeModel'', (#138));
#140=LwsFormalParameter(#11, (''W'', ''H''), .inputMode., #60, $);
#141=LwsStringLiteral(#5, .F., ''Perspective 3-D Cube'');
#142=LwsAggregate(#93, .F., (#85, #69, #51, #91));
#143=LwsSubprogramBody(#75, (#35, #117, #147, #36, #5, #57, #144, #28, #16), #108, #112);
#144=LwsSubprogramBody(#143, (), #92, #125);
#145=LwsProcedureCall(#26, (), #39);
#146=LwsQualifiedIdentifier(#117, .F., ''Win32'', (#120));
#147=LwsUseClause(#143, (#163), (#163));
#148=LwsDecimalLiteral(#128, .F., ''5.0'');
#149=LwsArgumentsSelector(#88, #24);
#150=LwsQualifiedIdentifier(#70, .F., ''glutmainloop'', ());
#151=LwsCompoundName(#84, (''Win32'', ''Gl''));
#152=LwsProcedureCall(#112, (), #8);
#153=LwsProcedureCall(#26, (), #99);
#154=LwsSubtypeIndication(#5, #42, $);
#155=LwsAggregate(#98, .F., (#156));
#156=LwsQualifiedIdentifier(#155, .F., ''H'', ());
#157=LwsQualifiedIdentifier(#86, .F., ''GlLoadIdentity'', ());
#158=LwsAggregate(#101, .F., (#12));
#159=LwsQualifiedIdentifier(#81, .F., ''MyReshape'', (#50));
#160=LwsWithClause(#9, (#113), (#113));
#161=LwsProcedureCall(#125, (), #139);
#162=LwsNegativeExpression(#80, .F., #116);
#163=LwsQualifiedIdentifier(#147, .F., ''Glut'', ());
#164=LwsAggregate(#106, .F., (#165));
#165=LwsQualifiedIdentifier(#164, .F., ''GL_MODELVIEW'', ());
#166=LwsAggregate(#110, .F., (#127, #78, #128));
#167=LwsQualifiedIdentifier(#58, .F., ''GlViewPort'', (#93));
#168=LwsArgumentsSelector(#4, #47);
#169=LwsDecimalLiteral(#63, .F., ''1.0'');
#170=LwsAggregate(#115, .F., (#30, #17));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a23_defines [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFullTypeDeclaration(#34, ''GLvector'', $, #7);
#2=LwsParsingResult($, (#35), $);
#3=LwsComponentSubtype(#7, .F., #19);
#4=LwsFullTypeDeclaration(#34, ''GLmatrix'', $, #33);
#5=LwsQualifiedIdentifier(#20, .F., ''Win32'', (#39));
#6=LwsQualifiedIdentifier(#15, .F., ''Positive'', ());
#7=LwsArrayType(#1, (#26), #3);
#8=LwsQualifiedIdentifier(#26, .F., ''Positive'', ());
#9=LwsSubtypeIndication(#30, #10, $);
#10=LwsQualifiedIdentifier(#9, .F., ''GLfloat'', ());
#11=LwsComponentSubtype(#14, .F., #36);
#12=LwsQualifiedIdentifier(#16, .F., ''Positive'', ());
#13=LwsCompoundName(#25, (''Win32'', ''GL''));
#14=LwsArrayType(#17, (#38, #22, #15), #11);
#15=LwsIndex(#14, #6);
#16=LwsIndex(#33, #12);
#17=LwsFullTypeDeclaration(#34, ''GLmatrix_3'', $, #14);
#18=LwsIndex(#33, #24);
#19=LwsSubtypeIndication(#3, #21, $);
#20=LwsUseClause(#34, (#5), (#5));
#21=LwsQualifiedIdentifier(#19, .F., ''GLfloat'', ());
#22=LwsIndex(#14, #31);
#23=LwsUnitInterface(#35, #25, ());
#24=LwsQualifiedIdentifier(#18, .F., ''Positive'', ());
#25=LwsWithClause(#23, (#13), (#13));
#26=LwsIndex(#7, #8);
#27=LwsPackageDeclaration(#35, #28, #29);
#28=LwsCompoundName(#27, (''Defines''));
#29=LwsPackageDefinition(#27, #34, $);
#30=LwsComponentSubtype(#33, .F., #9);
#31=LwsQualifiedIdentifier(#22, .F., ''Positive'', ());
#32=LwsQualifiedIdentifier(#38, .F., ''Positive'', ());
#33=LwsArrayType(#4, (#18, #16), #30);
#34=LwsPackagePart(#29, (#20, #1, #4, #17));
#35=LwsUnit(#2, .F., (#23), #27);
#36=LwsSubtypeIndication(#11, #37, $);
#37=LwsQualifiedIdentifier(#36, .F., ''GLfloat'', ());
#38=LwsIndex(#14, #32);
#39=LwsNamedSelector(#5, ''Gl'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_a4gitests [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#3, .F., ''Types'', ());
#2=LwsPackagePart(#7, (#13, #15));
#3=LwsUseClause(#21, (#1), (#1));
#4=LwsFormalParameter(#13, (''N''), $, #9, $);
#5=LwsWithClause(#21, (#16), (#16));
#6=LwsPackageDeclaration(#8, #17, #7);
#7=LwsPackageDefinition(#6, #2, $);
#8=LwsUnit(#18, .F., (#21), #6);
#9=LwsQualifiedIdentifier(#4, .F., ''Node_Id'', ());
#10=LwsQualifiedIdentifier(#13, .F., ''Boolean'', ());
#11=LwsQualifiedIdentifier(#15, .F., ''Boolean'', ());
#12=LwsCompoundName(#13, (''Is_Inherited_Discriminant''));
#13=LwsFunctionDeclaration(#2, (#4), .F., #12, #10);
#14=LwsFormalParameter(#15, (''N''), $, #20, $);
#15=LwsFunctionDeclaration(#2, (#14), .F., #19, #11);
#16=LwsCompoundName(#5, (''Types''));
#17=LwsCompoundName(#6, (''A4G'', ''Itests''));
#18=LwsParsingResult($, (#8), $);
#19=LwsCompoundName(#15, (''Is_From_Instance''));
#20=LwsQualifiedIdentifier(#14, .F., ''Node_Id'', ());
#21=LwsUnitInterface(#8, #5, (#3));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_bufferAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsFormalParameter(#60, (''The_priority''), .inputMode., #14, $);
#2=LwsQualifiedIdentifier(#113, .F., ''Element'', ());
#3=LwsStringEnumerationId(#75, ''empty'');
#4=LwsGenericFormalType(#118, #109);
#5=LwsFormalParameter(#115, (''The_priority''), .inputMode., #18, $);
#6=LwsFormalParameter(#106, (''In_data''), .inputMode., #15, $);
#7=LwsPrivateTypeDefinition(#109, .F., .F.);
#8=LwsFormalParameter(#17, (''Buffer_size''), .inputMode., #83, #53);
#9=LwsFullTypeDeclaration(#69, ''Priority'', $, #52);
#10=LwsPackagePart(#64, (#84, #119, #106, #55, #110, #95, #33, #66, #76, #86, #89, #104, #29, #114, #60, #90, #115, #28, #25));
#11=LwsCompoundName(#29, (''Get_from_beginning''));
#12=LwsFormalParameter(#29, (''Out_data''), .outputMode., #19, $);
#13=LwsStringEnumerationId(#75, ''full'');
#14=LwsQualifiedIdentifier(#1, .F., ''Priority'', ());
#15=LwsQualifiedIdentifier(#6, .F., ''Element'', ());
#16=LwsFormalParameter(#110, (''Out_data''), .outputMode., #24, $);
#17=LwsGenericFormalParameter(#118, #8);
#18=LwsQualifiedIdentifier(#5, .F., ''Priority'', ());
#19=LwsQualifiedIdentifier(#12, .F., ''Element'', ());
#20=LwsQualifiedIdentifier(#66, .F., ''Status_value'', ());
#21=LwsFormalParameter(#76, (''Out_status''), .outputMode., #46, $);
#22=LwsFullTypeDeclaration(#77, ''Buffer_size'', $, #112);
#23=LwsFormalParameter(#28, (''Out_status''), .outputMode., #31, $);
#24=LwsQualifiedIdentifier(#16, .F., ''Element'', ());
#25=LwsExceptionDeclaration(#10, (''Buffer_full'', ''Buffer_empty'', ''Invalid_buffer_size''));
#26=LwsFormalParameter(#76, (''Out_Count''), .outputMode., #34, $);
#27=LwsCompoundName(#33, (''Examine_end''));
#28=LwsProcedureDeclaration(#10, (#62, #48, #23, #61, #97), .F., #96);
#29=LwsProcedureDeclaration(#10, (#12, #92), .F., #11);
#30=LwsFormalParameter(#115, (''Priority_status''), .outputMode., #38, $);
#31=LwsQualifiedIdentifier(#23, .F., ''Status_value'', ());
#32=LwsCompoundName(#114, (''Get_from_end''));
#33=LwsProcedureDeclaration(#10, (#54), .F., #27);
#34=LwsQualifiedIdentifier(#26, .F., ''NATURAL'', ());
#35=LwsFormalParameter(#114, (''Out_data''), .outputMode., #39, $);
#36=LwsFormalParameter(#90, (''The_priority''), .inputMode., #42, $);
#37=LwsFormalParameter(#89, (''The_priority''), .inputMode., #43, $);
#38=LwsQualifiedIdentifier(#30, .F., ''Status_value'', ());
#39=LwsQualifiedIdentifier(#35, .F., ''Element'', ());
#40=LwsPackageDeclaration(#118, #67, #64);
#41=LwsFormalParameter(#119, (''In_data''), .inputMode., #49, $);
#42=LwsQualifiedIdentifier(#36, .F., ''Priority'', ());
#43=LwsQualifiedIdentifier(#37, .F., ''Priority'', ());
#44=LwsFormalParameter(#89, (''In_data''), .inputMode., #56, $);
#45=LwsCompoundName(#66, (''Quick_buffer_status''));
#46=LwsQualifiedIdentifier(#21, .F., ''Status_value'', ());
#47=LwsFormalParameter(#104, (''The_priority''), .inputMode., #58, $);
#48=LwsFormalParameter(#28, (''Out_Count''), .outputMode., #59, $);
#49=LwsQualifiedIdentifier(#41, .F., ''Element'', ());
#50=LwsCompoundName(#55, (''Get_from_beginning''));
#51=LwsCompoundName(#86, (''Set_buffer_size''));
#52=LwsAnyRangeType(#9, .F.);
#53=LwsDecimalLiteral(#8, .F., ''10'');
#54=LwsFormalParameter(#33, (''Out_data''), .outputMode., #63, $);
#55=LwsProcedureDeclaration(#10, (#93), .F., #50);
#56=LwsQualifiedIdentifier(#44, .F., ''Element'', ());
#57=LwsFormalParameter(#104, (''In_data''), .inputMode., #65, $);
#58=LwsQualifiedIdentifier(#47, .F., ''Priority'', ());
#59=LwsQualifiedIdentifier(#48, .F., ''NATURAL'', ());
#60=LwsProcedureDeclaration(#10, (#79, #1), .F., #78);
#61=LwsFormalParameter(#28, (''Overall_count''), .outputMode., #71, $);
#62=LwsFormalParameter(#28, (''The_priority''), .inputMode., #70, $);
#63=LwsQualifiedIdentifier(#54, .F., ''Element'', ());
#64=LwsPackageDefinition(#40, #10, $);
#65=LwsQualifiedIdentifier(#57, .F., ''Element'', ());
#66=LwsFunctionDeclaration(#10, (), .F., #45, #20);
#67=LwsCompoundName(#40, (''Intertask_buffer''));
#68=LwsFormalParameter(#86, (''Buffer_size''), .inputMode., #74, $);
#69=LwsGenericFormalType(#118, #9);
#70=LwsQualifiedIdentifier(#62, .F., ''Priority'', ());
#71=LwsQualifiedIdentifier(#61, .F., ''NATURAL'', ());
#72=LwsParsingResult($, (#105), $);
#73=LwsCompoundName(#95, (''Examine_beginning''));
#74=LwsQualifiedIdentifier(#68, .F., ''POSITIVE'', ());
#75=LwsEnumerationType(#84, (#3, #117, #13));
#76=LwsProcedureDeclaration(#10, (#26, #21), .F., #102);
#77=LwsGenericFormalType(#118, #22);
#78=LwsCompoundName(#60, (''Examine_beginning''));
#79=LwsFormalParameter(#60, (''Out_data''), .outputMode., #82, $);
#80=LwsFormalParameter(#115, (''Overall_status''), .outputMode., #94, $);
#81=LwsFormalParameter(#114, (''The_priority''), .inputMode., #88, $);
#82=LwsQualifiedIdentifier(#79, .F., ''Element'', ());
#83=LwsQualifiedIdentifier(#8, .F., ''POSITIVE'', ());
#84=LwsFullTypeDeclaration(#10, ''Status_value'', $, #75);
#85=LwsCompoundName(#106, (''Put_at_end''));
#86=LwsProcedureDeclaration(#10, (#68), .F., #51);
#87=LwsCompoundName(#89, (''Put_at_beginning''));
#88=LwsQualifiedIdentifier(#81, .F., ''Priority'', ());
#89=LwsProcedureDeclaration(#10, (#44, #37), .F., #87);
#90=LwsProcedureDeclaration(#10, (#107, #36), .F., #91);
#91=LwsCompoundName(#90, (''Examine_end''));
#92=LwsFormalParameter(#29, (''The_priority''), .inputMode., #100, $);
#93=LwsFormalParameter(#55, (''Out_data''), .outputMode., #101, $);
#94=LwsQualifiedIdentifier(#80, .F., ''Status_value'', ());
#95=LwsProcedureDeclaration(#10, (#113), .F., #73);
#96=LwsCompoundName(#28, (''Buffer_status''));
#97=LwsFormalParameter(#28, (''Overall_status''), .outputMode., #99, $);
#98=LwsCompoundName(#104, (''Put_at_end''));
#99=LwsQualifiedIdentifier(#97, .F., ''Status_value'', ());
#100=LwsQualifiedIdentifier(#92, .F., ''Priority'', ());
#101=LwsQualifiedIdentifier(#93, .F., ''Element'', ());
#102=LwsCompoundName(#76, (''Buffer_status''));
#103=LwsCompoundName(#119, (''Put_at_beginning''));
#104=LwsProcedureDeclaration(#10, (#57, #47), .F., #98);
#105=LwsUnit(#72, .F., (), #118);
#106=LwsProcedureDeclaration(#10, (#6), .F., #85);
#107=LwsFormalParameter(#90, (''Out_data''), .outputMode., #111, $);
#108=LwsCompoundName(#110, (''Get_from_end''));
#109=LwsPrivateTypeDeclaration(#4, ''Element'', $, #7, #7);
#110=LwsProcedureDeclaration(#10, (#16), .F., #108);
#111=LwsQualifiedIdentifier(#107, .F., ''Element'', ());
#112=LwsAnyType(#22, .F.);
#113=LwsFormalParameter(#95, (''Out_data''), .outputMode., #2, $);
#114=LwsProcedureDeclaration(#10, (#35, #81), .F., #32);
#115=LwsProcedureDeclaration(#10, (#5, #30, #80), .F., #116);
#116=LwsCompoundName(#115, (''Quick_buffer_status''));
#117=LwsStringEnumerationId(#75, ''partially_full'');
#118=LwsGenericPackageDeclaration(#105, (#4, #69, #17, #77), #40, #40);
#119=LwsProcedureDeclaration(#10, (#41), .F., #103);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_instructions [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#48, .F., ''Except'', (#34));
#2=LwsQualifiedIdentifier(#10, .F., ''Instruction'', ());
#3=LwsIfClause(#31, #14, (#15));
#4=LwsComponentAssociation(#68, #64, (#65));
#5=LwsLoopStatement(#38, (), $, #26, (#31));
#6=LwsQualifiedIdentifier(#65, .F., ''End_Line'', ());
#7=LwsQualifiedIdentifier(#23, .F., ''I'', ());
#8=LwsQualifiedIdentifier(#39, .F., ''Except'', (#61));
#9=LwsQualifiedIdentifier(#14, .F., ''Word'', ());
#10=LwsFormalParameter(#50, (''I''), $, #2, $);
#11=LwsParsingResult($, (#90), $);
#12=LwsExpressionChoice(#87, #47);
#13=LwsProcedureCall(#87, (), #41);
#14=LwsEqualExpression(#3, .F., #36, #9);
#15=LwsReturnStatement(#3, (), #85);
#16=LwsNamedSelector(#54, ''Msg'');
#17=LwsBlockBody(#72, (#23), ());
#18=LwsQualifiedIdentifier(#75, .F., ''Print'', ());
#19=LwsQualifiedIdentifier(#74, .F., ''Quit'', ());
#20=LwsWithClause(#24, (#58), (#58));
#21=LwsNamedSelector(#67, ''Msg'');
#22=LwsProcedureCall(#28, (), #54);
#23=LwsCaseStatement(#17, (), #7, (#87, #33, #60));
#24=LwsUnitInterface(#90, #20, ());
#25=LwsUnitInterface(#90, #51, ());
#26=LwsMembershipIteration(#5, ''I'', .F., #52);
#27=LwsIfStatement(#33, (), (#28), (#93));
#28=LwsIfClause(#27, #73, (#22));
#29=LwsNamedSelector(#73, ''Empty'');
#30=LwsWithClause(#94, (#80), (#80));
#31=LwsIfStatement(#5, (), (#3), $);
#32=LwsArgumentsSelector(#37, #45);
#33=LwsCaseAlternative(#23, (#75), (#92, #27));
#34=LwsNamedSelector(#1, ''Exit_SDC'');
#35=LwsQualifiedIdentifier(#93, .F., ''Screen_Output'', (#81, #66));
#36=LwsQualifiedIdentifier(#14, .F., ''InstructionImage'', (#55));
#37=LwsQualifiedIdentifier(#43, .F., ''Values'', (#42, #32));
#38=LwsBlockBody(#76, (#5, #39), ());
#39=LwsRaiseStatement(#38, (), #8);
#40=LwsCompoundName(#91, (''Instructions''));
#41=LwsQualifiedIdentifier(#13, .F., ''Stack'', (#71));
#42=LwsNamedSelector(#37, ''To_String'');
#43=LwsAggregate(#66, .F., (#37));
#44=LwsCompoundName(#84, (''Except''));
#45=LwsAggregate(#32, .F., (#89));
#46=LwsQualifiedIdentifier(#70, .F., ''I'', ());
#47=LwsQualifiedIdentifier(#12, .F., ''Clear'', ());
#48=LwsRaiseStatement(#60, (), #1);
#49=LwsCompoundName(#51, (''Values''));
#50=LwsProcedureDeclaration(#72, (#10), .F., #59);
#51=LwsWithClause(#25, (#49), (#49));
#52=LwsDiscreteRange(#26, .F., #82, $);
#53=LwsArgumentsSelector(#67, #68);
#54=LwsQualifiedIdentifier(#22, .F., ''Screen_Output'', (#16, #88));
#55=LwsArgumentsSelector(#36, #70);
#56=LwsNamedSelector(#89, ''Top'');
#57=LwsUnitInterface(#90, #84, ());
#58=LwsCompoundName(#20, (''Stack''));
#59=LwsCompoundName(#50, (''Process''));
#60=LwsCaseAlternative(#23, (#74), (#48));
#61=LwsNamedSelector(#8, ''User_Error'');
#62=LwsAggregate(#88, .F., (#83));
#63=LwsQualifiedIdentifier(#69, .F., ''String'', ());
#64=LwsQualifiedIdentifier(#4, .F., ''False'', ());
#65=LwsExpressionChoice(#4, #6);
#66=LwsArgumentsSelector(#35, #43);
#67=LwsQualifiedIdentifier(#92, .F., ''Screen_Output'', (#21, #53));
#68=LwsAggregate(#53, .F., (#79, #4));
#69=LwsFormalParameter(#86, (''Word''), $, #63, $);
#70=LwsAggregate(#55, .F., (#46));
#71=LwsNamedSelector(#41, ''Clear'');
#72=LwsSubprogramBody(#91, (), #50, #17);
#73=LwsQualifiedIdentifier(#28, .F., ''Stack'', (#29));
#74=LwsExpressionChoice(#60, #19);
#75=LwsExpressionChoice(#33, #18);
#76=LwsSubprogramBody(#91, (), #86, #38);
#77=LwsQualifiedIdentifier(#86, .F., ''Instruction'', ());
#78=LwsCompoundName(#86, (''Read''));
#79=LwsStringLiteral(#68, .F., '' -> '');
#80=LwsCompoundName(#30, (''Screen_Output''));
#81=LwsNamedSelector(#35, ''Msg'');
#82=LwsQualifiedIdentifier(#52, .F., ''Instruction'', ());
#83=LwsStringLiteral(#62, .F., ''stack is empty'');
#84=LwsWithClause(#57, (#44), (#44));
#85=LwsQualifiedIdentifier(#15, .F., ''I'', ());
#86=LwsFunctionDeclaration(#76, (#69), .F., #78, #77);
#87=LwsCaseAlternative(#23, (#12), (#13));
#88=LwsArgumentsSelector(#54, #62);
#89=LwsQualifiedIdentifier(#45, .F., ''Stack'', (#56));
#90=LwsUnit(#11, .F., (#57, #94, #24, #25), #91);
#91=LwsPackageBody(#90, (#76, #72), #40, $);
#92=LwsProcedureCall(#33, (), #67);
#93=LwsProcedureCall(#27, (), #35);
#94=LwsUnitInterface(#90, #30, ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_linklistAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsPackagePart(#20, (#101, #67, #111));
#2=LwsQualifiedIdentifier(#58, .F., ''List_Node'', ());
#3=LwsQualifiedIdentifier(#31, .F., ''List_Node'', ());
#4=LwsQualifiedIdentifier(#32, .F., ''List_Node'', ());
#5=LwsQualifiedIdentifier(#33, .F., ''List_Node'', ());
#6=LwsCompoundName(#112, (''Prune_Node''));
#7=LwsAccessToObject(#67, $, #80);
#8=LwsFormalParameter(#81, (''Inside_List''), .inputMode., #29, $);
#9=LwsFormalParameter(#93, (''Root_Node''), .inputOutputMode., #22, $);
#10=LwsFormalParameter(#46, (''New_Node''), .outputMode., #23, $);
#11=LwsFormalParameter(#46, (''New_Value''), .inputMode., #120, $);
#12=LwsFormalParameter(#49, (''The_Node''), .inputMode., #118, $);
#13=LwsProcedureDeclaration(#71, (#123, #110), .F., #103);
#14=LwsSubtypeIndication(#111, #91, $);
#15=LwsFormalParameter(#49, (''New_Value''), .inputMode., #124, $);
#16=LwsPrivateTypeDeclaration(#71, ''List_Node'', $, #102, #102);
#17=LwsCompoundName(#121, (''Delete_Value''));
#18=LwsCompoundName(#73, (''Value''));
#19=LwsCompoundName(#74, (''Where_To_Add_New_Node''));
#20=LwsPackageDefinition(#45, #71, #1);
#21=LwsQualifiedIdentifier(#48, .F., ''List_Node'', ());
#22=LwsQualifiedIdentifier(#9, .F., ''List_Node'', ());
#23=LwsQualifiedIdentifier(#10, .F., ''List_Node'', ());
#24=LwsFormalParameter(#55, (''Old_List''), .inputOutputMode., #128, $);
#25=LwsGenericPackageDeclaration(#92, (#44, #95), #45, #45);
#26=LwsProcedureDeclaration(#71, (#52), .F., #82);
#27=LwsQualifiedIdentifier(#52, .F., ''List_Node'', ());
#28=LwsQualifiedIdentifier(#43, .F., ''List_Node'', ());
#29=LwsQualifiedIdentifier(#8, .F., ''List_Node'', ());
#30=LwsQualifiedIdentifier(#80, .F., ''List_Item'', ());
#31=LwsFormalParameter(#68, (''New_List''), .inputOutputMode., #3, $);
#32=LwsFormalParameter(#73, (''From_Node''), .inputMode., #4, $);
#33=LwsFormalParameter(#121, (''From_List''), .inputMode., #5, $);
#34=LwsCompoundName(#45, (''Linked_List''));
#35=LwsQualifiedIdentifier(#54, .F., ''List_Node'', ());
#36=LwsQualifiedIdentifier(#56, .F., ''Item_To_Manage'', ());
#37=LwsCompoundName(#55, (''Merge_List''));
#38=LwsQualifiedIdentifier(#57, .F., ''List_Node'', ());
#39=LwsQualifiedIdentifier(#98, .F., ''Boolean'', ());
#40=LwsQualifiedIdentifier(#131, .F., ''Boolean'', ());
#41=LwsExceptionDeclaration(#71, (''List_Exception''));
#42=LwsObjectDeclaration(#71, (''Empty_Node''), .F., .T., #58, $);
#43=LwsFunctionDeclaration(#71, (#132), .F., #75, #28);
#44=LwsGenericFormalType(#25, #115);
#45=LwsPackageDeclaration(#25, #34, #20);
#46=LwsProcedureDeclaration(#71, (#48, #11, #10), .F., #114);
#47=LwsQualifiedIdentifier(#65, .F., ''List_Node'', ());
#48=LwsFormalParameter(#46, (''To_List''), .inputMode., #21, $);
#49=LwsProcedureDeclaration(#71, (#12, #15), .F., #69);
#50=LwsQualifiedIdentifier(#62, .F., ''List_Node'', ());
#51=LwsPrivateTypeDefinition(#115, .F., .F.);
#52=LwsFormalParameter(#26, (''The_Node''), .inputOutputMode., #27, $);
#53=LwsFormalParameter(#55, (''To_List''), .inputMode., #61, $);
#54=LwsFormalParameter(#88, (''New_Node''), .outputMode., #35, $);
#55=LwsProcedureDeclaration(#71, (#53, #106, #24), .F., #37);
#56=LwsFormalParameter(#88, (''New_Value''), .inputMode., #36, $);
#57=LwsFormalParameter(#62, (''From_Node''), .inputMode., #38, $);
#58=LwsSubtypeIndication(#42, #2, $);
#59=LwsQualifiedIdentifier(#73, .F., ''Item_To_Manage'', ());
#60=LwsQualifiedIdentifier(#84, .F., ''Item_To_Manage'', ());
#61=LwsQualifiedIdentifier(#53, .F., ''List_Node'', ());
#62=LwsFunctionDeclaration(#71, (#57, #98), .F., #64, #50);
#63=LwsQualifiedIdentifier(#87, .F., ''Item_To_Manage'', ());
#64=LwsCompoundName(#62, (''Travel_Node''));
#65=LwsFormalParameter(#130, (''Current_Node''), .inputMode., #47, $);
#66=LwsQualifiedIdentifier(#81, .F., ''List_Node'', ());
#67=LwsFullTypeDeclaration(#1, ''List_Node'', $, #7);
#68=LwsProcedureDeclaration(#71, (#31), .F., #78);
#69=LwsCompoundName(#49, (''Update_Node''));
#70=LwsCompoundName(#88, (''Insert_Node''));
#71=LwsPackagePart(#20, (#16, #42, #41, #117, #68, #93, #46, #88, #55, #26, #112, #121, #49, #62, #108, #74, #43, #81, #130, #73, #13));
#72=LwsCompoundName(#108, (''Find_Node''));
#73=LwsFunctionDeclaration(#71, (#32), .F., #18, #59);
#74=LwsProcedureDeclaration(#71, (#100), .F., #19);
#75=LwsCompoundName(#43, (''Find_First_Node''));
#76=LwsCompoundName(#93, (''Terminate_List''));
#77=LwsParsingResult($, (#92), $);
#78=LwsCompoundName(#68, (''Initialize_List''));
#79=LwsQualifiedIdentifier(#100, .F., ''List_Node'', ());
#80=LwsSubtypeIndication(#7, #30, $);
#81=LwsFunctionDeclaration(#71, (#8), .F., #89, #66);
#82=LwsCompoundName(#26, (''Delete_Node''));
#83=LwsQualifiedIdentifier(#107, .F., ''Item_To_Manage'', ());
#84=LwsFormalParameter(#95, (''Illegal_Value''), $, #60, $);
#85=LwsQualifiedIdentifier(#106, .F., ''List_Node'', ());
#86=LwsQualifiedIdentifier(#105, .F., ''List_Node'', ());
#87=LwsFormalParameter(#121, (''Old_Value''), .inputMode., #63, $);
#88=LwsProcedureDeclaration(#71, (#125, #56, #54), .F., #70);
#89=LwsCompoundName(#81, (''Find_Last_Node''));
#90=LwsQualifiedIdentifier(#110, .F., ''List_Node'', ());
#91=LwsQualifiedIdentifier(#14, .F., ''List_Node'', ());
#92=LwsUnit(#77, .F., (), #25);
#93=LwsProcedureDeclaration(#71, (#9), .F., #76);
#94=LwsQualifiedIdentifier(#116, .F., ''List_Node'', ());
#95=LwsGenericFormalParameter(#25, #84);
#96=LwsQualifiedIdentifier(#108, .F., ''List_Node'', ());
#97=LwsQualifiedIdentifier(#123, .F., ''List_Node'', ());
#98=LwsFormalParameter(#62, (''Do_Forward''), .inputMode., #39, #126);
#99=LwsQualifiedIdentifier(#125, .F., ''List_Node'', ());
#100=LwsFormalParameter(#74, (''To_Node''), .outputMode., #79, $);
#101=LwsIncompleteTypeDeclaration(#1, ''List_Item'', $);
#102=LwsPrivateTypeDefinition(#16, .F., .F.);
#103=LwsCompoundName(#13, (''Swap_Nodes''));
#104=LwsQualifiedIdentifier(#129, .F., ''List_Node'', ());
#105=LwsFormalParameter(#112, (''The_Node''), .inputMode., #86, $);
#106=LwsFormalParameter(#55, (''To_Node''), .inputMode., #85, $);
#107=LwsFormalParameter(#108, (''Old_Value''), .inputMode., #83, $);
#108=LwsFunctionDeclaration(#71, (#129, #107), .F., #72, #96);
#109=LwsQualifiedIdentifier(#132, .F., ''List_Node'', ());
#110=LwsFormalParameter(#13, (''Second_Node''), .inputOutputMode., #90, $);
#111=LwsObjectDeclaration(#1, (''Empty_Node''), .F., .T., #14, #113);
#112=LwsProcedureDeclaration(#71, (#105, #116), .F., #6);
#113=LwsNullLiteral(#111, .F., ''null'');
#114=LwsCompoundName(#46, (''Append_Node''));
#115=LwsPrivateTypeDeclaration(#44, ''ITEM_TO_MANAGE'', $, #51, #51);
#116=LwsFormalParameter(#112, (''New_List''), .inputOutputMode., #94, $);
#117=LwsExceptionDeclaration(#71, (''Empty_List_After_Deletion''));
#118=LwsQualifiedIdentifier(#12, .F., ''List_Node'', ());
#119=LwsQualifiedIdentifier(#130, .F., ''List_Node'', ());
#120=LwsQualifiedIdentifier(#11, .F., ''Item_To_Manage'', ());
#121=LwsProcedureDeclaration(#71, (#33, #87), .F., #17);
#122=LwsQualifiedIdentifier(#131, .F., ''True'', ());
#123=LwsFormalParameter(#13, (''First_Node''), .inputOutputMode., #97, $);
#124=LwsQualifiedIdentifier(#15, .F., ''Item_To_Manage'', ());
#125=LwsFormalParameter(#88, (''To_Node''), .inputMode., #99, $);
#126=LwsQualifiedIdentifier(#98, .F., ''True'', ());
#127=LwsCompoundName(#130, (''Find_Next_Node''));
#128=LwsQualifiedIdentifier(#24, .F., ''List_Node'', ());
#129=LwsFormalParameter(#108, (''Inside_List''), .inputMode., #104, $);
#130=LwsFunctionDeclaration(#71, (#65, #131), .F., #127, #119);
#131=LwsFormalParameter(#130, (''Do_Forward''), .inputMode., #40, #122);
#132=LwsFormalParameter(#43, (''Inside_List''), .inputMode., #109, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_lockmgrAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#38, (''Dispose_lock_tree''));
#2=LwsFormalParameter(#11, (''Item_exists''), .outputMode., #95, $);
#3=LwsQualifiedIdentifier(#10, .F., ''Lock_id'', ());
#4=LwsFormalParameter(#65, (''Request_type''), .inputMode., #101, $);
#5=LwsQualifiedIdentifier(#13, .F., ''Access_type'', ());
#6=LwsQualifiedIdentifier(#20, .F., ''BOOLEAN'', ());
#7=LwsQualifiedIdentifier(#14, .F., ''Lock_id'', ());
#8=LwsPrivateTypeDefinition(#76, .F., .F.);
#9=LwsQualifiedIdentifier(#16, .F., ''Lock_id'', ());
#10=LwsFormalParameter(#20, (''The_lock''), .inputMode., #3, $);
#11=LwsProcedureDeclaration(#27, (#92, #66, #83, #86, #2), .F., #91);
#12=LwsPackagePart(#71, (#41, #59, #28, #50));
#13=LwsFormalParameter(#31, (''Request_type''), .inputMode., #5, $);
#14=LwsFormalParameter(#31, (''The_lock''), .inputMode., #7, $);
#15=LwsQualifiedIdentifier(#64, .F., ''Unavailable_node'', ());
#16=LwsFormalParameter(#36, (''The_lock''), .inputMode., #9, $);
#17=LwsQualifiedIdentifier(#23, .F., ''BOOLEAN'', ());
#18=LwsQualifiedIdentifier(#24, .F., ''Unavailable_access'', ());
#19=LwsStringEnumerationId(#68, ''Unlocked'');
#20=LwsFunctionDeclaration(#27, (#10, #49), .F., #63, #6);
#21=LwsStringEnumerationId(#68, ''Locked_exclusive'');
#22=LwsQualifiedIdentifier(#36, .F., ''Lock_status'', ());
#23=LwsFormalParameter(#29, (''Item_exists''), .outputMode., #17, $);
#24=LwsFormalParameter(#31, (''Locked_list_ptr''), .outputMode., #18, $);
#25=LwsCompoundName(#29, (''Find_first_element''));
#26=LwsEnumerationType(#43, (#99, #52));
#27=LwsPackagePart(#71, (#76, #61, #43, #72, #96, #84, #38, #65, #20, #31, #102, #36, #29, #11, #93, #54));
#28=LwsIncompleteTypeDeclaration(#12, ''Unavailable_node'', $);
#29=LwsProcedureDeclaration(#27, (#47, #51, #40, #23), .F., #25);
#30=LwsQualifiedIdentifier(#39, .F., ''Lock_id'', ());
#31=LwsProcedureDeclaration(#27, (#14, #13, #24, #75), .F., #78);
#32=LwsQualifiedIdentifier(#40, .F., ''Lock_id'', ());
#33=LwsCompoundName(#55, (''Lock_manager''));
#34=LwsQualifiedIdentifier(#44, .F., ''Lock_id'', ());
#35=LwsQualifiedIdentifier(#47, .F., ''Unavailable_access'', ());
#36=LwsFunctionDeclaration(#27, (#16), .F., #53, #22);
#37=LwsQualifiedIdentifier(#83, .F., ''Unavailable_access'', ());
#38=LwsProcedureDeclaration(#27, (#100), .F., #1);
#39=LwsFormalParameter(#102, (''The_lock''), .inputMode., #30, $);
#40=LwsFormalParameter(#29, (''First_lock_id''), .outputMode., #32, $);
#41=LwsIncompleteTypeDeclaration(#12, ''Lock_node'', $);
#42=LwsPrivateTypeDefinition(#61, .F., .F.);
#43=LwsFullTypeDeclaration(#27, ''Access_type'', $, #26);
#44=LwsFormalParameter(#84, (''To_lock''), .inputMode., #34, $);
#45=LwsQualifiedIdentifier(#49, .F., ''Access_type'', ());
#46=LwsCompoundName(#65, (''Wait_request_lock''));
#47=LwsFormalParameter(#29, (''The_list_ptr''), .inputMode., #35, $);
#48=LwsQualifiedIdentifier(#97, .F., ''Lock_node'', ());
#49=LwsFormalParameter(#20, (''Request_type''), .inputMode., #45, $);
#50=LwsFullTypeDeclaration(#12, ''Unavailable_access'', $, #88);
#51=LwsFormalParameter(#29, (''First_node_ptr''), .outputMode., #98, $);
#52=LwsStringEnumerationId(#26, ''Exclusive'');
#53=LwsCompoundName(#36, (''Status_lock''));
#54=LwsExceptionDeclaration(#27, (''Invalid_list_access'', ''Invalid_lock_id'', ''Release_error''));
#55=LwsPackageDeclaration(#81, #33, #71);
#56=LwsParsingResult($, (#81), $);
#57=LwsCompoundName(#93, (''Dispose_lock_list''));
#58=LwsQualifiedIdentifier(#65, .F., ''BOOLEAN'', ());
#59=LwsFullTypeDeclaration(#12, ''Lock_id'', $, #60);
#60=LwsAccessToObject(#59, $, #97);
#61=LwsPrivateTypeDeclaration(#27, ''Unavailable_access'', $, #42, #42);
#62=LwsQualifiedIdentifier(#66, .F., ''Unavailable_access'', ());
#63=LwsCompoundName(#20, (''Nowait_request_lock''));
#64=LwsSubtypeIndication(#88, #15, $);
#65=LwsFunctionDeclaration(#27, (#85, #4), .F., #46, #58);
#66=LwsFormalParameter(#11, (''This_node_ptr''), .inputMode., #62, $);
#67=LwsQualifiedIdentifier(#75, .F., ''BOOLEAN'', ());
#68=LwsEnumerationType(#72, (#19, #90, #21));
#69=LwsCompoundName(#84, (''Add_sub_lock''));
#70=LwsQualifiedIdentifier(#84, .F., ''Lock_id'', ());
#71=LwsPackageDefinition(#55, #27, #12);
#72=LwsFullTypeDeclaration(#27, ''Lock_status'', $, #68);
#73=LwsQualifiedIdentifier(#87, .F., ''Unavailable_access'', ());
#74=LwsQualifiedIdentifier(#86, .F., ''Lock_id'', ());
#75=LwsFormalParameter(#31, (''Lock_acquired''), .outputMode., #67, $);
#76=LwsPrivateTypeDeclaration(#27, ''Lock_id'', $, #8, #8);
#77=LwsQualifiedIdentifier(#85, .F., ''Lock_id'', ());
#78=LwsCompoundName(#31, (''Nowait_request_lock''));
#79=LwsCompoundName(#102, (''Release_lock''));
#80=LwsQualifiedIdentifier(#96, .F., ''Lock_id'', ());
#81=LwsUnit(#56, .F., (), #55);
#82=LwsQualifiedIdentifier(#92, .F., ''Unavailable_access'', ());
#83=LwsFormalParameter(#11, (''Next_node_ptr''), .outputMode., #37, $);
#84=LwsFunctionDeclaration(#27, (#44), .F., #69, #70);
#85=LwsFormalParameter(#65, (''The_lock''), .inputMode., #77, $);
#86=LwsFormalParameter(#11, (''Next_lock_id''), .outputMode., #74, $);
#87=LwsFormalParameter(#93, (''The_list_ptr''), .inputOutputMode., #73, $);
#88=LwsAccessToObject(#50, $, #64);
#89=LwsCompoundName(#96, (''New_lock_tree''));
#90=LwsStringEnumerationId(#68, ''Locked_non_exclusive'');
#91=LwsCompoundName(#11, (''Find_next_element''));
#92=LwsFormalParameter(#11, (''The_list_ptr''), .inputMode., #82, $);
#93=LwsProcedureDeclaration(#27, (#87), .F., #57);
#94=LwsQualifiedIdentifier(#100, .F., ''Lock_id'', ());
#95=LwsQualifiedIdentifier(#2, .F., ''BOOLEAN'', ());
#96=LwsFunctionDeclaration(#27, (), .F., #89, #80);
#97=LwsSubtypeIndication(#60, #48, $);
#98=LwsQualifiedIdentifier(#51, .F., ''Unavailable_access'', ());
#99=LwsStringEnumerationId(#26, ''Non_exclusive'');
#100=LwsFormalParameter(#38, (''The_lock''), .inputMode., #94, $);
#101=LwsQualifiedIdentifier(#4, .F., ''Access_type'', ());
#102=LwsProcedureDeclaration(#27, (#39), .F., #79);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_oneClassadb [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsSubtypeIndication(#3, #43, $);
#2=LwsAggregate(#31, .F., (#32));
#3=LwsObjectDeclaration(#90, (''Cc''), .F., .F., #1, $);
#4=LwsQualifiedIdentifier(#68, .F., ''Put'', (#12));
#5=LwsQualifiedIdentifier(#15, .F., ''C'', ());
#6=LwsCompoundName(#24, (''Print_It''));
#7=LwsProcedureCall(#29, (), #27);
#8=LwsNullRecordType(#38, .F., .F., .F.);
#9=LwsProcedureDeclaration(#90, (#51), .F., #75);
#10=LwsStringLiteral(#83, .F., ''I am a C'');
#11=LwsArgumentsSelector(#54, #79);
#12=LwsArgumentsSelector(#4, #83);
#13=LwsProcedureDeclaration(#90, (), .F., #21);
#14=LwsProcedureDeclaration(#93, (#71), .F., #53);
#15=LwsFormalParameter(#89, (''Cc''), .inputMode., #5, $);
#16=LwsQualifiedIdentifier(#26, .F., ''Print'', (#19));
#17=LwsQualifiedIdentifier(#61, .F., ''Print_It'', (#69));
#18=LwsQualifiedIdentifier(#73, .F., ''B'', ());
#19=LwsArgumentsSelector(#16, #88);
#20=LwsProcedureDeclaration(#49, (#39), .F., #59);
#21=LwsCompoundName(#13, (''OneClass''));
#22=LwsSubtypeIndication(#50, #58, $);
#23=LwsQualifiedIdentifier(#55, .F., ''New_Line'', ());
#24=LwsProcedureDeclaration(#28, (#77), .F., #6);
#25=LwsBlockBody(#49, (#30, #52), ());
#26=LwsProcedureCall(#84, (), #16);
#27=LwsQualifiedIdentifier(#7, .F., ''Print_It'', (#74));
#28=LwsSubprogramBody(#90, (), #24, #84);
#29=LwsBlockBody(#90, (#61, #7), ());
#30=LwsProcedureCall(#25, (), #54);
#31=LwsArgumentsSelector(#64, #2);
#32=LwsStringLiteral(#2, .F., ''I am a B'');
#33=LwsProcedureDeclaration(#90, (#70), .F., #92);
#34=LwsQualifiedIdentifier(#39, .F., ''A'', ());
#35=LwsQualifiedIdentifier(#67, .F., ''New_Line'', ());
#36=LwsFullTypeDeclaration(#90, ''A'', $, #42);
#37=LwsQualifiedIdentifier(#77, .F., ''A'', ());
#38=LwsDerivedType(#94, #96, .F., #8);
#39=LwsFormalParameter(#20, (''Aa''), .inputMode., #34, $);
#40=LwsCompoundName(#89, (''Print''));
#41=LwsQualifiedIdentifier(#96, .F., ''A'', ());
#42=LwsNullRecordType(#36, .T., .F., .F.);
#43=LwsQualifiedIdentifier(#1, .F., ''C'', ());
#44=LwsAggregate(#69, .F., (#45));
#45=LwsQualifiedIdentifier(#44, .F., ''Bb'', ());
#46=LwsQualifiedIdentifier(#51, .F., ''A'', ());
#47=LwsAggregate(#74, .F., (#48));
#48=LwsQualifiedIdentifier(#47, .F., ''Cc'', ());
#49=LwsSubprogramBody(#90, (), #20, #25);
#50=LwsDerivedType(#57, #22, .F., #80);
#51=LwsFormalParameter(#9, (''Aa''), .inputMode., #46, $);
#52=LwsProcedureCall(#25, (), #82);
#53=LwsCompoundName(#14, (''Print''));
#54=LwsQualifiedIdentifier(#30, .F., ''Put'', (#11));
#55=LwsProcedureCall(#76, (), #23);
#56=LwsCompoundName(#85, (''Print''));
#57=LwsFullTypeDeclaration(#90, ''B'', $, #50);
#58=LwsQualifiedIdentifier(#22, .F., ''A'', ());
#59=LwsCompoundName(#20, (''Print''));
#60=LwsProcedureCall(#76, (), #64);
#61=LwsProcedureCall(#29, (), #17);
#62=LwsUnit(#78, .F., (), #90);
#63=LwsStringLiteral(#79, .F., ''I am an A'');
#64=LwsQualifiedIdentifier(#60, .F., ''Put'', (#31));
#65=LwsQualifiedIdentifier(#71, .F., ''B'', ());
#66=LwsQualifiedIdentifier(#70, .F., ''C'', ());
#67=LwsProcedureCall(#87, (), #35);
#68=LwsProcedureCall(#87, (), #4);
#69=LwsArgumentsSelector(#17, #44);
#70=LwsFormalParameter(#33, (''Cc''), .inputMode., #66, $);
#71=LwsFormalParameter(#14, (''Bb''), .inputMode., #65, $);
#72=LwsSubprogramBody(#90, (), #89, #87);
#73=LwsSubtypeIndication(#95, #18, $);
#74=LwsArgumentsSelector(#27, #47);
#75=LwsCompoundName(#9, (''Print''));
#76=LwsBlockBody(#93, (#60, #55), ());
#77=LwsFormalParameter(#24, (''Aa''), .inputMode., #37, $);
#78=LwsParsingResult($, (#62), $);
#79=LwsAggregate(#11, .F., (#63));
#80=LwsNullRecordType(#50, .F., .F., .F.);
#81=LwsQualifiedIdentifier(#86, .F., ''B'', ());
#82=LwsQualifiedIdentifier(#52, .F., ''New_Line'', ());
#83=LwsAggregate(#12, .F., (#10));
#84=LwsBlockBody(#28, (#26), ());
#85=LwsProcedureDeclaration(#90, (#86), .F., #56);
#86=LwsFormalParameter(#85, (''Bb''), .inputMode., #81, $);
#87=LwsBlockBody(#72, (#68, #67), ());
#88=LwsAggregate(#19, .F., (#91));
#89=LwsProcedureDeclaration(#72, (#15), .F., #40);
#90=LwsSubprogramBody(#62, (#36, #9, #49, #57, #85, #93, #94, #33, #72, #28, #95, #3), #13, #29);
#91=LwsQualifiedIdentifier(#88, .F., ''Aa'', ());
#92=LwsCompoundName(#33, (''Print''));
#93=LwsSubprogramBody(#90, (), #14, #76);
#94=LwsFullTypeDeclaration(#90, ''C'', $, #38);
#95=LwsObjectDeclaration(#90, (''Bb''), .F., .F., #73, $);
#96=LwsSubtypeIndication(#38, #41, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_primesBySeive [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsUseClause(#5, (#98), (#98));
#2=LwsComponentAssociation(#18, #131, (#114));
#3=LwsParsingResult($, (#42), $);
#4=LwsDecimalLiteral(#120, .F., ''0'');
#5=LwsUnitInterface(#42, #26, (#1));
#6=LwsSubtypeIndication(#88, #94, $);
#7=LwsDecimalLiteral(#91, .F., ''2'');
#8=LwsGreaterThanExpression(#133, .F., #56, #34);
#9=LwsSubprogramBody(#42, (#10, #40), #83, #38);
#10=LwsFullTypeDeclaration(#9, ''Sieve_Arr_Type'', $, #71);
#11=LwsStringLiteral(#45, .F., ''Prime Search Maximum: '');
#12=LwsExplicitRange(#52, .F., #66, #115);
#13=LwsQualifiedIdentifier(#43, .F., ''Sieve_Arr_Type'', (#44));
#14=LwsDecimalLiteral(#75, .F., ''1'');
#15=LwsAggregate(#67, .F., (#92));
#16=LwsQualifiedIdentifier(#64, .F., ''Integer'', ());
#17=LwsArgumentsSelector(#80, #102);
#18=LwsAggregate(#113, .F., (#2));
#19=LwsObjectDeclaration(#135, (''Maybe_Prime'', ''Multiple''), .F., .F., #97, $);
#20=LwsQualifiedIdentifier(#51, .F., ''Max'', ());
#21=LwsQualifiedIdentifier(#24, .F., ''Maybe_Prime'', ());
#22=LwsExplicitRange(#114, .F., #117, #125);
#23=LwsProcedureCall(#127, (), #37);
#24=LwsMultExpression(#90, .F., #69, #21);
#25=LwsProcedureCall(#133, (), #108);
#26=LwsWithClause(#5, (#30), (#30));
#27=LwsQualifiedIdentifier(#102, .F., ''Maybe_Prime'', ());
#28=LwsProcedureCall(#116, (), #65);
#29=LwsQualifiedIdentifier(#75, .F., ''Line_Count'', ());
#30=LwsCompoundName(#26, (''Gnat'', ''Io''));
#31=LwsProcedureCall(#38, (), #61);
#32=LwsStringLiteral(#81, .F., '' '');
#33=LwsQualifiedIdentifier(#120, .F., ''Line_Count'', ());
#34=LwsDecimalLiteral(#8, .F., ''0'');
#35=LwsQualifiedIdentifier(#47, .F., ''Put'', (#100));
#36=LwsQualifiedIdentifier(#73, .F., ''Maybe_Prime'', ());
#37=LwsQualifiedIdentifier(#23, .F., ''Put'', (#134));
#38=LwsBlockBody(#9, (#47, #31, #135), ());
#39=LwsQualifiedIdentifier(#110, .F., ''IsPrime'', (#67));
#40=LwsObjectDeclaration(#9, (''Max''), .F., .F., #64, $);
#41=LwsWhileIteration(#112, #84);
#42=LwsUnit(#3, .F., (#5), #9);
#43=LwsSubtypeIndication(#113, #13, $);
#44=LwsArgumentsSelector(#13, #130);
#45=LwsAggregate(#100, .F., (#11));
#46=LwsDecimalLiteral(#59, .F., ''0'');
#47=LwsProcedureCall(#38, (), #35);
#48=LwsAggregate(#103, .F., (#87));
#49=LwsQualifiedIdentifier(#97, .F., ''Integer'', ());
#50=LwsQualifiedIdentifier(#110, .F., ''False'', ());
#51=LwsExplicitRange(#130, .F., #78, #20);
#52=LwsMembershipIteration(#111, ''Maybe_Prime'', .F., #12);
#53=LwsLoopStatement(#119, (), $, #95, (#68));
#54=LwsQualifiedIdentifier(#126, .F., ''IsPrime'', (#129));
#55=LwsAggregate(#107, .F., (#74));
#56=LwsQualifiedIdentifier(#8, .F., ''Line_Count'', ());
#57=LwsQualifiedIdentifier(#91, .F., ''Max'', ());
#58=LwsQualifiedIdentifier(#105, .F., ''Line_Max'', ());
#59=LwsAssignment(#119, (), #72, #46);
#60=LwsIfClause(#62, #80, (#90, #112));
#61=LwsQualifiedIdentifier(#31, .F., ''Get'', (#103));
#62=LwsIfStatement(#111, (), (#60), $);
#63=LwsProcedureCall(#126, (), #106);
#64=LwsSubtypeIndication(#40, #16, $);
#65=LwsQualifiedIdentifier(#28, .F., ''New_Line'', ());
#66=LwsDecimalLiteral(#12, .F., ''2'');
#67=LwsArgumentsSelector(#39, #15);
#68=LwsIfStatement(#53, (), (#126), $);
#69=LwsDecimalLiteral(#24, .F., ''2'');
#70=LwsAssignment(#112, (), #86, #122);
#71=LwsArrayType(#10, (#76), #88);
#72=LwsQualifiedIdentifier(#59, .F., ''Line_Count'', ());
#73=LwsAggregate(#129, .F., (#36));
#74=LwsQualifiedIdentifier(#55, .F., ''Maybe_Prime'', ());
#75=LwsPlusExpression(#128, .F., #29, #14);
#76=LwsIndex(#71, #77);
#77=LwsQualifiedIdentifier(#76, .F., ''Integer'', ());
#78=LwsDecimalLiteral(#51, .F., ''2'');
#79=LwsObjectDeclaration(#135, (''Line_Count''), .F., .F., #132, $);
#80=LwsQualifiedIdentifier(#60, .F., ''IsPrime'', (#17));
#81=LwsAggregate(#134, .F., (#32));
#82=LwsQualifiedIdentifier(#132, .F., ''Integer'', ());
#83=LwsProcedureDeclaration(#9, (), .F., #93);
#84=LwsLessEqualExpression(#41, .F., #96, #123);
#85=LwsIfStatement(#119, (), (#133), $);
#86=LwsQualifiedIdentifier(#70, .F., ''Multiple'', ());
#87=LwsQualifiedIdentifier(#48, .F., ''Max'', ());
#88=LwsComponentSubtype(#71, .F., #6);
#89=LwsNumberDeclaration(#135, (''Line_Max''), #101);
#90=LwsAssignment(#60, (), #104, #24);
#91=LwsExplicitRange(#95, .F., #7, #57);
#92=LwsQualifiedIdentifier(#15, .F., ''Multiple'', ());
#93=LwsCompoundName(#83, (''Sieve''));
#94=LwsQualifiedIdentifier(#6, .F., ''Boolean'', ());
#95=LwsMembershipIteration(#53, ''Maybe_Prime'', .F., #91);
#96=LwsQualifiedIdentifier(#84, .F., ''Multiple'', ());
#97=LwsSubtypeIndication(#19, #49, $);
#98=LwsQualifiedIdentifier(#1, .F., ''Gnat'', (#121));
#99=LwsQualifiedIdentifier(#122, .F., ''Multiple'', ());
#100=LwsArgumentsSelector(#35, #45);
#101=LwsDecimalLiteral(#89, .F., ''12'');
#102=LwsAggregate(#17, .F., (#27));
#103=LwsArgumentsSelector(#61, #48);
#104=LwsQualifiedIdentifier(#90, .F., ''Multiple'', ());
#105=LwsGreaterEqualExpression(#116, .F., #109, #58);
#106=LwsQualifiedIdentifier(#63, .F., ''Put'', (#107));
#107=LwsArgumentsSelector(#106, #55);
#108=LwsQualifiedIdentifier(#25, .F., ''New_Line'', ());
#109=LwsQualifiedIdentifier(#105, .F., ''Line_Count'', ());
#110=LwsAssignment(#112, (), #39, #50);
#111=LwsLoopStatement(#119, (), $, #52, (#62));
#112=LwsLoopStatement(#60, (), $, #41, (#110, #70));
#113=LwsObjectDeclaration(#135, (''IsPrime''), .F., .F., #43, #18);
#114=LwsRangeChoice(#2, #22);
#115=LwsQualifiedIdentifier(#12, .F., ''Max'', ());
#116=LwsIfClause(#127, #105, (#28, #120));
#117=LwsDecimalLiteral(#22, .F., ''2'');
#118=LwsQualifiedIdentifier(#128, .F., ''Line_Count'', ());
#119=LwsBlockBody(#135, (#111, #59, #53, #85), ());
#120=LwsAssignment(#116, (), #33, #4);
#121=LwsNamedSelector(#98, ''Io'');
#122=LwsPlusExpression(#70, .F., #99, #124);
#123=LwsQualifiedIdentifier(#84, .F., ''Max'', ());
#124=LwsQualifiedIdentifier(#122, .F., ''Maybe_Prime'', ());
#125=LwsQualifiedIdentifier(#22, .F., ''Max'', ());
#126=LwsIfClause(#68, #54, (#127, #63, #128));
#127=LwsIfStatement(#126, (), (#116), (#23));
#128=LwsAssignment(#126, (), #118, #75);
#129=LwsArgumentsSelector(#54, #73);
#130=LwsAggregate(#44, .F., (#51));
#131=LwsQualifiedIdentifier(#2, .F., ''True'', ());
#132=LwsSubtypeIndication(#79, #82, $);
#133=LwsIfClause(#85, #8, (#25));
#134=LwsArgumentsSelector(#37, #81);
#135=LwsBlockStatement(#38, (), $, (#89, #113, #19, #79), #119);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_rlockmgrAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#120, .F., ''Lock_id'', ());
#2=LwsGenericFormalParameter(#23, #84);
#3=LwsFunctionDeclaration(#27, (#120, #4, #68), .F., #43, #81);
#4=LwsFormalParameter(#3, (''The_user''), .inputMode., #9, $);
#5=LwsFormalParameter(#56, (''The_lock''), .inputMode., #10, $);
#6=LwsFormalParameter(#61, (''Time_limit''), .inputMode., #12, $);
#7=LwsCompoundName(#121, (''Release_lock''));
#8=LwsQualifiedIdentifier(#61, .F., ''BOOLEAN'', ());
#9=LwsQualifiedIdentifier(#4, .F., ''Lock_user_id'', ());
#10=LwsQualifiedIdentifier(#5, .F., ''Lock_id'', ());
#11=LwsFormalParameter(#106, (''The_user''), .inputMode., #16, $);
#12=LwsQualifiedIdentifier(#6, .F., ''DURATION'', ());
#13=LwsFormalParameter(#121, (''The_lock''), .inputMode., #17, $);
#14=LwsFormalParameter(#39, (''To_lock''), .inputMode., #20, $);
#15=LwsCompoundName(#61, (''Wait_request_lock''));
#16=LwsQualifiedIdentifier(#11, .F., ''Lock_user_id'', ());
#17=LwsQualifiedIdentifier(#13, .F., ''Lock_id'', ());
#18=LwsFullTypeDeclaration(#27, ''Access_type'', $, #44);
#19=LwsCompoundName(#72, (''New_lock_user''));
#20=LwsQualifiedIdentifier(#14, .F., ''Lock_id'', ());
#21=LwsFormalParameter(#32, (''The_lock''), .inputMode., #33, $);
#22=LwsFormalParameter(#106, (''The_lock''), .inputMode., #35, $);
#23=LwsGenericPackageDeclaration(#49, (#2), #24, #24);
#24=LwsPackageDeclaration(#23, #71, #92);
#25=LwsFormalParameter(#121, (''The_user''), .inputMode., #37, $);
#26=LwsQualifiedIdentifier(#122, .F., ''Lock_user_id'', ());
#27=LwsPackagePart(#92, (#28, #96, #18, #116, #85, #39, #112, #72, #52, #32, #3, #61, #106, #36, #121, #56, #59));
#28=LwsPrivateTypeDeclaration(#27, ''Lock_user_id'', $, #50, #50);
#29=LwsQualifiedIdentifier(#93, .F., ''Lock_manager'', (#83));
#30=LwsNamedSelector(#94, ''Access_type'');
#31=LwsNamedSelector(#117, ''Lock_status'');
#32=LwsFunctionDeclaration(#27, (#21, #34, #87), .F., #75, #109);
#33=LwsQualifiedIdentifier(#21, .F., ''Lock_id'', ());
#34=LwsFormalParameter(#32, (''The_user''), .inputMode., #41, $);
#35=LwsQualifiedIdentifier(#22, .F., ''Lock_id'', ());
#36=LwsProcedureDeclaration(#27, (#89, #91, #70), .F., #80);
#37=LwsQualifiedIdentifier(#25, .F., ''Lock_user_id'', ());
#38=LwsQualifiedIdentifier(#72, .F., ''Lock_user_id'', ());
#39=LwsFunctionDeclaration(#27, (#14), .F., #86, #118);
#40=LwsSubtypeIndication(#44, #94, $);
#41=LwsQualifiedIdentifier(#34, .F., ''Lock_user_id'', ());
#42=LwsSubtypeIndication(#46, #117, $);
#43=LwsCompoundName(#3, (''Nowait_request_lock''));
#44=LwsDerivedType(#18, #40, .F., $);
#45=LwsQualifiedIdentifier(#85, .F., ''Lock_id'', ());
#46=LwsDerivedType(#116, #42, .F., $);
#47=LwsFormalParameter(#61, (''Request_type''), .inputMode., #48, $);
#48=LwsQualifiedIdentifier(#47, .F., ''Access_type'', ());
#49=LwsUnit(#73, .F., (#114, #107), #23);
#50=LwsPrivateTypeDefinition(#28, .F., .F.);
#51=LwsCompoundName(#112, (''Dispose_lock_tree''));
#52=LwsProcedureDeclaration(#27, (#108), .F., #105);
#53=LwsCompoundName(#106, (''Nowait_request_lock''));
#54=LwsFormalParameter(#106, (''Time_limit''), .inputMode., #55, $);
#55=LwsQualifiedIdentifier(#54, .F., ''DURATION'', ());
#56=LwsFunctionDeclaration(#27, (#5, #122), .F., #57, #113);
#57=LwsCompoundName(#56, (''Status_lock''));
#58=LwsFormalParameter(#112, (''The_lock''), .inputMode., #67, $);
#59=LwsExceptionDeclaration(#27, (''Deadlock_prone_lock_request'', ''Invalid_lock_id'', ''Invalid_lmgr_user_id'', ''No_timed_lock_requests''));
#60=LwsPackagePart(#92, (#62));
#61=LwsFunctionDeclaration(#27, (#98, #104, #47, #6), .F., #15, #8);
#62=LwsFullTypeDeclaration(#60, ''Lock_user_id'', $, #63);
#63=LwsDerivedType(#62, #64, .F., $);
#64=LwsSubtypeIndication(#63, #100, $);
#65=LwsCompoundName(#78, (''CALENDAR''));
#66=LwsWithClause(#107, (#79), (#79));
#67=LwsQualifiedIdentifier(#58, .F., ''Lock_id'', ());
#68=LwsFormalParameter(#3, (''Request_type''), .inputMode., #76, $);
#69=LwsQualifiedIdentifier(#106, .F., ''BOOLEAN'', ());
#70=LwsFormalParameter(#36, (''Time_limit''), .inputMode., #77, $);
#71=LwsCompoundName(#24, (''Reliable_lock_manager''));
#72=LwsFunctionDeclaration(#27, (), .F., #19, #38);
#73=LwsParsingResult($, (#49), $);
#74=LwsQualifiedIdentifier(#84, .F., ''BOOLEAN'', ());
#75=LwsCompoundName(#32, (''Wait_request_lock''));
#76=LwsQualifiedIdentifier(#68, .F., ''Access_type'', ());
#77=LwsQualifiedIdentifier(#70, .F., ''DURATION'', ());
#78=LwsWithClause(#114, (#65), (#65));
#79=LwsCompoundName(#66, (''Lock_Manager''));
#80=LwsCompoundName(#36, (''Change_time_limit''));
#81=LwsQualifiedIdentifier(#3, .F., ''BOOLEAN'', ());
#82=LwsCompoundName(#85, (''New_lock_tree''));
#83=LwsNamedSelector(#29, ''lock_id'');
#84=LwsFormalParameter(#2, (''Bandit_checking'', ''Deadlock_checking'', ''Timed_requests''), $, #74, #115);
#85=LwsFunctionDeclaration(#27, (), .F., #82, #45);
#86=LwsCompoundName(#39, (''Add_sub_lock''));
#87=LwsFormalParameter(#32, (''Request_type''), .inputMode., #95, $);
#88=LwsFormalParameter(#106, (''Request_type''), .inputMode., #99, $);
#89=LwsFormalParameter(#36, (''The_lock''), .inputMode., #90, $);
#90=LwsQualifiedIdentifier(#89, .F., ''Lock_id'', ());
#91=LwsFormalParameter(#36, (''The_user''), .inputMode., #101, $);
#92=LwsPackageDefinition(#24, #27, #60);
#93=LwsSubtypeIndication(#97, #29, $);
#94=LwsQualifiedIdentifier(#40, .F., ''Lock_manager'', (#30));
#95=LwsQualifiedIdentifier(#87, .F., ''Access_type'', ());
#96=LwsFullTypeDeclaration(#27, ''Lock_id'', $, #97);
#97=LwsDerivedType(#96, #93, .F., $);
#98=LwsFormalParameter(#61, (''The_lock''), .inputMode., #102, $);
#99=LwsQualifiedIdentifier(#88, .F., ''Access_type'', ());
#100=LwsQualifiedIdentifier(#64, .F., ''TIME'', ());
#101=LwsQualifiedIdentifier(#91, .F., ''Lock_user_id'', ());
#102=LwsQualifiedIdentifier(#98, .F., ''Lock_id'', ());
#103=LwsQualifiedIdentifier(#110, .F., ''CALENDAR'', ());
#104=LwsFormalParameter(#61, (''The_user''), .inputMode., #111, $);
#105=LwsCompoundName(#52, (''Release_lock_user''));
#106=LwsFunctionDeclaration(#27, (#22, #11, #88, #54), .F., #53, #69);
#107=LwsUnitInterface(#49, #66, ());
#108=LwsFormalParameter(#52, (''The_user''), .inputMode., #119, $);
#109=LwsQualifiedIdentifier(#32, .F., ''BOOLEAN'', ());
#110=LwsUseClause(#114, (#103), (#103));
#111=LwsQualifiedIdentifier(#104, .F., ''Lock_user_id'', ());
#112=LwsProcedureDeclaration(#27, (#58), .F., #51);
#113=LwsQualifiedIdentifier(#56, .F., ''Lock_status'', ());
#114=LwsUnitInterface(#49, #78, (#110));
#115=LwsQualifiedIdentifier(#84, .F., ''TRUE'', ());
#116=LwsFullTypeDeclaration(#27, ''Lock_status'', $, #46);
#117=LwsQualifiedIdentifier(#42, .F., ''Lock_manager'', (#31));
#118=LwsQualifiedIdentifier(#39, .F., ''Lock_id'', ());
#119=LwsQualifiedIdentifier(#108, .F., ''Lock_user_id'', ());
#120=LwsFormalParameter(#3, (''The_lock''), .inputMode., #1, $);
#121=LwsProcedureDeclaration(#27, (#13, #25), .F., #7);
#122=LwsFormalParameter(#56, (''The_user''), .inputMode., #26, $);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_rtskpoolAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsCompoundName(#29, (''Release_task''));
#2=LwsPrivateTypeDeclaration(#14, ''Task_type'', $, #70, #70);
#3=LwsCompoundName(#108, (''No_wait_request_task''));
#4=LwsQualifiedIdentifier(#58, .F., ''Pool_user_id'', ());
#5=LwsGenericPackageDeclaration(#9, (#14, #41, #55, #86), #6, #6);
#6=LwsPackageDeclaration(#5, #98, #93);
#7=LwsSubtypeIndication(#11, #52, $);
#8=LwsFullTypeDeclaration(#21, ''Pool_user_id'', $, #31);
#9=LwsUnit(#32, .F., (#102, #82), #5);
#10=LwsCompoundName(#47, (''The_pool''));
#11=LwsDerivedType(#110, #7, .F., $);
#12=LwsQualifiedIdentifier(#78, .F., ''Static_size'', ());
#13=LwsQualifiedIdentifier(#16, .F., ''NATURAL'', ());
#14=LwsGenericFormalType(#5, #2);
#15=LwsFormalParameter(#88, (''Valid_task''), .outputMode., #20, $);
#16=LwsFormalParameter(#41, (''Static_size''), $, #13, #50);
#17=LwsQualifiedIdentifier(#79, .F., ''Static_size'', ());
#18=LwsFormalParameter(#68, (''The_user''), .inputMode., #26, $);
#19=LwsQualifiedIdentifier(#73, .F., ''Task_designator'', ());
#20=LwsQualifiedIdentifier(#15, .F., ''BOOLEAN'', ());
#21=LwsPackagePart(#93, (#8));
#22=LwsCompoundName(#76, (''CALENDAR''));
#23=LwsFormalParameter(#88, (''The_user''), .inputMode., #36, $);
#24=LwsFormalParameter(#108, (''Valid_task''), .outputMode., #38, $);
#25=LwsExpressionChoice(#101, #96);
#26=LwsQualifiedIdentifier(#18, .F., ''Pool_user_id'', ());
#27=LwsFormalParameter(#88, (''The_task''), .outputMode., #37, $);
#28=LwsProcedureDeclaration(#42, (#39, #61, #60), .F., #92);
#29=LwsProcedureDeclaration(#42, (#57, #63), .F., #1);
#30=LwsFormalParameter(#55, (''Dynamic_limit''), $, #33, #64);
#31=LwsDerivedType(#8, #66, .F., $);
#32=LwsParsingResult($, (#9), $);
#33=LwsQualifiedIdentifier(#30, .F., ''NATURAL'', ());
#34=LwsPrivateTypeDefinition(#103, .F., .F.);
#35=LwsQualifiedIdentifier(#101, .F., ''Task_type'', ());
#36=LwsQualifiedIdentifier(#23, .F., ''Pool_user_id'', ());
#37=LwsQualifiedIdentifier(#27, .F., ''Task_designator'', ());
#38=LwsQualifiedIdentifier(#24, .F., ''BOOLEAN'', ());
#39=LwsFormalParameter(#28, (''The_user''), .inputMode., #49, $);
#40=LwsExpressionChoice(#62, #104);
#41=LwsGenericFormalParameter(#5, #16);
#42=LwsPackagePart(#93, (#47, #103, #110, #58, #68, #73, #88, #100, #108, #28, #29, #65));
#43=LwsCompoundName(#73, (''Request_task''));
#44=LwsFormalParameter(#73, (''The_user''), .inputMode., #56, $);
#45=LwsFormalParameter(#108, (''The_user''), .inputMode., #51, $);
#46=LwsFormalParameter(#108, (''Time_limit''), .inputMode., #53, $);
#47=LwsGenericPackageInstanciation(#42, #69, #10);
#48=LwsArgumentsSelector(#69, #109);
#49=LwsQualifiedIdentifier(#39, .F., ''Pool_user_id'', ());
#50=LwsDecimalLiteral(#16, .F., ''0'');
#51=LwsQualifiedIdentifier(#45, .F., ''Pool_user_id'', ());
#52=LwsQualifiedIdentifier(#7, .F., ''The_pool'', (#111));
#53=LwsQualifiedIdentifier(#46, .F., ''DURATION'', ());
#54=LwsQualifiedIdentifier(#80, .F., ''BOOLEAN'', ());
#55=LwsGenericFormalParameter(#5, #30);
#56=LwsQualifiedIdentifier(#44, .F., ''Pool_user_id'', ());
#57=LwsFormalParameter(#29, (''The_user''), .inputMode., #59, $);
#58=LwsFunctionDeclaration(#42, (), .F., #106, #4);
#59=LwsQualifiedIdentifier(#57, .F., ''Pool_user_id'', ());
#60=LwsFormalParameter(#28, (''Time_limit''), .inputMode., #74, $);
#61=LwsFormalParameter(#28, (''The_task''), .inputMode., #72, $);
#62=LwsComponentAssociation(#109, #99, (#40));
#63=LwsFormalParameter(#29, (''The_task''), .inputMode., #75, $);
#64=LwsDecimalLiteral(#30, .F., ''0'');
#65=LwsExceptionDeclaration(#42, (''Deadlock_prone_task_request'', ''Invalid_task_id'', ''Invalid_pool_user_id'', ''No_timed_task_requests''));
#66=LwsSubtypeIndication(#31, #89, $);
#67=LwsFormalParameter(#108, (''The_task''), .outputMode., #77, $);
#68=LwsProcedureDeclaration(#42, (#18), .F., #90);
#69=LwsQualifiedIdentifier(#47, .F., ''Task_pool'', (#48));
#70=LwsPrivateTypeDefinition(#2, .F., .T.);
#71=LwsQualifiedIdentifier(#100, .F., ''Task_designator'', ());
#72=LwsQualifiedIdentifier(#61, .F., ''Task_designator'', ());
#73=LwsFunctionDeclaration(#42, (#44), .F., #43, #19);
#74=LwsQualifiedIdentifier(#60, .F., ''DURATION'', ());
#75=LwsQualifiedIdentifier(#63, .F., ''Task_designator'', ());
#76=LwsWithClause(#102, (#22), (#22));
#77=LwsQualifiedIdentifier(#67, .F., ''Task_designator'', ());
#78=LwsComponentAssociation(#109, #12, (#79));
#79=LwsExpressionChoice(#78, #17);
#80=LwsFormalParameter(#86, (''Bandit_checking'', ''Deadlock_checking'', ''Timed_requests''), $, #54, #84);
#81=LwsCompoundName(#107, (''Task_pool''));
#82=LwsUnitInterface(#9, #107, ());
#83=LwsFormalParameter(#100, (''Time_limit''), .inputMode., #85, $);
#84=LwsQualifiedIdentifier(#80, .F., ''TRUE'', ());
#85=LwsQualifiedIdentifier(#83, .F., ''DURATION'', ());
#86=LwsGenericFormalParameter(#5, #80);
#87=LwsFormalParameter(#100, (''The_user''), .inputMode., #91, $);
#88=LwsProcedureDeclaration(#42, (#23, #27, #15), .F., #105);
#89=LwsQualifiedIdentifier(#66, .F., ''TIME'', ());
#90=LwsCompoundName(#68, (''Release_pool_user''));
#91=LwsQualifiedIdentifier(#87, .F., ''Pool_user_id'', ());
#92=LwsCompoundName(#28, (''Change_time_limit''));
#93=LwsPackageDefinition(#6, #42, #21);
#94=LwsQualifiedIdentifier(#97, .F., ''CALENDAR'', ());
#95=LwsCompoundName(#100, (''Request_task''));
#96=LwsQualifiedIdentifier(#25, .F., ''Task_type'', ());
#97=LwsUseClause(#102, (#94), (#94));
#98=LwsCompoundName(#6, (''Reliable_task_pool''));
#99=LwsQualifiedIdentifier(#62, .F., ''Dynamic_limit'', ());
#100=LwsFunctionDeclaration(#42, (#87, #83), .F., #95, #71);
#101=LwsComponentAssociation(#109, #35, (#25));
#102=LwsUnitInterface(#9, #76, (#97));
#103=LwsPrivateTypeDeclaration(#42, ''Pool_user_id'', $, #34, #34);
#104=LwsQualifiedIdentifier(#40, .F., ''Dynamic_limit'', ());
#105=LwsCompoundName(#88, (''No_wait_request_task''));
#106=LwsCompoundName(#58, (''New_pool_user''));
#107=LwsWithClause(#82, (#81), (#81));
#108=LwsProcedureDeclaration(#42, (#45, #67, #46, #24), .F., #3);
#109=LwsAggregate(#48, .F., (#101, #78, #62));
#110=LwsFullTypeDeclaration(#42, ''Task_designator'', $, #11);
#111=LwsNamedSelector(#52, ''Task_designator'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_screenOutput [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsWithClause(#190, (#132), (#132));
#2=LwsQualifiedIdentifier(#49, .F., ''Put'', (#87));
#3=LwsProcedureCall(#5, (), #26);
#4=LwsUnitInterface(#79, #50, (#18));
#5=LwsBlockBody(#62, (#39, #3), ());
#6=LwsQualifiedIdentifier(#81, .F., ''String'', ());
#7=LwsFormalParameter(#107, (''End_Line''), $, #21, #27);
#8=LwsQualifiedIdentifier(#175, .F., ''Put'', (#170));
#9=LwsObjectDeclaration(#98, (''Debug_On''), .F., .T., #42, #88);
#10=LwsFormalParameter(#75, (''S1''), $, #53, $);
#11=LwsStringLiteral(#163, .F., ''sdc error at line'');
#12=LwsQualifiedIdentifier(#122, .F., ''Put'', (#166));
#13=LwsQualifiedIdentifier(#38, .F., ''S1'', ());
#14=LwsAggregate(#184, .F., (#136));
#15=LwsReturnStatement(#51, (), $);
#16=LwsProcedureCall(#111, (), #31);
#17=LwsBlockBody(#171, (#121, #138, #100), ());
#18=LwsUseClause(#4, (#148), (#148));
#19=LwsCompoundName(#91, (''Syntax_Error''));
#20=LwsQualifiedIdentifier(#42, .F., ''Boolean'', ());
#21=LwsQualifiedIdentifier(#7, .F., ''Boolean'', ());
#22=LwsFormalParameter(#91, (''S''), $, #65, $);
#23=LwsProcedureCall(#105, (), #116);
#24=LwsProcedureCall(#151, (), #66);
#25=LwsAggregate(#28, .F., (#58));
#26=LwsQualifiedIdentifier(#3, .F., ''Skip_Line'', ());
#27=LwsQualifiedIdentifier(#7, .F., ''True'', ());
#28=LwsArgumentsSelector(#36, #25);
#29=LwsAggregate(#33, .F., (#64));
#30=LwsCatenationExpression(#188, .F., #56, #189);
#31=LwsQualifiedIdentifier(#16, .F., ''Put_Line'', (#101));
#32=LwsQualifiedIdentifier(#93, .F., ''Input'', (#180));
#33=LwsArgumentsSelector(#116, #29);
#34=LwsNamedSelector(#57, ''Line_Number'');
#35=LwsQualifiedIdentifier(#121, .F., ''Put'', (#119));
#36=LwsQualifiedIdentifier(#178, .F., ''Put'', (#28));
#37=LwsQualifiedIdentifier(#74, .F., ''Put'', (#144));
#38=LwsAggregate(#46, .F., (#13));
#39=LwsProcedureCall(#5, (), #131);
#40=LwsMembershipIteration(#105, ''I'', .F., #69);
#41=LwsQualifiedIdentifier(#192, .F., ''New_Line'', ());
#42=LwsSubtypeIndication(#9, #20, $);
#43=LwsQualifiedIdentifier(#138, .F., ''Put'', (#126));
#44=LwsCompoundName(#145, (''Debug_Msg''));
#45=LwsProcedureCall(#168, (), #152);
#46=LwsArgumentsSelector(#152, #38);
#47=LwsQualifiedIdentifier(#97, .F., ''Natural'', ());
#48=LwsEqualExpression(#130, .F., #76, #118);
#49=LwsProcedureCall(#111, (), #2);
#50=LwsWithClause(#4, (#85), (#85));
#51=LwsIfClause(#90, #196, (#15));
#52=LwsCompoundName(#75, (''Error_Msg''));
#53=LwsQualifiedIdentifier(#10, .F., ''String'', ());
#54=LwsAggregate(#59, .F., (#57));
#55=LwsStringLiteral(#191, .F., '''');
#56=LwsQualifiedIdentifier(#30, .F., ''NaturalImage'', (#59));
#57=LwsQualifiedIdentifier(#54, .F., ''Input'', (#34));
#58=LwsStringLiteral(#25, .F., ''sdc:'');
#59=LwsArgumentsSelector(#56, #54);
#60=LwsQualifiedIdentifier(#67, .F., ''Put'', (#77));
#61=LwsObjectDeclaration(#115, (''Pos''), .F., .F., #97, #99);
#62=LwsSubprogramBody(#98, (), #102, #5);
#63=LwsQualifiedIdentifier(#113, .F., ''Input'', (#159));
#64=LwsStringLiteral(#29, .F., ''-'');
#65=LwsQualifiedIdentifier(#22, .F., ''String'', ());
#66=LwsQualifiedIdentifier(#24, .F., ''New_Line'', ());
#67=LwsProcedureCall(#111, (), #60);
#68=LwsMinusExpression(#69, .F., #155, #80);
#69=LwsExplicitRange(#40, .F., #181, #68);
#70=LwsStringLiteral(#177, .F., '''');
#71=LwsAggregate(#77, .F., (#110));
#72=LwsFormalParameter(#145, (''S''), $, #92, $);
#73=LwsProcedureCall(#168, (), #95);
#74=LwsProcedureCall(#168, (), #37);
#75=LwsProcedureDeclaration(#179, (#10, #81, #177), .F., #52);
#76=LwsQualifiedIdentifier(#48, .F., ''Pos'', ());
#77=LwsArgumentsSelector(#60, #71);
#78=LwsQualifiedIdentifier(#188, .F., ''S'', ());
#79=LwsUnit(#134, .F., (#4, #190), #98);
#80=LwsDecimalLiteral(#68, .F., ''1'');
#81=LwsFormalParameter(#75, (''S2''), $, #6, #167);
#82=LwsQualifiedIdentifier(#117, .F., ''S1'', ());
#83=LwsAggregate(#87, .F., (#188));
#84=LwsQualifiedIdentifier(#139, .F., ''S3'', ());
#85=LwsCompoundName(#50, (''Ada'', ''Text_IO''));
#86=LwsProcedureCall(#111, (), #165);
#87=LwsArgumentsSelector(#2, #83);
#88=LwsQualifiedIdentifier(#9, .F., ''False'', ());
#89=LwsQualifiedIdentifier(#147, .F., ''S2'', ());
#90=LwsIfStatement(#195, (), (#51), $);
#91=LwsProcedureDeclaration(#115, (#22, #198), .F., #19);
#92=LwsQualifiedIdentifier(#72, .F., ''String'', ());
#93=LwsAggregate(#101, .F., (#32));
#94=LwsQualifiedIdentifier(#185, .F., ''Put'', (#184));
#95=LwsQualifiedIdentifier(#73, .F., ''Put'', (#103));
#96=LwsAggregate(#103, .F., (#193));
#97=LwsSubtypeIndication(#61, #47, $);
#98=LwsPackageBody(#79, (#9, #171, #183, #179, #115, #62), #169, $);
#99=LwsQualifiedIdentifier(#61, .F., ''Error_Pos'', ());
#100=LwsIfStatement(#17, (), (#151), $);
#101=LwsArgumentsSelector(#31, #93);
#102=LwsProcedureDeclaration(#62, (), .F., #106);
#103=LwsArgumentsSelector(#95, #96);
#104=LwsDecimalLiteral(#198, .F., ''0'');
#105=LwsLoopStatement(#111, (), $, #40, (#23));
#106=LwsCompoundName(#102, (''Pause''));
#107=LwsProcedureDeclaration(#171, (#125, #191, #7), .F., #194);
#108=LwsProcedureCall(#111, (), #156);
#109=LwsAggregate(#114, .F., (#140));
#110=LwsStringLiteral(#71, .F., ''sdc:'');
#111=LwsBlockBody(#115, (#176, #178, #16, #67, #105, #86, #141, #49, #108), ());
#112=LwsQualifiedIdentifier(#191, .F., ''String'', ());
#113=LwsAssignment(#130, (), #127, #63);
#114=LwsArgumentsSelector(#165, #109);
#115=LwsSubprogramBody(#98, (#61), #91, #111);
#116=LwsQualifiedIdentifier(#23, .F., ''Put'', (#33));
#117=LwsAggregate(#119, .F., (#82));
#118=LwsDecimalLiteral(#48, .F., ''0'');
#119=LwsArgumentsSelector(#35, #117);
#120=LwsQualifiedIdentifier(#124, .F., ''Put'', (#149));
#121=LwsProcedureCall(#17, (), #35);
#122=LwsProcedureCall(#195, (), #12);
#123=LwsQualifiedIdentifier(#177, .F., ''String'', ());
#124=LwsProcedureCall(#195, (), #120);
#125=LwsFormalParameter(#107, (''S1''), $, #173, $);
#126=LwsArgumentsSelector(#43, #147);
#127=LwsQualifiedIdentifier(#113, .F., ''Pos'', ());
#128=LwsNamedSelector(#182, ''Line_Number'');
#129=LwsQualifiedIdentifier(#161, .F., ''S'', ());
#130=LwsIfClause(#176, #48, (#113));
#131=LwsQualifiedIdentifier(#39, .F., ''Put'', (#158));
#132=LwsCompoundName(#1, (''Input''));
#133=LwsAggregate(#135, .F., (#187));
#134=LwsParsingResult($, (#79), $);
#135=LwsArgumentsSelector(#162, #133);
#136=LwsQualifiedIdentifier(#14, .F., ''S2'', ());
#137=LwsQualifiedIdentifier(#198, .F., ''Natural'', ());
#138=LwsProcedureCall(#17, (), #43);
#139=LwsAggregate(#144, .F., (#84));
#140=LwsStringLiteral(#109, .F., ''!'');
#141=LwsProcedureCall(#111, (), #162);
#142=LwsAggregate(#149, .F., (#186));
#143=LwsNamedSelector(#148, ''Text_IO'');
#144=LwsArgumentsSelector(#37, #139);
#145=LwsProcedureDeclaration(#183, (#72), .F., #44);
#146=LwsAggregate(#153, .F., (#182));
#147=LwsAggregate(#126, .F., (#89));
#148=LwsQualifiedIdentifier(#18, .F., ''Ada'', (#143));
#149=LwsArgumentsSelector(#120, #142);
#150=LwsQualifiedIdentifier(#193, .F., ''NaturalImage'', (#153));
#151=LwsIfClause(#100, #172, (#24));
#152=LwsQualifiedIdentifier(#45, .F., ''Put'', (#46));
#153=LwsArgumentsSelector(#150, #146);
#154=LwsAggregate(#158, .F., (#160));
#155=LwsQualifiedIdentifier(#68, .F., ''Pos'', ());
#156=LwsQualifiedIdentifier(#108, .F., ''New_Line'', ());
#157=LwsStringLiteral(#193, .F., '': '');
#158=LwsArgumentsSelector(#131, #154);
#159=LwsNamedSelector(#63, ''Column_Number'');
#160=LwsStringLiteral(#154, .F., ''Press a key to continue...'');
#161=LwsAggregate(#166, .F., (#129));
#162=LwsQualifiedIdentifier(#141, .F., ''Put'', (#135));
#163=LwsAggregate(#170, .F., (#11));
#164=LwsProcedureCall(#168, (), #197);
#165=LwsQualifiedIdentifier(#86, .F., ''Put_Line'', (#114));
#166=LwsArgumentsSelector(#12, #161);
#167=LwsStringLiteral(#81, .F., '''');
#168=LwsBlockBody(#179, (#175, #73, #45, #185, #74, #164), ());
#169=LwsCompoundName(#98, (''Screen_Output''));
#170=LwsArgumentsSelector(#8, #163);
#171=LwsSubprogramBody(#98, (), #107, #17);
#172=LwsQualifiedIdentifier(#151, .F., ''End_Line'', ());
#173=LwsQualifiedIdentifier(#125, .F., ''String'', ());
#174=LwsQualifiedIdentifier(#196, .F., ''Debug_On'', ());
#175=LwsProcedureCall(#168, (), #8);
#176=LwsIfStatement(#111, (), (#130), $);
#177=LwsFormalParameter(#75, (''S3''), $, #123, #70);
#178=LwsProcedureCall(#111, (), #36);
#179=LwsSubprogramBody(#98, (), #75, #168);
#180=LwsNamedSelector(#32, ''Current_Line'');
#181=LwsDecimalLiteral(#69, .F., ''1'');
#182=LwsQualifiedIdentifier(#146, .F., ''Input'', (#128));
#183=LwsSubprogramBody(#98, (), #145, #195);
#184=LwsArgumentsSelector(#94, #14);
#185=LwsProcedureCall(#168, (), #94);
#186=LwsStringLiteral(#142, .F., ''DEBUG: '');
#187=LwsStringLiteral(#133, .F., ''sdc input error at line'');
#188=LwsCatenationExpression(#83, .F., #30, #78);
#189=LwsStringLiteral(#30, .F., '': '');
#190=LwsUnitInterface(#79, #1, ());
#191=LwsFormalParameter(#107, (''S2''), $, #112, #55);
#192=LwsProcedureCall(#195, (), #41);
#193=LwsCatenationExpression(#96, .F., #150, #157);
#194=LwsCompoundName(#107, (''Msg''));
#195=LwsBlockBody(#183, (#90, #124, #122, #192), ());
#196=LwsNotExpression(#51, .F., #174);
#197=LwsQualifiedIdentifier(#164, .F., ''New_Line'', ());
#198=LwsFormalParameter(#91, (''Error_Pos''), $, #137, #104);
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_simpleLinkedList [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#61, .F., ''Node_Ptr'', ());
#2=LwsQualifiedIdentifier(#22, .F., ''Head'', ());
#3=LwsDefinedRecordType(#47, .F., .F., .F., #95);
#4=LwsEqualExpression(#39, .F., #74, #5);
#5=LwsNegativeExpression(#4, .F., #28);
#6=LwsComponentSubtype(#37, .F., #44);
#7=LwsQualifiedIdentifier(#27, .F., ''Node_Ptr'', ());
#8=LwsWithClause(#18, (#42), (#42));
#9=LwsUseClause(#18, (#45), (#45));
#10=LwsObjectDeclaration(#12, (''Head''), .F., .F., #27, $);
#11=LwsNamedSelector(#29, ''Next'');
#12=LwsSubprogramBody(#33, (#26, #31, #47, #10, #48, #83, #72), #50, #73);
#13=LwsNamedSelector(#43, ''Next'');
#14=LwsStringLiteral(#41, .F., '' '');
#15=LwsNullLiteral(#17, .F., ''null'');
#16=LwsQualifiedIdentifier(#84, .F., ''Put'', (#25));
#17=LwsEqualExpression(#23, .F., #53, #15);
#18=LwsUnitInterface(#33, #8, (#9));
#19=LwsQualifiedIdentifier(#59, .F., ''Put'', (#87));
#20=LwsNamedSelector(#45, ''Io'');
#21=LwsQualifiedIdentifier(#44, .F., ''Node_Ptr'', ());
#22=LwsAssignment(#79, (), #2, #54);
#23=LwsExitStatement(#89, (), $, #17);
#24=LwsQualifiedIdentifier(#81, .F., ''Head'', ());
#25=LwsArgumentsSelector(#16, #30);
#26=LwsIncompleteTypeDeclaration(#12, ''Node'', $);
#27=LwsSubtypeIndication(#10, #7, $);
#28=LwsDecimalLiteral(#5, .F., ''1'');
#29=LwsQualifiedIdentifier(#81, .F., ''New_Node'', (#11));
#30=LwsAggregate(#25, .F., (#55));
#31=LwsFullTypeDeclaration(#12, ''Node_Ptr'', $, #99);
#32=LwsQualifiedIdentifier(#49, .F., ''Node'', ());
#33=LwsUnit(#68, .F., (#18), #12);
#34=LwsNamedSelector(#55, ''Data'');
#35=LwsQualifiedIdentifier(#52, .F., ''Node_Ptr'', ());
#36=LwsArgumentsSelector(#64, #41);
#37=LwsComponentAttribute(#95, (''Next''), #6, $);
#38=LwsAggregate(#87, .F., (#66));
#39=LwsExitStatement(#79, (), $, #4);
#40=LwsNullLiteral(#100, .F., ''null'');
#41=LwsAggregate(#36, .F., (#14));
#42=LwsCompoundName(#8, (''Gnat'', ''Io''));
#43=LwsQualifiedIdentifier(#90, .F., ''Scan_Ptr'', (#13));
#44=LwsSubtypeIndication(#6, #21, $);
#45=LwsQualifiedIdentifier(#9, .F., ''Gnat'', (#20));
#46=LwsComponentAttribute(#95, (''Data''), #51, $);
#47=LwsFullTypeDeclaration(#12, ''Node'', $, #3);
#48=LwsObjectDeclaration(#12, (''New_Node''), .F., .F., #61, $);
#49=LwsSubtypeIndication(#99, #32, $);
#50=LwsProcedureDeclaration(#12, (), .F., #82);
#51=LwsComponentSubtype(#46, .F., #92);
#52=LwsSubtypeIndication(#83, #35, $);
#53=LwsQualifiedIdentifier(#17, .F., ''Scan_Ptr'', ());
#54=LwsQualifiedIdentifier(#22, .F., ''New_Node'', ());
#55=LwsQualifiedIdentifier(#30, .F., ''Scan_Ptr'', (#34));
#56=LwsEqualExpression(#60, .F., #91, #57);
#57=LwsNullLiteral(#56, .F., ''null'');
#58=LwsProcedureCall(#79, (), #80);
#59=LwsProcedureCall(#79, (), #19);
#60=LwsExitStatement(#89, (), $, #56);
#61=LwsSubtypeIndication(#48, #1, $);
#62=LwsQualifiedIdentifier(#94, .F., ''Scan_Ptr'', ());
#63=LwsProcedureCall(#89, (), #64);
#64=LwsQualifiedIdentifier(#63, .F., ''Put'', (#36));
#65=LwsAssignment(#79, (), #96, #75);
#66=LwsStringLiteral(#38, .F., ''> '');
#67=LwsQualifiedIdentifier(#88, .F., ''Integer'', ());
#68=LwsParsingResult($, (#33), $);
#69=LwsQualifiedIdentifier(#90, .F., ''Scan_Ptr'', ());
#70=LwsQualifiedIdentifier(#92, .F., ''Integer'', ());
#71=LwsQualifiedIdentifier(#98, .F., ''In_Int'', ());
#72=LwsObjectDeclaration(#12, (''In_Int''), .F., .F., #88, $);
#73=LwsBlockBody(#12, (#79, #94, #89, #77), ());
#74=LwsQualifiedIdentifier(#4, .F., ''In_Int'', ());
#75=LwsAllocator(#65, .F., #76, #76);
#76=LwsQualifiedIdentifier(#75, .F., ''Node'', (#86));
#77=LwsProcedureCall(#73, (), #85);
#78=LwsQualifiedIdentifier(#100, .F., ''In_Int'', ());
#79=LwsLoopStatement(#73, (), $, $, (#59, #58, #39, #65, #81, #22));
#80=LwsQualifiedIdentifier(#58, .F., ''Get'', (#93));
#81=LwsAssignment(#79, (), #29, #24);
#82=LwsCompoundName(#50, (''ll''));
#83=LwsObjectDeclaration(#12, (''Scan_Ptr''), .F., .F., #52, $);
#84=LwsProcedureCall(#89, (), #16);
#85=LwsQualifiedIdentifier(#77, .F., ''New_Line'', ());
#86=LwsPrimaryQualifier(#76, #100);
#87=LwsArgumentsSelector(#19, #38);
#88=LwsSubtypeIndication(#72, #67, $);
#89=LwsLoopStatement(#73, (), $, $, (#23, #84, #90, #60, #63));
#90=LwsAssignment(#89, (), #69, #43);
#91=LwsQualifiedIdentifier(#56, .F., ''Scan_Ptr'', ());
#92=LwsSubtypeIndication(#51, #70, $);
#93=LwsArgumentsSelector(#80, #98);
#94=LwsAssignment(#73, (), #62, #97);
#95=LwsRecordDefinition(#3, (#46, #37), $);
#96=LwsQualifiedIdentifier(#65, .F., ''New_Node'', ());
#97=LwsQualifiedIdentifier(#94, .F., ''Head'', ());
#98=LwsAggregate(#93, .F., (#71));
#99=LwsAccessToObject(#31, $, #49);
#100=LwsAggregate(#86, .F., (#78, #40));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_skipAndRead2 [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsArgumentsSelector(#24, #5);
#2=LwsQualifiedIdentifier(#80, .F., ''String'', (#61));
#3=LwsQualifiedIdentifier(#8, .F., ''I'', ());
#4=LwsNamedAttribute(#27, ''last'');
#5=LwsAggregate(#1, .F., (#69));
#6=LwsDecimalLiteral(#60, .F., ''1'');
#7=LwsNamedAttribute(#41, ''First'');
#8=LwsExplicitRange(#51, .F., #14, #3);
#9=LwsQualifiedIdentifier(#46, .F., ''String'', ());
#10=LwsArgumentsSelector(#36, #12);
#11=LwsExitStatement(#56, (), $, $);
#12=LwsAggregate(#10, .F., (#45, #30));
#13=LwsArgumentsSelector(#68, #17);
#14=LwsDecimalLiteral(#8, .F., ''1'');
#15=LwsWithClause(#21, (#33), (#33));
#16=LwsUseClause(#21, (#47), (#47));
#17=LwsAggregate(#13, .F., (#23));
#18=LwsCompoundName(#81, (''ReadStr''));
#19=LwsNamedSelector(#47, ''Io'');
#20=LwsQualifiedIdentifier(#40, .F., ''Ch'', ());
#21=LwsUnitInterface(#55, #15, (#16));
#22=LwsProcedureDeclaration(#63, (), .F., #50);
#23=LwsQualifiedIdentifier(#17, .F., ''Fred'', (#49));
#24=LwsQualifiedIdentifier(#25, .F., ''Str'', (#1));
#25=LwsAssignment(#28, (), #24, #65);
#26=LwsQualifiedIdentifier(#43, .F., ''Character'', ());
#27=LwsQualifiedIdentifier(#32, .F., ''Str'', (#4));
#28=LwsBlockBody(#79, (#56, #25, #66), ());
#29=LwsArgumentsSelector(#77, #70);
#30=LwsQualifiedIdentifier(#12, .F., ''I'', ());
#31=LwsNamedAttribute(#69, ''first'');
#32=LwsExplicitRange(#78, .F., #60, #27);
#33=LwsCompoundName(#15, (''Gnat'', ''Io''));
#34=LwsFormalParameter(#81, (''Last''), .outputMode., #37, $);
#35=LwsQualifiedIdentifier(#70, .F., ''Str'', (#74));
#36=LwsQualifiedIdentifier(#48, .F., ''ReadStr'', (#10));
#37=LwsQualifiedIdentifier(#34, .F., ''Integer'', ());
#38=LwsArgumentsSelector(#83, #40);
#39=LwsProcedureCall(#42, (), #68);
#40=LwsAggregate(#38, .F., (#20));
#41=LwsQualifiedIdentifier(#60, .F., ''Str'', (#7));
#42=LwsBlockBody(#63, (#48, #39), ());
#43=LwsSubtypeIndication(#64, #26, $);
#44=LwsProcedureCall(#56, (), #83);
#45=LwsQualifiedIdentifier(#12, .F., ''Fred'', ());
#46=LwsFormalParameter(#81, (''Str''), .outputMode., #9, $);
#47=LwsQualifiedIdentifier(#16, .F., ''Gnat'', (#19));
#48=LwsProcedureCall(#42, (), #36);
#49=LwsArgumentsSelector(#23, #51);
#50=LwsCompoundName(#22, (''ReadRest2''));
#51=LwsAggregate(#49, .F., (#8));
#52=LwsParsingResult($, (#55), $);
#53=LwsQualifiedIdentifier(#57, .F., ''Max'', ());
#54=LwsQualifiedIdentifier(#72, .F., ''Integer'', ());
#55=LwsUnit(#52, .F., (#21), #63);
#56=LwsLoopStatement(#28, (), $, $, (#44, #11));
#57=LwsExplicitRange(#67, .F., #82, #53);
#58=LwsQualifiedIdentifier(#73, .F., ''Integer'', ());
#59=LwsObjectDeclaration(#79, (''I''), .F., .F., #72, $);
#60=LwsPlusExpression(#32, .F., #41, #6);
#61=LwsArgumentsSelector(#2, #67);
#62=LwsObjectDeclaration(#63, (''I''), .F., .F., #73, $);
#63=LwsSubprogramBody(#55, (#79, #75, #71, #62), #22, #42);
#64=LwsObjectDeclaration(#79, (''Ch''), .F., .F., #43, $);
#65=LwsQualifiedIdentifier(#25, .F., ''Ch'', ());
#66=LwsProcedureCall(#28, (), #77);
#67=LwsAggregate(#61, .F., (#57));
#68=LwsQualifiedIdentifier(#39, .F., ''Put_Line'', (#13));
#69=LwsQualifiedIdentifier(#5, .F., ''Str'', (#31));
#70=LwsAggregate(#29, .F., (#35, #84));
#71=LwsObjectDeclaration(#63, (''Fred''), .F., .F., #80, $);
#72=LwsSubtypeIndication(#59, #54, $);
#73=LwsSubtypeIndication(#62, #58, $);
#74=LwsArgumentsSelector(#35, #78);
#75=LwsNumberDeclaration(#63, (''Max''), #76);
#76=LwsDecimalLiteral(#75, .F., ''20'');
#77=LwsQualifiedIdentifier(#66, .F., ''Get_Line'', (#29));
#78=LwsAggregate(#74, .F., (#32));
#79=LwsSubprogramBody(#63, (#59, #64), #81, #28);
#80=LwsSubtypeIndication(#71, #2, $);
#81=LwsProcedureDeclaration(#79, (#46, #34), .F., #18);
#82=LwsDecimalLiteral(#57, .F., ''1'');
#83=LwsQualifiedIdentifier(#44, .F., ''Get'', (#38));
#84=LwsQualifiedIdentifier(#70, .F., ''Last'', ());
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_taskpoolAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsQualifiedIdentifier(#11, .F., ''NATURAL'', ());
#2=LwsDecimalLiteral(#11, .F., ''0'');
#3=LwsFormalParameter(#9, (''The_task''), .inputMode., #19, $);
#4=LwsUnit(#10, .F., (), #17);
#5=LwsQualifiedIdentifier(#20, .F., ''BOOLEAN'', ());
#6=LwsGenericFormalParameter(#17, #16);
#7=LwsQualifiedIdentifier(#16, .F., ''NATURAL'', ());
#8=LwsFullTypeDeclaration(#32, ''Task_designator'', $, #23);
#9=LwsProcedureDeclaration(#32, (#3), .F., #36);
#10=LwsParsingResult($, (#4), $);
#11=LwsFormalParameter(#31, (''Static_size''), $, #1, #2);
#12=LwsPackageDeclaration(#17, #21, #27);
#13=LwsFormalParameter(#34, (''The_task''), .outputMode., #35, $);
#14=LwsDecimalLiteral(#16, .F., ''0'');
#15=LwsExceptionDeclaration(#32, (''Invalid_task_designator''));
#16=LwsFormalParameter(#6, (''Dynamic_limit''), $, #7, #14);
#17=LwsGenericPackageDeclaration(#4, (#29, #31, #6), #12, #12);
#18=LwsSubtypeIndication(#23, #25, $);
#19=LwsQualifiedIdentifier(#3, .F., ''Task_designator'', ());
#20=LwsFormalParameter(#34, (''Valid_task''), .outputMode., #5, $);
#21=LwsCompoundName(#12, (''Task_pool''));
#22=LwsPrivateTypeDefinition(#30, .F., .T.);
#23=LwsAccessToObject(#8, $, #18);
#24=LwsQualifiedIdentifier(#28, .F., ''Task_designator'', ());
#25=LwsQualifiedIdentifier(#18, .F., ''Task_type'', ());
#26=LwsCompoundName(#34, (''No_wait_request_task''));
#27=LwsPackageDefinition(#12, #32, $);
#28=LwsFunctionDeclaration(#32, (), .F., #33, #24);
#29=LwsGenericFormalType(#17, #30);
#30=LwsPrivateTypeDeclaration(#29, ''Task_type'', $, #22, #22);
#31=LwsGenericFormalParameter(#17, #11);
#32=LwsPackagePart(#27, (#8, #28, #34, #9, #15));
#33=LwsCompoundName(#28, (''Request_task''));
#34=LwsProcedureDeclaration(#32, (#13, #20), .F., #26);
#35=LwsQualifiedIdentifier(#13, .F., ''Task_designator'', ());
#36=LwsCompoundName(#9, (''Release_task''));
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_timedbufAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsDiscreteRange(#9, .F., #42, $);
#2=LwsProcedureDeclaration(#5, (#12), .F., #43);
#3=LwsPackageDefinition(#41, #5, $);
#4=LwsFormalParameter(#28, (''Buffer_multiplicity''), .inputMode., #32, #50);
#5=LwsPackagePart(#3, (#33, #2, #37, #34, #48));
#6=LwsFormalParameter(#30, (''Valid_elements''), .inputMode., #11, $);
#7=LwsFormalParameter(#30, (''The_load''), .inputMode., #14, $);
#8=LwsGenericFormalType(#23, #21);
#9=LwsArrayType(#26, (#1), #20);
#10=LwsUnit(#24, .F., (), #23);
#11=LwsQualifiedIdentifier(#6, .F., ''NATURAL'', ());
#12=LwsFormalParameter(#2, (''Timeout''), .inputMode., #17, $);
#13=LwsPrivateTypeDefinition(#22, .F., .F.);
#14=LwsQualifiedIdentifier(#7, .F., ''Buffer_load'', ());
#15=LwsCompoundName(#33, (''Put_in_buffer''));
#16=LwsQualifiedIdentifier(#35, .F., ''DURATION'', ());
#17=LwsQualifiedIdentifier(#12, .F., ''DURATION'', ());
#18=LwsGenericFormalType(#23, #26);
#19=LwsQualifiedIdentifier(#38, .F., ''Element'', ());
#20=LwsComponentSubtype(#9, .F., #38);
#21=LwsFullTypeDeclaration(#8, ''Buffer_size'', $, #31);
#22=LwsPrivateTypeDeclaration(#25, ''Element'', $, #13, #13);
#23=LwsGenericPackageDeclaration(#10, (#25, #8, #18, #46, #45, #28), #41, #41);
#24=LwsParsingResult($, (#10), $);
#25=LwsGenericFormalType(#23, #22);
#26=LwsFullTypeDeclaration(#18, ''Buffer_load'', $, #9);
#27=LwsCompoundName(#30, (''Send''));
#28=LwsGenericFormalParameter(#23, #4);
#29=LwsDecimalLiteral(#35, .F., ''1.0'');
#30=LwsProcedureDeclaration(#46, (#6, #7), .F., #27);
#31=LwsAnyType(#21, .F.);
#32=LwsQualifiedIdentifier(#4, .F., ''POSITIVE'', ());
#33=LwsProcedureDeclaration(#5, (#39), .F., #15);
#34=LwsProcedureDeclaration(#5, (), .F., #44);
#35=LwsFormalParameter(#45, (''Buffer_timeout''), .inputMode., #16, #29);
#36=LwsCompoundName(#41, (''Timed_buffer''));
#37=LwsProcedureDeclaration(#5, (), .F., #40);
#38=LwsSubtypeIndication(#20, #19, $);
#39=LwsFormalParameter(#33, (''In_data''), .inputMode., #47, $);
#40=LwsCompoundName(#37, (''Flush_buffer''));
#41=LwsPackageDeclaration(#23, #36, #3);
#42=LwsQualifiedIdentifier(#1, .F., ''Buffer_size'', ());
#43=LwsCompoundName(#2, (''Set_buffer_timeout''));
#44=LwsCompoundName(#34, (''Abort_buffer''));
#45=LwsGenericFormalParameter(#23, #35);
#46=LwsGenericFormalProcedure(#23, #30, $, #30);
#47=LwsQualifiedIdentifier(#39, .F., ''Element'', ());
#48=LwsProcedureDeclaration(#5, (), .F., #49);
#49=LwsCompoundName(#48, (''Flush_and_abort_buffer''));
#50=LwsDecimalLiteral(#4, .F., ''1'');
ENDSEC;
'
]

{ #category : #'sample accessing' }
LewisInlineTestResource >> sampleFrom_test_wkupskedAds [
	 <PlatypusTestSample>
	 ^ 'ISO-10303-21;
HEADER;
ENDSEC;
DATA;
#1=LwsExceptionDeclaration(#59, (''Invalid_wakeup_designator''));
#2=LwsPrivateTypeDeclaration(#73, ''Wakeup_designator'', $, #21, #21);
#3=LwsQualifiedIdentifier(#71, .F., ''Signal_earliest'', ());
#4=LwsQualifiedIdentifier(#8, .F., ''Wakeup_designator'', ());
#5=LwsGenericPackageDeclaration(#65, (#73, #50, #55), #76, #76);
#6=LwsQualifiedIdentifier(#79, .F., ''Default_miss_delta'', ());
#7=LwsQualifiedIdentifier(#81, .F., ''Default_miss_delta'', ());
#8=LwsFormalParameter(#30, (''The_wakeup''), .inputMode., #4, $);
#9=LwsCompoundName(#37, (''Set_miss_option''));
#10=LwsCompoundName(#32, (''Set_miss_delta''));
#11=LwsCompoundName(#76, (''Wakeup_scheduling''));
#12=LwsQualifiedIdentifier(#83, .F., ''Signal_earliest'', ());
#13=LwsQualifiedIdentifier(#53, .F., ''Wakeup_designator'', ());
#14=LwsQualifiedIdentifier(#20, .F., ''Wakeup_designator'', ());
#15=LwsFormalParameter(#37, (''The_wakeup''), .inputMode., #54, $);
#16=LwsQualifiedIdentifier(#84, .F., ''Default_miss_delta'', ());
#17=LwsFormalParameter(#30, (''Signal_time''), .inputMode., #38, $);
#18=LwsQualifiedIdentifier(#22, .F., ''DURATION'', ());
#19=LwsQualifiedIdentifier(#24, .F., ''CALENDAR'', (#44));
#20=LwsFormalParameter(#69, (''The_wakeup''), .inputMode., #14, $);
#21=LwsPrivateTypeDefinition(#2, .F., .F.);
#22=LwsFormalParameter(#50, (''Default_miss_delta''), $, #18, #77);
#23=LwsFormalParameter(#62, (''Miss_delta''), .inputMode., #68, #33);
#24=LwsFormalParameter(#62, (''Signal_time''), .inputMode., #19, $);
#25=LwsQualifiedIdentifier(#71, .F., ''Missed_execution_option'', ());
#26=LwsCompoundName(#69, (''Unschedule_wakeup''));
#27=LwsQualifiedIdentifier(#29, .F., ''Missed_execution_option'', ());
#28=LwsUnitInterface(#65, #58, ());
#29=LwsFormalParameter(#37, (''Miss_option''), .inputMode., #27, $);
#30=LwsProcedureDeclaration(#59, (#8, #17, #83, #79), .F., #78);
#31=LwsProcedureDeclaration(#59, (#53, #40, #63, #81), .F., #51);
#32=LwsProcedureDeclaration(#59, (#57, #84), .F., #10);
#33=LwsQualifiedIdentifier(#23, .F., ''Default_miss_delta'', ());
#34=LwsProcedureDeclaration(#55, (#48), .F., #74);
#35=LwsNamedSelector(#38, ''TIME'');
#36=LwsQualifiedIdentifier(#40, .F., ''DURATION'', ());
#37=LwsProcedureDeclaration(#59, (#15, #29), .F., #9);
#38=LwsQualifiedIdentifier(#17, .F., ''CALENDAR'', (#35));
#39=LwsQualifiedIdentifier(#43, .F., ''Wakeup_designator'', ());
#40=LwsFormalParameter(#31, (''Wakeup_period''), .inputMode., #36, $);
#41=LwsQualifiedIdentifier(#84, .F., ''DURATION'', ());
#42=LwsQualifiedIdentifier(#48, .F., ''Wakeup_designator'', ());
#43=LwsFormalParameter(#62, (''The_wakeup''), .inputMode., #39, $);
#44=LwsNamedSelector(#19, ''TIME'');
#45=LwsStringEnumerationId(#72, ''Skip_cycle'');
#46=LwsQualifiedIdentifier(#63, .F., ''Missed_execution_option'', ());
#47=LwsPackageDefinition(#76, #59, $);
#48=LwsFormalParameter(#34, (''Which_wakeup''), .inputMode., #42, $);
#49=LwsFullTypeDeclaration(#59, ''Missed_execution_option'', $, #72);
#50=LwsGenericFormalParameter(#5, #22);
#51=LwsCompoundName(#31, (''Signal_periodic_wakeup''));
#52=LwsQualifiedIdentifier(#57, .F., ''Wakeup_designator'', ());
#53=LwsFormalParameter(#31, (''The_wakeup''), .inputMode., #13, $);
#54=LwsQualifiedIdentifier(#15, .F., ''Wakeup_designator'', ());
#55=LwsGenericFormalProcedure(#5, #34, $, #34);
#56=LwsCompoundName(#58, (''CALENDAR''));
#57=LwsFormalParameter(#32, (''The_wakeup''), .inputMode., #52, $);
#58=LwsWithClause(#28, (#56), (#56));
#59=LwsPackagePart(#47, (#49, #62, #30, #31, #69, #37, #32, #1));
#60=LwsParsingResult($, (#65), $);
#61=LwsStringEnumerationId(#72, ''Signal_earliest'');
#62=LwsProcedureDeclaration(#59, (#43, #24, #67, #71, #23), .F., #75);
#63=LwsFormalParameter(#31, (''Miss_option''), .inputMode., #46, #70);
#64=LwsQualifiedIdentifier(#67, .F., ''DURATION'', ());
#65=LwsUnit(#60, .F., (#28), #5);
#66=LwsQualifiedIdentifier(#83, .F., ''Missed_execution_option'', ());
#67=LwsFormalParameter(#62, (''Wakeup_period''), .inputMode., #64, $);
#68=LwsQualifiedIdentifier(#23, .F., ''DURATION'', ());
#69=LwsProcedureDeclaration(#59, (#20), .F., #26);
#70=LwsQualifiedIdentifier(#63, .F., ''Signal_earliest'', ());
#71=LwsFormalParameter(#62, (''Miss_option''), .inputMode., #25, #3);
#72=LwsEnumerationType(#49, (#61, #45));
#73=LwsGenericFormalType(#5, #2);
#74=LwsCompoundName(#34, (''Signal''));
#75=LwsCompoundName(#62, (''Schedule_periodic_wakeup''));
#76=LwsPackageDeclaration(#5, #11, #47);
#77=LwsDecimalLiteral(#22, .F., ''1.0'');
#78=LwsCompoundName(#30, (''Schedule_one_shot_wakeup''));
#79=LwsFormalParameter(#30, (''Miss_delta''), .inputMode., #80, #6);
#80=LwsQualifiedIdentifier(#79, .F., ''DURATION'', ());
#81=LwsFormalParameter(#31, (''Miss_delta''), .inputMode., #82, #7);
#82=LwsQualifiedIdentifier(#81, .F., ''DURATION'', ());
#83=LwsFormalParameter(#30, (''Miss_option''), .inputMode., #66, #12);
#84=LwsFormalParameter(#32, (''Miss_delta''), .inputMode., #41, #16);
ENDSEC;
'
]
