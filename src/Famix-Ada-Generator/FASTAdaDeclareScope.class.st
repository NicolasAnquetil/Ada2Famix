"
Scope for FASTAdaDeclareStatement

FASTAdaDeclareStatements look like BehaviouralEntities but they are also statements.
So FASTAdaDeclareScope inherits from FAMIXContainerEntityScope but searches for its parent scope up the chain of statements that contain it
"
Class {
	#name : #FASTAdaDeclareScope,
	#superclass : #FASTAdaScope,
	#category : #'Famix-Ada-Generator-predefinedFAST'
}

{ #category : #resolving }
FASTAdaDeclareScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#localVariables #packages)

]

{ #category : #accessing }
FASTAdaDeclareScope >> parents [
	^ self owner parentNode
		ifNil: [OrderedCollection new]
		ifNotNil: [:p || node |
			node := p.
			[ node fastScope isNil ] whileTrue: [  node := node parentNode ].
			OrderedCollection with: node fastScope
		]
]
