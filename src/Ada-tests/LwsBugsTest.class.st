Class {
	#name : #LwsBugsTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests-ThalesDefRef'
}

{ #category : #setUp }
LwsBugsTest >> resetMeta [

	ADAModel resetMeta
]

{ #category : #tests }
LwsBugsTest >> testCaseRegression [
	"Bug reported by Thales (Redmine 408))"

	| importedModel |
	self parseAndVisit: (ThalesBugs examplesInCategory: 'bugs - proc in proc').
	self verifyCaseStatementIn: model.	
		
	"Export then import then check again"
	importedModel := ADAModel new importFromMSEStream: model asMSEString readStream.
	self assert: importedModel size equals: model size.
	self verifyCaseStatementIn: importedModel
]

{ #category : #tests }
LwsBugsTest >> testGeneric [
	| packageAliases originalPackages |
	self parseAndVisit: (ThalesBugs examplesInCategory: 'bugs - generic').
	packageAliases := model allAdaPackages select: #isAdaAlias.
	self assert: packageAliases size equals: 3.
	originalPackages := model allAdaPackages reject: #isAdaAlias.
	self assert: originalPackages size equals: 6.
	self verifySubprogramWithinRenamedIn: model.
	self verifyTypeWithinRenamedIn: model
]

{ #category : #tests }
LwsBugsTest >> testGenericExported [

	| mseFileName aStream importedModel |
	self testGeneric.
	"
	Export then import then check again
	"
	mseFileName := 'thales-test.mse'.
	aStream := StandardFileStream forceNewFileNamed: mseFileName.
	model exportToMSEStream: aStream.
	aStream close.
	aStream := StandardFileStream readOnlyFileNamed: mseFileName.
	importedModel := ADAModel new importFromMSEStream: aStream.
	aStream close.
	self assert: importedModel size equals: model size.
	self verifySubprogramWithinRenamedIn: model.
	self verifyTypeWithinRenamedIn: model.
	mseFileName asFileReference delete
]

{ #category : #tests }
LwsBugsTest >> testGenericInstantiation [
	| packages |
	"Issue #394"
	self parseAndVisit: (ThalesBugs examplesInCategory: 'bugs - generic instantiation').
	packages := model allAdaPackages select: [ :p | p class == ADAGenericPackageInstanciation ].
	self assert: (packages allSatisfy: [:p | p accesses notEmpty]).
	self assert: (packages allSatisfy: [:p | p accesses first variable name = 'INT_ID_TOTO_MESSAGE']).

	self assert: (packages allSatisfy: [:p | p outgoingReferences notEmpty]).
	self assert: (packages allSatisfy: 
			[ :p | p outgoingReferences allSatisfy: 
				[ :ref |
				#('REC_TOTO_MESSAGE' 'ACC_TOTO_MESSAGE' ) includes: ref target name ] ]).

]

{ #category : #tests }
LwsBugsTest >> testOtherGenericInstantiation [
	"Issue #409"
	| sourceCode |
	sourceCode := ThalesBugs examplesInCategory: 'bugs - other generic instantiation'.
	self shouldnt: [ self parseAndVisit: sourceCode ] raise: MessageNotUnderstood
]

{ #category : #tests }
LwsBugsTest >> testProcInProc [
	"
	Bug reported by Thales
	"

	| mseFileName aStream importedModel |
	self parseAndVisit: (ThalesBugs examplesInCategory: 'bugs - proc in proc').
	self verifyDeclareStatementsIn: model.
	"
	Export then import then check again
	"
	mseFileName := 'thales-test.mse'.
	aStream := StandardFileStream forceNewFileNamed: mseFileName.
	model exportToMSEStream: aStream.
	aStream close.
	aStream := StandardFileStream readOnlyFileNamed: mseFileName.
	importedModel := ADAModel new importFromMSEStream: aStream.
	aStream close.
	self assert: importedModel size equals: model size.
	self verifyDeclareStatementsIn: importedModel.
	mseFileName asFileReference delete
]

{ #category : #tests }
LwsBugsTest >> testSeparateCompound [
	"
	Bug reported by Thales
	"
	| parent |

	self parseAndVisit: { ThalesBugs separate1 . ThalesBugs separate0 }.

	parent := model entityNamed: 'TopContainer -> SERVICES_1553'.
	self assert: parent tasks size equals: 1.
	self assert: parent tasks first functions size equals: 1.


]

{ #category : #tests }
LwsBugsTest >> testTaskTypeAsType [
	"
	Bug reported by Thales
	"

	| ent |
	self parseAndVisit: 'package SEMAPHORES is
   type SEMAPHORE is limited private;
	private
 	   task type SEMAPHORE is
  	      entry Seize;
   		   entry Release;
   	 	end SEMAPHORE;
	end SEMAPHORES;'.

	ent := model entityNamed: 'TopContainer -> SEMAPHORES -> SEMAPHORE'.
	self assert: ent class equals: ADATask.
	self assert: ent functions size equals: 2.

]

{ #category : #tests }
LwsBugsTest >> testTypeCallsFunction [
	"
	Bug reported by Thales
	"

	| pckg fct |
	self parseAndVisit: 'PACKAGE bugTypeCallFct is
	FUNCTION fct RETURN INTEGER;
	TYPE tab IS ARRAY (1 .. fct) OF INTEGER;
	END bugTypeCallFct;'.

	pckg := model entityNamed: 'TopContainer -> bugTypeCallFct'.
	fct := model entityNamed: 'TopContainer -> bugTypeCallFct -> fct'.
	self assert: pckg outgoingInvocations size equals: 1.
	self assert: pckg outgoingInvocations first candidates first equals: fct.

]

{ #category : #verifying }
LwsBugsTest >> verifyCaseStatementIn: aModel [
	| case alternative choice |
	"There is only one CASE statement in the sample
	with two alternatives"
	case := (aModel allWithType: FASTAdaCaseStatement) anyOne.
	self assert: case alternatives size equals: 2.
	self assert: (case alternatives collect: [ :alt | alt statements size ]) asBag = #(0 1) asBag.
	alternative := case alternatives detect: [ :alt | alt statements size = 1 ].
	self assert: alternative statements size equals: 1.
	self assert: alternative choices notNil.
	self assert: alternative choices size equals: 1.
	choice := alternative choices first.
	self assert: choice class equals: FAMIXAccess.
	self assert: choice variable name equals: 'ARTIFACT'.
	self assert: choice accessor name equals: 'cased_procedure'.
	alternative := case alternatives detect: [ :alt | alt statements size = 0 ].
	self assert: alternative choices notNil.
	self assert: alternative choices size equals: 0
]

{ #category : #verifying }
LwsBugsTest >> verifyDeclareStatementsIn: aModel [
	| declareStatements theDeclareStatement |
	declareStatements := aModel allWithType: FASTAdaDeclareStatement.
	self assert: declareStatements size equals: 2.
	self assert: (declareStatements allSatisfy: [ :each | each name == #noname ]).
	self assert: (declareStatements select: [ :each | each packages notEmpty ]) size equals: 1.	
	"One and only one declare statement instantiates a package"
	theDeclareStatement := declareStatements detect: [ :each | each packages notEmpty ].
	self assert: theDeclareStatement class equals: FASTAdaDeclareStatement.
	self assert: theDeclareStatement packages size equals: 1.
	self assert: theDeclareStatement packages first class equals: ADAGenericPackageInstanciation.
	self assert: theDeclareStatement packages first name equals: 'instance'.
	self assert: theDeclareStatement packages first container equals: theDeclareStatement
]

{ #category : #verifying }
LwsBugsTest >> verifySubprogramWithinRenamedIn: aModel [
	| renamer invoked renamed invocation aProcedure |
	aProcedure := aModel allAdaSubprograms detect: [ :sub | sub name = 'test' ].
	self assert: aProcedure container name equals: 'renameexemple'.
	self assert: aProcedure outgoingInvocations size equals: 1.
	invocation := aProcedure outgoingInvocations anyOne.
	self assert: invocation sender == aProcedure.
	invoked := invocation candidates anyOne.
	self assert: invoked class == ADASubprogram.
	self assert: invoked name equals: 'launch'.
	renamed := invoked container.
	self assert: renamed name equals: 'va_etre_rename'.
	self deny: renamed isAdaAlias.
	self assert: (renamed functions includes: invoked).
	renamer := (aModel allAdaPackages select: #isAdaAlias) detect: [ :alias | alias originalEntity == renamed ].
	self assert: (renamer functions includes: invoked)
]

{ #category : #verifying }
LwsBugsTest >> verifyTypeWithinRenamedIn: aModel [
	| aProcedure   renamed renamer  local type |
	aProcedure := aModel allAdaSubprograms detect: [ :sub | sub name = 'other_test' ].
	self assert: aProcedure container name equals: 'subrename'.
	self assert: aProcedure localVariables size equals: 1.
	local := aProcedure localVariables anyOne.
	self assert: local class == ADAStructuralEntity.
	self assert: local name equals: 'HIS_VAR'.
	type := local declaredType.
	self assert: type class == ADATypeRecord.
	self assert: type name equals: 'T_TOTO_1'.
	renamed := type container.
	self assert: renamed name equals: 'MSG_TOTO_1'.
	self deny: renamed isAdaAlias.
	self assert: (renamed types includes: type).
	renamer := (aModel allAdaPackages select: #isAdaAlias) 
		detect: [ :alias | alias originalEntity == renamed ].
	self assert: (renamer types includes: type).

]

{ #category : #constants }
LwsBugsTest >> visitorClasses [
	^ { LwsAdaVisitorDef . LwsAdaVisitorRef }
]
