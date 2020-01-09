"
A LwsAdaDefTest is xxxxxxxxx.

"
Class {
	#name : #LwsAdaScopeCreationTest,
	#superclass : #LwsAdaParserAbstractTests,
	#category : #'Ada-tests-ThalesDefRef'
}

{ #category : #tests }
LwsAdaScopeCreationTest >> testInitScopeLoadLocalPackages [
	| scope |
	self parseAndVisit: ThalesExamples tracking_types.
	
	scope := (model entities detect: [ :e | e name = 'TRACKING_TYPES']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'SYS_TIME_SERVICES')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'SYS_TIME_SERVICES')) first equals: (model entities detect: [ :e | e name = 'SYS_TIME_SERVICES'])
]

{ #category : #tests }
LwsAdaScopeCreationTest >> testInitScopeLoadLocalSubprograms [
	| scope |
	self parseAndVisit: ThalesExamples mailbox_manager_ads.
	
	scope := (model entities detect: [ :e | e name = 'MAILBOX_MANAGER']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'RECEIVE')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'RECEIVE')) first equals: (model entities detect: [ :e | e name = 'RECEIVE'])
]

{ #category : #tests }
LwsAdaScopeCreationTest >> testInitScopeLoadLocalTasks [
	| scope |
	self parseAndVisit: ThalesExamples input_radar_adb.
	
	scope := (model entities detect: [ :e | e name = 'INPUT_RADAR']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_TA_INPUT_RADAR')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_TA_INPUT_RADAR')) first equals: (model entities detect: [ :e | e name = 'T_TA_INPUT_RADAR'])
]

{ #category : #tests }
LwsAdaScopeCreationTest >> testInitScopeLoadLocalTypes [
	| scope |
	self parseAndVisit: ThalesExamples global_ads.
	
	scope := (model entities detect: [ :e | e name = 'GLOBAL']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_IO_5_UNSIGNED')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_IO_5_UNSIGNED'))first equals: (model entities detect: [ :e | e name = 'T_IO_5_UNSIGNED'])
]

{ #category : #tests }
LwsAdaScopeCreationTest >> testInitScopeLoadLocalVariables [
	| scope |
	self parseAndVisit: ThalesExamples task_1_ads.
	
	scope := (model entities detect: [ :e | e name = 'TASK_1']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'MBX')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'MBX')) first equals: (model entities detect: [ :e | e name = 'MBX'])
]

{ #category : #tests }
LwsAdaScopeCreationTest >> testLookupInLocalsAsUpperCase [
	| scope |
	self parseAndVisit: ThalesExamples global_ads.
	
	scope := (model entities detect: [ :e | e name = 'GLOBAL']) fastScope.
	self assert: scope notNil.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_io_5_unsigned')) size equals: 1.
	self assert: (scope lookupInLocals: (FASTAdaQualifiedIdentifier with: 'T_io_5_unsigned')) first equals: (model entities detect: [ :e | e name = 'T_IO_5_UNSIGNED'])
]

{ #category : #running }
LwsAdaScopeCreationTest >> visitorClasses [
	^ { LwsAdaVisitorDef }
]
