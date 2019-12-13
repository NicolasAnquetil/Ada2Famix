"
Represents an identifier of a generic package in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaGenericPackageKind,
	#superclass : #AdaPackageKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #matching }
AdaGenericPackageKind >> checkIf: anIdentifier matches: anEntity [
	^ (super checkIf: anIdentifier matches: anEntity)
		and: [ anEntity isGeneric ]

]
