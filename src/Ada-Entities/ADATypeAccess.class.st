"
Instances of this class represent specialized extensions of ADAType instances of type 'access'.



"
Class {
	#name : #ADATypeAccess,
	#superclass : #ADAType,
	#instVars : [
		'adaAccessed'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeAccess class >> annotation [
	<MSEClass: #TypeAccess super: #ADAType>
	<package: #ADA>
]

{ #category : #accessing }
ADATypeAccess >> adaAccessed [
	<MSEProperty: #adaAccessed type: #ADAContainerEntity>
	<MSEComment: 'In case this is an Ada ACCESS type, the entity toward which it points'>

	^ adaAccessed
]

{ #category : #accessing }
ADATypeAccess >> adaAccessed: anObject [
	adaAccessed := anObject
]

{ #category : #testing }
ADATypeAccess >> isAdaAccessType [

	^true
]
