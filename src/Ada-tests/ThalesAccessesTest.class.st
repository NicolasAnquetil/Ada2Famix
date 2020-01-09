"
A ThalesReferencesTest is xxxxxxxxx.

"
Class {
	#name : #ThalesAccessesTest,
	#superclass : #ThalesAssociationsTest,
	#category : #'Ada-tests-ThalesAssocs'
}

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInCommonTypesAds [
	self parseAndVisit: ThalesExamples common_types_ads.

	self assert: model allAccesses size equals: 2
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInCommunicationServicesAdb [
	self parseAndVisit: ThalesExamples communication_services_adb.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInCommunicationServicesAds [
	self parseAndVisit: ThalesExamples communication_services_ads.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInCommunicationServicesMsgManager [
	self parseAndVisit: ThalesExamples communication_services_msg_manager.

	self assert: model allAccesses size equals: 2
	"UNKNOWN MSG_POINTER"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInCsciDefinitions [
	self parseAndVisit: ThalesExamples csci_definitions.

	self assert: model allAccesses size equals: 2
	"RADAR .. SURVEILLANCE"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInGlobalAds [
	self parseAndVisit: ThalesExamples global_ads.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInInputRadarAdb [
	self parseAndVisit: ThalesExamples input_radar_adb.
	"should treat enumerated values as variables"
	self assert: model allAccesses size equals: 11
	"MSG_POINTER MBX CSCI_DEFINITIONS.INPUT_RADAR MSG_POINTER COMMUNICATION_SERVICES.RADAR_TO_INPUT_RADAR MSG_POINTER PISTE_3D.MSG_CODE COMMUNICATION_SERVICES.INPUT_RADAR_TO_SURVEILLANCE MSG_POINTER  PISTE_2D.MSG_CODE COMMUNICATION_SERVICES.GESTION_TO_INPUT_RADAR"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInInputRadarAds [
	self parseAndVisit: ThalesExamples input_radar_ads.

	self assert: model allAccesses size equals: 1
	"PISTE_3D.MSG_CODE"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInMailboxManagerAdb [
	self parseAndVisit: ThalesExamples mailbox_manager_adb.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInMailboxManagerAds [
	self parseAndVisit: ThalesExamples mailbox_manager_ads.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInPiste3dAds [
	self parseAndVisit: ThalesExamples piste_3d_ads.
	
	self assert: model allAccesses size equals: 1
	"T_IO_ROUGH_3D_TRACK -> MAX_SIZE"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInSendAndRecordIfNecessary [
	self parseAndVisit: ThalesExamples send_and_record_if_necessary.

	self assert: model allAccesses size equals: 3
	"GLOBAL.UNKNOWN VIA_CHANNEL A_MSG"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInSurveillanceAdb [
	self parseAndVisit: ThalesExamples surveillance_adb.

	self assert: model allAccesses size equals: 12
	"MSG_POINTER MBX CSCI_DEFINITIONS.SURVEILLANCE MSG_POINTER COMMUNICATION_SERVICES.INPUT_RADAR_TO_SURVEILLANCE MSG_POINTER COMMUNICATION_SERVICES.GESTION_TO_SURVEILLANCE TRACK_CODE TRACK_REFERENCE RADAR_MSG PISTE_3D.MSG_CODE TRACK_3D "
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInSurveillanceAds [
	self parseAndVisit: ThalesExamples surveillance_ads.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInTrackingTypes [
	self parseAndVisit: ThalesExamples tracking_types.

	self assert: model allAccesses size equals: 6
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInTracks1Adb [
	self parseAndVisit: ThalesExamples tracks_1_adb.

	self assert: model allAccesses size equals: 4
	"SEND_TO_OPERATOR(CODE, THIS)
	 SEND_TO_OPERATOR(CODE => CODE, THIS => THIS)"
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInTracks1Ads [
	self parseAndVisit: ThalesExamples tracks_1_ads.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInTracks1Characterization [
	self parseAndVisit: ThalesExamples tracks_1_characterization.

	self assert: model allAccesses size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesAccessesTest >> testAccessesInTracks1Kinematic [
	self parseAndVisit: ThalesExamples tracks_1_Kinematic.

	self assert: model allAccesses size equals: 0
]
