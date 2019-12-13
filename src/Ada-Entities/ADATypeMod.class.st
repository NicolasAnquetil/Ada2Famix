"
Instances of this class represent specialized extensions of ADAType instances of type 'mod'.
"
Class {
	#name : #ADATypeMod,
	#superclass : #ADAType,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeMod class >> annotation [
	<MSEClass: #TypeMode super: #ADAType>
	<package: #ADA>
]

{ #category : #testing }
ADATypeMod >> isAdaModType [

	^true
]
