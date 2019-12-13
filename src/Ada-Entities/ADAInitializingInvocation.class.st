"
This class is used to model function invocations that may be found for initializing member variables of type record,
e.g.

type t_rec is record
	myVar : myType := myFunc;
end record;

In the above example, variable ""myVar"" of type ""myType"" is initialized using the value returned by invoking the function ""myFunc""
"
Class {
	#name : #ADAInitializingInvocation,
	#superclass : #FAMIXInvocation,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #meta }
ADAInitializingInvocation class >> annotation [
	<MSEClass: #InitializingInvocation super: #FAMIXInvocation>
	<package: #ADA>
]

{ #category : #accessing }
ADAInitializingInvocation >> initializer [
	<MSEProperty: #initializer type: #ADATypeRecord opposite: #initializingInvocations>
	<MSEComment: 'The record type making the initializing call. from-side of the association'>
	<source>
	^self sender
]

{ #category : #accessing }
ADAInitializingInvocation >> initializer: aTypeRecord [
	sender := FMMultivalueLink on: self
					update: #initializingInvocations
					from: self initializer
					to: aTypeRecord
]
