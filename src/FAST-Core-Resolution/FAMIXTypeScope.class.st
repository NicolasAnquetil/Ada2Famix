"
Specialization of FAMIXContainerScope for BehaviouralEntities
lookupInLocals searches in methods and attributes
"
Class {
	#name : #FAMIXTypeScope,
	#superclass : #FAMIXContainerEntityScope,
	#category : #'FAST-Core-Resolution'
}

{ #category : #resolving }
FAMIXTypeScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#attributes #methods)

]

{ #category : #accessing }
FAMIXTypeScope >> owner: anEntity [
	super owner: anEntity.
	owner superInheritances do: [ :inh |
		self parents add: (inh superclass fastScope)
	]
]

{ #category : #accessing }
FAMIXTypeScope >> parents [
	| parents |
	parents := OrderedCollection new.
	(owner belongsTo)
		ifNotNil: [ parents add: owner belongsTo fastScope ].
	owner superInheritances do: [ :inh |
		parents add: inh superclass fastScope
	].
	^ parents
]
