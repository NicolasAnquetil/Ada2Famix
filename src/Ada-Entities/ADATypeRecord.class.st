"
Instances of this class represent specialized extensions of ADAType instances of type 'record'.
"
Class {
	#name : #ADATypeRecord,
	#superclass : #ADAContainerType,
	#instVars : [
		'initializingInvocations'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeRecord class >> annotation [
	<MSEClass: #TypeRecord super: #ADAContainerType>
	<package: #ADA>
]

{ #category : #testing }
ADATypeRecord >> initialize [

	super initialize.
	initializingInvocations := FMNullMultivalueLink 
		on: self 
		opposite: #initializer: 
		selector: #initializingInvocations.

]

{ #category : #testing }
ADATypeRecord >> initializingInvocations [

	"Returns the list of invocations performed on this entity (considered as the receiver)"
	<MSEProperty: #initializingInvocations type: #ADAInitializingInvocation opposite: #initializer> <multivalued> <derived>
	<MSEComment: 'List of invocations performed on this entity (considered as the receiver)'>
	
	^initializingInvocations
]

{ #category : #testing }
ADATypeRecord >> initializingInvocations: anInvocation [

	^initializingInvocations value: anInvocation
]

{ #category : #testing }
ADATypeRecord >> isAdaRecordType [

	^true
]
