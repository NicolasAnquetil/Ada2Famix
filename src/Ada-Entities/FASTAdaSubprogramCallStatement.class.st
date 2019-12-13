"
Represents a call to a function or procedure in Ada
"
Class {
	#name : #FASTAdaSubprogramCallStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'subprogramName',
		'arguments'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaSubprogramCallStatement class >> annotation [
	<MSEClass: #SubprogramCallStatement super: #FASTStatement>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaSubprogramCallStatement >> arguments [
	
	^ arguments
]

{ #category : #accessing }
FASTAdaSubprogramCallStatement >> arguments: anObject [
	
	arguments := anObject
]

{ #category : #accessing }
FASTAdaSubprogramCallStatement >> subprogramName [
	<MSEProperty: #subprogramName type: #String>
	<MSEComment: 'Name of the called subprogram'>

	^ subprogramName
]

{ #category : #accessing }
FASTAdaSubprogramCallStatement >> subprogramName: anObject [
	
	subprogramName := anObject
]
