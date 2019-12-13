"
A node representing the NULL statement in Ada

"
Class {
	#name : #FASTAdaNullStatement,
	#superclass : #FASTStatement,
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaNullStatement class >> annotation [
	<MSEClass: #NullStatement super: #FASTStatement>
	<package: #FASTAda>
]

{ #category : #'as yet unclassified' }
FASTAdaNullStatement >> childrenNodes [
	 ^ nil
]
