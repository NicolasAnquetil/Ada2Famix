"
Instances of this class represent specialized extensions of ADAType instances of type 'array'.


"
Class {
	#name : #ADATypeArray,
	#superclass : #ADAType,
	#instVars : [
		'numberOfDimensions'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeArray class >> annotation [
	<MSEClass: #TypeArray super: #ADAType>
	<package: #ADA>
]

{ #category : #'as yet unclassified' }
ADATypeArray class >> commonMetricFilters [
	^ super commonMetricFilters , {(#numberOfDimensions -> 'Number of dimensions')}
]

{ #category : #accessing }
ADATypeArray >> numberOfDimensions [
	<MSEProperty: #numberOfDimensions type: #Number>
	<MSEComment: 'The number of dimensions of this Array type.'>
	^ numberOfDimensions ifNil: [ 0 ]
]

{ #category : #accessing }
ADATypeArray >> numberOfDimensions: anInteger [
	numberOfDimensions := anInteger
]
