"
This is an abstract superclass for those ADAType objects that are also containers
"
Class {
	#name : #ADAContainerType,
	#superclass : #ADAType,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAContainerType class >> annotation [
	<MSEClass: #ContainerType super: #ADAType>
	<package: #ADA>
]

{ #category : #testing }
ADAContainerType >> isAdaContainer [

	^true
]
