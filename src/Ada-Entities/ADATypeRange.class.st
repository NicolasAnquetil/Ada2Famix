"
Instances of this class represent specialized extensions of ADAType instances of type 'range'.
"
Class {
	#name : #ADATypeRange,
	#superclass : #ADAContainerType,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeRange class >> annotation [
	<MSEClass: #TypeRange super: #ADAContainerType>
	<package: #ADA>
]

{ #category : #testing }
ADATypeRange >> isAdaRangeType [

	^true
]
