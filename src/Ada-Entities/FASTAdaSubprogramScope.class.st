"
A FastAdaContainerScope for subprograms. They have parameters which need to be lookedIn too
"
Class {
	#name : #FASTAdaSubprogramScope,
	#superclass : #FASTAdaContainerScope,
	#category : #'Ada-Entities-FAST-Scope'
}

{ #category : #resolving }
FASTAdaSubprogramScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#parameters )

]
