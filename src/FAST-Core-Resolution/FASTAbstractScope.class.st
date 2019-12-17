"
The base class representing a scope and holding reference to a parent scope
"
Class {
	#name : #FASTAbstractScope,
	#superclass : #MooseEntity,
	#instVars : [
		'owner'
	],
	#category : #'FAST-Core-Resolution'
}

{ #category : #'instance creation' }
FASTAbstractScope class >> defaultResolvingAuthority [
	^ FASTPublicAccessChecker new
]

{ #category : #'instance creation' }
FASTAbstractScope class >> newWithOwner: aFastEntity [

	^ (self new) 
		initializeWithOwner: aFastEntity;
		yourself.
]

{ #category : #'initialize-release' }
FASTAbstractScope >> initialize [
	super initialize.
]

{ #category : #'initialize-release' }
FASTAbstractScope >> initializeWithOwner: aFastEntity [

	self initialize.
	owner := aFastEntity
]

{ #category : #resolving }
FASTAbstractScope >> lookup: aSymbol [
	"Search for aSymbol in the receicer scope and its parent scopes
	Answer a collection of candidates"

	| candidates |
	candidates := self lookupInLocals: aSymbol.
	self parentsDo: [ :p | candidates addAll: (p lookup: aSymbol) ].	
	^ candidates
]

{ #category : #resolving }
FASTAbstractScope >> lookup: aSymbol where: aBlock [
	"Search for aSymbol in the receicer scope and its parent scopes
	Answer a single object or nil"

	#advancedLookup.
	^FASTVariableLookup lookup: aSymbol where: aBlock within: self


]

{ #category : #resolving }
FASTAbstractScope >> lookupInLocals: aSymbol [
	"Search for aSymbol in the receiver scope but ignore parent scopes"

	self subclassResponsibility 
]

{ #category : #resolving }
FASTAbstractScope >> lookupInLocalsWith: aLookup [
	"Search for aLookup in the receiver scope but ignore parent scopes"

	#advancedLookup.
	self subclassResponsibility 
]

{ #category : #resolving }
FASTAbstractScope >> lookupWith: aLookup [
	"Search for aLookup in the receicer scope and its parent scopes
	Answer a collection with the first object that matches the conditions"

	| candidates |
	#advancedLookup.
	(candidates := self lookupInLocalsWith: aLookup) isEmpty
		ifFalse: [ 
			"No need to lookup any further"
			^ candidates ]. 
		
	self parentsDo: [ :p | 
			candidates addAll: (aLookup lookup: p).
			candidates isEmpty
				ifFalse: [ 
					"No need to lookup any further"
					^ candidates ] ].
	^ candidates
]

{ #category : #accessing }
FASTAbstractScope >> owner [
	^ owner
]

{ #category : #accessing }
FASTAbstractScope >> owner: anEntity [
	owner := anEntity
]

{ #category : #accessing }
FASTAbstractScope >> parents [
	self subclassResponsibility
]

{ #category : #accessing }
FASTAbstractScope >> parents: anObject [
	self subclassResponsibility
]

{ #category : #enumerating }
FASTAbstractScope >> parentsDo: aBlock [
	"Subclasses may reimplement as needed
	when the #parents method does not make it exactly
	
	Note:
	This is some sort of code smell
	Could be done better by delegating #parents to the owner
	with double-dispatching
	"
	
	^self parents do: aBlock
]

{ #category : #printing }
FASTAbstractScope >> printOn: aStream [
	self class printOn: aStream.
	aStream nextPutAll: ' of '.
	self owner printOn: aStream
]

{ #category : #resolving }
FASTAbstractScope >> resolve: aSymbol forNode: queryingNode [

	^ (self lookup: aSymbol)
		ifEmpty: [ nil ]
		ifNotEmpty: 
			[ :candidates |
			candidates detect: 
				[ :candidate |
				(aSymbol matches: candidate)
					and: [queryingNode resolvingAuthority 
								entity: self 
								canAccess: candidate ] ]
			ifNone: [ nil ] ]
]
