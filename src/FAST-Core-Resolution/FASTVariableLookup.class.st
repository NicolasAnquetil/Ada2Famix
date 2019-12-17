"
I am a lookup operation. My role is to hold the search criteria for the lookup. I also hold some context information about the lookup being performed. I collaborate with a FAST scope to find the candidates that match the search criteria. Once a matching candidate has been found, the lookup is terminated.

Public API and Key Messages:
#lookup:  sent to start the lookup of the supplied FAST scope 
#isCandidate: sent to determine if a given object matches the search criteria 

    Instance Variables
	resolution:		The object that matches the ctriteria or nil
	variableName:	The name of the object being searched for
	variableType:	The class of the object being searched for
	visited:			The Set of scopes that were already searched
	where:			A block that must be satisfied by the object being searched for


"
Class {
	#name : #FASTVariableLookup,
	#superclass : #Object,
	#instVars : [
		'variableName',
		'variableType',
		'where',
		'visited',
		'resolution'
	],
	#category : #'FAST-Core-Resolution'
}

{ #category : #api }
FASTVariableLookup class >> lookup: aSymbol where: aBlock within: aCloud [
	"Create an instance, configure it, run it
	then answer the resolution or nil"

	^(self new)
		variableName: aSymbol;
		where: aBlock;
		lookup: aCloud;
		resolution



]

{ #category : #'instance creation' }
FASTVariableLookup class >> name: aSymbol type: aType [

	^(self new)
		variableName: aSymbol;
		variableType: aType;
		yourself

	
]

{ #category : #initialization }
FASTVariableLookup >> initialize [

	super initialize.
	variableType := Object.
	visited := Set new.

]

{ #category : #testing }
FASTVariableLookup >> isCandidate: anObject [
	"Answer true if 'anObject' satisfies all the criteria
	1. Must have the same nameanObject 
	2. Must have the desired type
	3. Must satisfy the where clause imposed by the client
	Answer false otherwise"

	| isCandidate |
	(isCandidate := anObject nameByPolicy = self nameByPolicy
		and: [ (anObject isKindOf: variableType) 
			and: [ self isSatisfiedWith: anObject ] ])
		ifTrue: [ 
			self assert: resolution isNil.
			resolution := anObject ].
	^ isCandidate
]

{ #category : #testing }
FASTVariableLookup >> isSatisfiedWith: anObject [

	^ where 
		ifNotNil: [ where value: anObject ]
		ifNil: [ true ]
		
]

{ #category : #api }
FASTVariableLookup >> lookup: aScope [
	"
	Answer a collection of zero or one candidate
	Should more than one candidates exist, an error would be raised
	by the #isCandidate: method
	
	Execute the fragment below if this method needs restart in debugger
	visited remove: aScope
	"
	(visited includes: aScope)
		ifTrue: [ ^ OrderedCollection new ].
	visited add: aScope.
	^ aScope lookupWith: self.
]

{ #category : #accessing }
FASTVariableLookup >> nameByPolicy [

	^ variableName nameByPolicy
]

{ #category : #printing }
FASTVariableLookup >> printOn: aStream [

	aStream 
		nextPutAll: 'Look up ';
		nextPutAll: variableName
]

{ #category : #accessing }
FASTVariableLookup >> resolution [

	^ resolution
]

{ #category : #accessing }
FASTVariableLookup >> variableName: anObject [

	variableName := anObject
]

{ #category : #accessing }
FASTVariableLookup >> variableType: anObject [

	variableType := anObject
]

{ #category : #accessing }
FASTVariableLookup >> where: aBlock [

	where := aBlock
]
