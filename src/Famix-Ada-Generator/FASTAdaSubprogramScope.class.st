"
A FastAdaContainerScope for subprograms. They have parameters which need to be lookedIn too
"
Class {
	#name : #FASTAdaSubprogramScope,
	#superclass : #FASTAdaContainerScope,
	#category : #'Famix-Ada-Generator-predefinedFAST'
}

{ #category : #resolving }
FASTAdaSubprogramScope >> lookupSelectors [

	#advancedLookup.
	^super lookupSelectors 
		, #(#parameters )

]
