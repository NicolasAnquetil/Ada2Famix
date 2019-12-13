"
Represents a fully qualified identifier (ex. ""a.b.c"") in an Ada program.

It has container (""a"" and ""b"" in the example above) and a main identifier (""c"" in the example above)

A FASTAdaAbstractQualifiedIdentifier can be used in the FAST lookup process (it answers to #nameByPolicy)

It has a selector part, when ""c"" has arguments
"
Class {
	#name : #FASTAdaQualifiedIdentifier,
	#superclass : #Object,
	#instVars : [
		'identifierList',
		'selector',
		'matchingTypes',
		'nameByPolicy'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'instance creation' }
FASTAdaQualifiedIdentifier class >> with: anIdentifier [
	^ self new
		addIdentifier: anIdentifier ;
		yourself
]

{ #category : #'instance creation' }
FASTAdaQualifiedIdentifier class >> withAll: aCollection [
	| q |
	q := self new.
	aCollection do: [ :e | q addIdentifier: e ].
	^ q
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> addArgument: aQualified [
	selector add: aQualified

]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> addIdentifier: anIdentifier [
	identifierList add: anIdentifier
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> arguments [
	^ selector

]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> arguments: aCollection [
	selector := aCollection

]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> at: i [
	^ identifierList at: i
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> clearMatchingTypes [
	matchingTypes removeAll
]

{ #category : #extraction }
FASTAdaQualifiedIdentifier >> containers [
	"returns the container part of the list of identifiers as a QualifiedIdentifierAsList
	 New qualifiedIdentifier as o declared matchingType"
	^ FASTAdaQualifiedIdentifier withAll: identifierList allButLast
]

{ #category : #enumerating }
FASTAdaQualifiedIdentifier >> do: aBlock [
	^ identifierList do: aBlock
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> fifth [
	^ identifierList fifth
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> first [
	^ identifierList first
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> fourth [
	^ identifierList fourth
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> hasArguments [
	^ selector notEmpty

]

{ #category : #initialization }
FASTAdaQualifiedIdentifier >> initialize [
	super initialize.
	identifierList := OrderedCollection new.
	selector := OrderedCollection new.
	matchingTypes := OrderedCollection new.
]

{ #category : #testing }
FASTAdaQualifiedIdentifier >> isEmpty [
	^ identifierList isEmpty
]

{ #category : #extraction }
FASTAdaQualifiedIdentifier >> mainIdentifier [
	"returns the main part of the list of identifiers, e.g in a.b.c it would be c"
	^ identifierList ifEmpty: [ nil ] ifNotEmpty: [ identifierList last ]
]

{ #category : #matching }
FASTAdaQualifiedIdentifier >> matches: anEntity [
	"whether anEntity can be represented by this identifier
	 here we can only check than the names match"
	^ (self nameByPolicy) = (anEntity sourceLanguage casePolicy: anEntity name)
			and: [ matchingTypes anySatisfy: [ :t | t checkIf: self matches: anEntity ] ] 
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> nameByPolicy [
	^ nameByPolicy ifNil: 
		[ nameByPolicy := self sourceLanguage casePolicy: self mainIdentifier  ]
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> nbArguments [
	^ selector size
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> second [
	^ identifierList second
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> size [
	^ identifierList size
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> sourceLanguage [
	^ ADASourceLanguage singleton
]

{ #category : #accessing }
FASTAdaQualifiedIdentifier >> third [
	^ identifierList third
]

{ #category : #initialization }
FASTAdaQualifiedIdentifier >> withIdentifier: identifier matchingTypes: types [
	identifierList := OrderedCollection with: identifier.
	matchingTypes := OrderedCollection withAll: types.
	^ self
]

{ #category : #extraction }
FASTAdaQualifiedIdentifier >> withoutContainers [
	"returns the main part of the list of identifiers as a QualifiedIdentifierAsList"
	^ FASTAdaQualifiedIdentifier new withIdentifier: identifierList last matchingTypes: matchingTypes
]
