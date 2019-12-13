"
An ADAMethod represents an Ada OO method, e.g.

parentType
	- return the type that implements the Ada method

"
Class {
	#name : #ADAMethod,
	#superclass : #ADASubprogram,
	#instVars : [
		'parentType'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAMethod class >> annotation [
	<MSEClass: #Method super: #ADASubprogram>
	<package: #ADA>
]

{ #category : #testing }
ADAMethod >> isMethod [
	
	^true
]

{ #category : #accessing }
ADAMethod >> parentType [
	<MSEProperty: #parentType type: #ADATypeClass opposite: #methods>
	<MSEComment: 'The class (i.e. TypeClass) owning this method'>

	^ parentType
]

{ #category : #accessing }
ADAMethod >> parentType: aType [

	parentType := FMMultivalueLink on: self
					update: #methods
					from: self parentType
					to: aType
]
