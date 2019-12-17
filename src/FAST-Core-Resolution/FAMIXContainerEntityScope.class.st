"
Specialization of FAMIXScope for ContainerEntities
lookupInLocals searches in functions and types
"
Class {
	#name : #FAMIXContainerEntityScope,
	#superclass : #FAMIXScope,
	#category : #'FAST-Core-Resolution'
}

{ #category : #resolving }
FAMIXContainerEntityScope >> lookupInLocals: aSymbol [
	"  and "
	| nameByPolicy |
	nameByPolicy := aSymbol nameByPolicy.
	^(self lookupSelectors asOrderedCollection  
		gather: [ :each | self owner perform: each ])
		select: [ :obj | obj nameByPolicy = nameByPolicy  ]
	

]

{ #category : #resolving }
FAMIXContainerEntityScope >> lookupInLocalsWith: aLookup [

	| candidate |
	#advancedLookup.	
	candidate := (self lookupSelectors 
		gather: [ :each | self owner perform: each ])
		detect: [ :obj | aLookup isCandidate: obj ]
		ifNone: [ ^ OrderedCollection new ].
	^ OrderedCollection with: candidate	

]

{ #category : #resolving }
FAMIXContainerEntityScope >> lookupSelectors [

	#advancedLookup.
	^ #(#functions #types)
]
