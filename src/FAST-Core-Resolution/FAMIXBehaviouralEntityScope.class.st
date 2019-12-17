"
Specialization of FAMIXContainerScope for BehaviouralEntities
lookupInLocals searches in localVariables and parameters
"
Class {
	#name : #FAMIXBehaviouralEntityScope,
	#superclass : #FAMIXContainerEntityScope,
	#category : #'FAST-Core-Resolution'
}

{ #category : #resolving }
FAMIXBehaviouralEntityScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#localVariables #parameters)

]

{ #category : #accessing }
FAMIXBehaviouralEntityScope >> parents [
	^ (owner parentType)
		ifNotNil: [ OrderedCollection with: owner parentType fastScope ]
		ifNil: [ OrderedCollection new ]
]
