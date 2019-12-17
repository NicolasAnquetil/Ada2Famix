"
Specialization of FAMIXContainerScope for BehaviouralEntities
lookupInLocals searches in childScopes
"
Class {
	#name : #FAMIXScopingEntityScope,
	#superclass : #FAMIXContainerEntityScope,
	#category : #'FAST-Core-Resolution'
}

{ #category : #resolving }
FAMIXScopingEntityScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#childScopes #globalVariables)
]

{ #category : #accessing }
FAMIXScopingEntityScope >> parents [
	^ (owner parentScope)
		ifNotNil: [ OrderedCollection with: owner parentScope fastScope ]
		ifNil: [ OrderedCollection new ]
]
