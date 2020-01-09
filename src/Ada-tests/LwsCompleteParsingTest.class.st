Class {
	#name : #LwsCompleteParsingTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests-ThalesDefRef'
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

{ #category : #visitor }
LwsCompleteParsingTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
