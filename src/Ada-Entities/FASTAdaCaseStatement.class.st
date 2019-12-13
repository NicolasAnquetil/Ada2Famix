"
A node representing a CASE statement in Ada

eg.

CASE aValue IS
WHEN alt1 => statement;
WHEN alt2 => statement;
END CASE
"
Class {
	#name : #FASTAdaCaseStatement,
	#superclass : #FASTStatement,
	#instVars : [
		'alternatives'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaCaseStatement class >> annotation [
	<MSEClass: #CaseStatement super: #FASTStatement>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaCaseStatement >> alternatives [
	<MSEProperty: #alternatives type: #FASTAdaCaseAlternative opposite: #parentStatement>
	<multivalued>
	<derived>
	<MSEComment: 'List of alternatives (WHEN) of the CASE statement'>
	^ alternatives
]

{ #category : #accessing }
FASTAdaCaseStatement >> alternatives: aCollection [
	
	alternatives := aCollection
]

{ #category : #accessing }
FASTAdaCaseStatement >> childrenNodes [
	 ^ alternatives
]

{ #category : #'as yet unclassified' }
FASTAdaCaseStatement >> initialize [
	super initialize.
	alternatives :=  FMMultivalueLink on: self opposite: #parentStatement:
]

{ #category : #accessing }
FASTAdaCaseStatement >> name [
	^ 'case statement'
]
