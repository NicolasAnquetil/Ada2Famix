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

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asContainerIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaContainerKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asGenPackageInstanceIdentifier [
	matchingTypes add: AdaGenPackageInstanceKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asGenSubpgmInstanceIdentifier [
	"adds AdaGenericSubpgmInstKind to the list of matching types"
	matchingTypes add: AdaGenSubpgmInstanceKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asGenericPackageIdentifier [
	matchingTypes add: AdaGenericPackageKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asGenericSubpgmIdentifier [
	"adds AdaGenericSubpgmKind to the list of matching types"
	matchingTypes add: AdaGenericSubpgmKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asPackageIdentifier [
	"adds FASTAdaPackageIdentifier in the list of matching types"
	matchingTypes add: AdaPackageKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asSeparateIdentifier [
	matchingTypes add: AdaSeparateKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asStructuralIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaStructuralKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asSubprogramIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaSubprogramKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asTaskIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaTaskKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asTypeIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaTypeKind new
]

{ #category : #converting }
FASTAdaQualifiedIdentifier >> asValueIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	self asStructuralIdentifier.
	self asSubprogramIdentifier
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

{ #category : #converting }
FASTAdaQualifiedIdentifier >> createStubFor: theCreator [
	"gets the stubCreationBlock from the first matchingType
	 This blocks takes two arguments: the creator of the stub and the name of the stub"
	| stubCreationBlock |
	stubCreationBlock := (matchingTypes isEmpty)
							ifTrue:  [ AdaIdentifierKind defaultStubCreationBlock ]
							ifFalse: [ matchingTypes first stubCreationBlock ].
	^ stubCreationBlock value: theCreator value: self mainIdentifier
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
