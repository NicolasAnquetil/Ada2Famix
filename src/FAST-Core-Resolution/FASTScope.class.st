"
A scope with a dictionary of known symbols.
Used for scope not associated to FAMIX entities, for example a block statements declaring its own local variables
"
Class {
	#name : #FASTScope,
	#superclass : #FASTAbstractScope,
	#instVars : [
		'parents',
		'symbols'
	],
	#category : #'FAST-Core-Resolution'
}

{ #category : #'as yet unclassified' }
FASTScope class >> newWithOwner: aFastEntity andParents: aCollection [
	^ (self new) 
		initializeWithOwner: aFastEntity andParents: aCollection
]

{ #category : #'as yet unclassified' }
FASTScope class >> newWithParents: aCollection [

	^ self newWithOwner: nil andParents: aCollection
]

{ #category : #adding }
FASTScope >> add: entity [
	^ symbols at: entity nameByPolicy put: entity
]

{ #category : #accessing }
FASTScope >> addParentScope: aScope [
	parents add: aScope
]

{ #category : #accessing }
FASTScope >> addParentScopeIfNotPresent: aScope [
	parents addIfNotPresent: aScope
]

{ #category : #accessing }
FASTScope >> clear [
	symbols := Dictionary new.
]

{ #category : #enumerating }
FASTScope >> do: aBlock [
	symbols do: aBlock
]

{ #category : #'initialize-release' }
FASTScope >> initialize [
	super initialize.
	parents := OrderedCollection new.
	self clear "initialize/clear symbol table"
]

{ #category : #'initialize-release' }
FASTScope >> initializeWithOwner: aFastEntity andParents: aCollection [

	self initializeWithOwner: aFastEntity.
	parents := aCollection
]

{ #category : #resolving }
FASTScope >> lookupInLocals: aSymbol [
	^ symbols
		at: aSymbol nameByPolicy
		ifPresent: [ :val |
			val isCollection
				ifTrue:  [ val ]
				ifFalse: [ OrderedCollection new
					add: val ;
					yourself] ]
		ifAbsent: [ OrderedCollection new ]

]

{ #category : #resolving }
FASTScope >> lookupInLocalsWith: aLookup [

	#advancedLookup.
	^ self lookupInLocals: aLookup
]

{ #category : #accessing }
FASTScope >> parents [
	^ parents
]

{ #category : #accessing }
FASTScope >> parents: aCollection [
	parents := aCollection
]
