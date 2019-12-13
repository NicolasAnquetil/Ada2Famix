"
A node representing one alternative in a case statement in Ada

eg.

WHEN opt1 => statement;

"
Class {
	#name : #FASTAdaCaseAlternative,
	#superclass : #FASTEntity,
	#instVars : [
		'parentStatement',
		'choices',
		'statements'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaCaseAlternative class >> annotation [
	<MSEClass: #CaseAlternative super: #FASTEntity>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaCaseAlternative >> childrenNodes [
	 ^ statements
]

{ #category : #accessing }
FASTAdaCaseAlternative >> choices [
	<MSEProperty: #choices type: #FAMIXAccess>
	<multivalued>
	<MSEComment: 'List of variables used in a WHEN of a CASE statement'>
	
	^ choices
]

{ #category : #accessing }
FASTAdaCaseAlternative >> choices: anObject [
	
	choices := anObject
]

{ #category : #initialization }
FASTAdaCaseAlternative >> initialize [
	super initialize.
	statements := FMMultivalueLink on: self opposite: #parentCase:.
	"i-var 'choices' must be represented by an OrderedCollection
	because it is a list of ADAAccess objects that are already linked to
	the containing procedure/function	"
	choices := OrderedCollection new.	
]

{ #category : #accessing }
FASTAdaCaseAlternative >> parentNode [
	^ self parentStatement
]

{ #category : #accessing }
FASTAdaCaseAlternative >> parentNode: aCaseStatement [
	self parentStatement: aCaseStatement
]

{ #category : #accessing }
FASTAdaCaseAlternative >> parentStatement [
	<MSEProperty: #parentStatement type: #FASTAdaCaseStatement opposite: #alternatives>
	<MSEComment: 'The case statement which contains this alternative'>
	^ parentStatement
]

{ #category : #accessing }
FASTAdaCaseAlternative >> parentStatement: aCaseStatement [
	parentStatement := FMMultivalueLink
		on: self
		update: #alternatives
		from: self parentStatement
		to: aCaseStatement
]

{ #category : #accessing }
FASTAdaCaseAlternative >> statements [
	<MSEProperty: #statements type: #FASTStatement opposite: #parentCase>
	<multivalued>
	<derived>
	<MSEComment: 'List of statements used in a WHEN of a CASE statement'>
	^ statements
]

{ #category : #accessing }
FASTAdaCaseAlternative >> statements: anObject [
	
	statements := anObject
]
