Class {
	#name : #ThalesReferencesTest,
	#superclass : #ThalesAssociationsTest,
	#category : #'Ada-tests-ThalesAssocs'
}

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInCommonTypesAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples common_types_ads.

	self assert: model allReferences size equals: 1
	"only subtypes to non stubs create references:
	 T_CODE -> T_MAIN_CODE"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInCommunicationServicesAdb [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples communication_services_adb.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInCommunicationServicesAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples communication_services_ads.

	self assert: model allReferences size equals: 2
	"references to non stubs created by subtypes and accesses:
	 T_MAILBOX_ID -> MAILBOX_MANAGER.MAILBOX
	 T_MSG -> access T_HEAD"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInCommunicationServicesMsgManager [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples communication_services_msg_manager.
	"SEPARATE body does not work yet"
	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInCsciDefinitions [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples csci_definitions.
	
	self assert: model allReferences size equals: 1
	"T_ACTIVE_CSC -> T_ORIGIN_OR_DESTINATION"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInGlobalAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples global_ads.

	self assert: model allReferences size equals: 3
	"T_IO_5_UNSIGNED -> T_5_UNSIGNED
	 T_IO_5_UNSIGNED_ARRAY -> **AnonymousArray**
	 T_IO_5_UNSIGNED_ARRAY -> T_IO_5_UNSIGNED"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInInputRadarAdb [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples input_radar_adb.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInInputRadarAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples input_radar_ads.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInMailboxManagerAdb [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples mailbox_manager_adb.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInMailboxManagerAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples mailbox_manager_ads.

	self assert: model allReferences size equals: 1
	"MAILBOX -> MAILBOX_INFO"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInPiste3dAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples piste_3d_ads.

	self assert: model allReferences size equals: 6
	"references created by subtypes, accesses and arrays:
	 T_LIST_PLOTS -> T_3D_TRACK_PLOT
	 T_LIST_PLOTS -> **AnonymousArrayType**
	 T_LIST_PLOTS -> T_PLOTS_RANGE
	 T_ACCESS_3D_TRACK -> T_3D_TRACK
	
	Also references to types in a renamed package 
	PISTE_3D -> T_TEST 
	PISTE_3D -> T_TRACK_TYPE
	"

]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInSendAndRecordIfNecessary [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples send_and_record_if_necessary.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInSurveillanceAdb [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples surveillance_adb.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInSurveillanceAds [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples surveillance_ads.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInTrackingTypes [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples tracking_types.

	self assert: model allReferences size equals: 5
	"references created by subtypes, accesses and arrays:
	 T_TEST -> TRACKING_TYPES.T_TEST_2
	 T_ELEVATION -> T_ANGLE
	 T_AZIMUTH -> T_ANGLE
	 T_RANGE -> T_ANGLE
	 T_SYS_TIME -> TRACKING_TYPES.LARGE_INTEGER"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInTracks1Adb [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples tracks_1_adb.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInTracks1Ads [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples tracks_1_ads.

	self assert: model allReferences size equals: 1
	"T_REFERENCE -> T_DATA"
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInTracks1Characterization [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples tracks_1_characterization.

	self assert: model allReferences size equals: 0
]

{ #category : #'test-FASTAdaEntities' }
ThalesReferencesTest >> testReferencesInTracks1Kinematic [
	"Def is run on all files, then ref only on the following one"
	self parseAndVisit: ThalesExamples tracks_1_Kinematic.

	self assert: model allReferences size equals: 0
]
