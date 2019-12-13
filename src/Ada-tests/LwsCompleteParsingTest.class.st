Class {
	#name : #LwsCompleteParsingTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests'
}

{ #category : #'as yet unclassified' }
LwsCompleteParsingTest class >> constantVariable [
	^	'
package ConstantVariable is
	PO_UX : constant String := "PO_U2 >>Tracks_1.ELLIGIBILITY";
	CNT_EVALUATION : BASIC_DEFINITIONS.T_32_NATURAL := 0;
	CURRENT_HOLD_FIRE : BOOLEAN := FALSE;
end;'
]

{ #category : #testing }
LwsCompleteParsingTest >> testAccessType [
	| types accessed theType theAccessingType |
	self parseAndVisit: 
			{ ThalesExamples csci_definitions . 
			ThalesExamples communication_services_ads . 
			ThalesExamples input_radar_adb }.
	types := model allAdaTypes select: #isAdaAccessType.
	self assert: types size equals: 1.
	theType := types anyOne. 
	accessed := theType adaAccessed. 
	theAccessingType := accessed incomingReferences anyOne source.
	self assert: theAccessingType == theType.

]

{ #category : #tests }
LwsCompleteParsingTest >> testComputeArgsForAnInvocationByPosition [
	| invok |
	self parseAndVisit: {ThalesExamples tracks_1_characterization . ThalesExamples tracks_1_adb}.

	invok := (model allAdaSubprograms detect: [:sub | (sub name = 'SEND_TO_OPERATOR') and: [sub container name = 'CHARACTERIZATION']]) incomingInvocations first.
	self assert: invok arguments size equals: 2.

	self assert: invok arguments first argument name equals: 'CODE'.
	self assert: invok arguments first argument container name equals: 'TREAT'.
	self assert: invok arguments second argument name equals: 'THIS'.
	self assert: invok arguments second argument container name equals: 'TREAT'.

	self assert: invok arguments first parameter name equals: 'CODE'.
	self assert: invok arguments first parameter container name equals: 'SEND_TO_OPERATOR'.
	self assert: invok arguments second parameter name equals: 'THIS'.
	self assert: invok arguments second parameter container name equals: 'SEND_TO_OPERATOR'.

]

{ #category : #tests }
LwsCompleteParsingTest >> testComputeArgsForAnInvocationWithAssoc [
	| invok |
	self parseAndVisit: {ThalesExamples csci_definitions . ThalesExamples communication_services_ads . ThalesExamples input_radar_adb}.

	invok := (model entities detect: [ :e | e name = 'WAIT_AND_DO_SOMETHING']) incomingInvocations first.
	"T_TA_INPUT_RADAR -> WAIT_AND_DO_SOMETHING"
	self assert: invok arguments size equals: 2.
	self assert: invok arguments first parameter name equals: 'FROM_MAILBOX'.
	self assert: invok arguments first argument isNil.  "a stub, so not created"
	self assert: invok arguments second parameter name equals: 'RECEPTION_TASK'.
	self assert: invok arguments second argument name equals: 'INPUT_RADAR'.

	invok := (model entities detect: [ :e | e name = 'CHANNEL_NUMBER_OF']) incomingInvocations first.
	self assert: invok arguments size equals: 1.
	self assert: invok arguments first parameter name equals: 'THIS_MSG'.
	self assert: invok arguments first argument name equals: 'MSG_POINTER'.
]

{ #category : #tests }
LwsCompleteParsingTest >> testConstantVariableLwsAdaVisitorRef [
	self parseAndVisit: self class constantVariable.
	model findThalesMessagesAndTasks 
]

{ #category : #tests }
LwsCompleteParsingTest >> testFASTERCaseAlternativeOnCommunicationChannel [
	| search |
	self parseAndVisit: { ThalesExamples communication_services_ads . ThalesExamples surveillance_adb . ThalesExamples input_radar_adb }.

	model add: (THALESTask new adaTask: (model findEntityNamed: 'T_TA_INPUT_RADAR') ; yourself).
	model add: (THALESTask new adaTask: (model findEntityNamed: 'T_TA_SURVEILLANCE') ; yourself).
	model identifyThalesCommunicationChannels.

	search := FASTERCaseAlternativeOnChannel runOnScope: model allAdaTasks first fastBehaviouralEntity.
	self assert: search resultsAtTopLevel size equals: 1. "COMMUNICATION_SERVICES.INPUT_RADAR_TO_SURVEILLANCE"

]

{ #category : #tests }
LwsCompleteParsingTest >> testFASTERCaseAlternativeTreatingMessage [
	| search |
	self parseAndVisit: {ThalesExamples piste_2d_ads . ThalesExamples piste_3d_ads . ThalesExamples input_radar_adb}.
	search := FASTERCaseAlternativeTreatingMessage runOnScope: model allAdaTasks first fastBehaviouralEntity.
	self assert: search resultsAtTopLevel size equals: 2. "PISTE_2D.MSG_CODE (a stub) PISTE_3D.MSG_CODE"

	"found a case alternative with a choice that accesses variable PISTE_3D.MSG_CODE"
	self assert: (search resultsAtTopLevel anySatisfy: [:alt |
		alt choices anySatisfy: [:c |
			c isAccess and:
			[c variable container = (model findEntityNamed: 'PISTE_3D')]]]).
	"same for PISTE_2D.MSG_CODE"
	self assert: (search resultsAtTopLevel anySatisfy: [:alt |
		alt choices anySatisfy: [:c |
			c isAccess and:
			[c variable container = (model findEntityNamed: 'PISTE_2D')]]]).

]

{ #category : #tests }
LwsCompleteParsingTest >> testParseAllExamples [
	 ThalesExamples class selectors do: [ :s | | result |
		result := LwsParserForSynectique parse: (ThalesExamples perform: s).
		self assert: result isPetitFailure not. ]
]

{ #category : #visitor }
LwsCompleteParsingTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
