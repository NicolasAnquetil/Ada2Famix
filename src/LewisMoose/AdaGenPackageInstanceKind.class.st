"
Represents an instance of a generic package in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaGenPackageInstanceKind,
	#superclass : #AdaPackageKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #matching }
AdaGenPackageInstanceKind >> checkIf: anIdentifier matches: anEntity [
	^ (anEntity class = ADAGenericPackageInstanciation)

]
