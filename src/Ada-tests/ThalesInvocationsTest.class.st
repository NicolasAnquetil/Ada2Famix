"
A ThalesReferencesTest is xxxxxxxxx.

"
Class {
	#name : #ThalesInvocationsTest,
	#superclass : #ThalesAssociationsTest,
	#category : #'Ada-tests-ThalesAssocs'
}

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInCommonTypesAds [
	self parseAndVisit: ThalesExamples common_types_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInCommunicationServicesAdb [
	self parseAndVisit: ThalesExamples communication_services_adb.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInCommunicationServicesAds [
	self parseAndVisit: ThalesExamples communication_services_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInCommunicationServicesMsgManager [
	self parseAndVisit: ThalesExamples communication_services_msg_manager.
	"SEPARATE body does not work yet"
	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInCsciDefinitions [
	self parseAndVisit: ThalesExamples csci_definitions.
	
	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInGlobalAds [
	self parseAndVisit: ThalesExamples global_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInInputRadarAdb [
	self parseAndVisit: ThalesExamples input_radar_adb.

	self assert: model allInvocations size equals: 4
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInInputRadarAds [
	self parseAndVisit: ThalesExamples input_radar_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInMailboxManagerAdb [
	self parseAndVisit: ThalesExamples mailbox_manager_adb.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInMailboxManagerAds [
	self parseAndVisit: ThalesExamples mailbox_manager_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInPiste3dAds [
	self parseAndVisit: ThalesExamples piste_3d_ads.
	"package renaming"
	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInSendAndRecordIfNecessary [
	self parseAndVisit: ThalesExamples send_and_record_if_necessary.

	self assert: model allInvocations size equals: 1
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInSurveillanceAdb [
	self parseAndVisit: ThalesExamples surveillance_adb.
	"TASK ... ENTRY would add one if treated"
	self assert: model allInvocations size equals: 6
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInSurveillanceAds [
	self parseAndVisit: ThalesExamples surveillance_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInTrackingTypes [
	self parseAndVisit: ThalesExamples tracking_types.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInTracks1Adb [
	self parseAndVisit: ThalesExamples tracks_1_adb.

	self assert: model allInvocations size equals: 2
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInTracks1Ads [
	self parseAndVisit: ThalesExamples tracks_1_ads.

	self assert: model allInvocations size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInTracks1Characterization [
	self parseAndVisit: ThalesExamples tracks_1_characterization.

	self assert: model allInvocations size equals: 1
]

{ #category : #'test-FASTAdaEntities' }
ThalesInvocationsTest >> testInvocationsInTracks1Kinematic [
	self parseAndVisit: ThalesExamples tracks_1_Kinematic.

	self assert: model allInvocations size equals: 1
]
