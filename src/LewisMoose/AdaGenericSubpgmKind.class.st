"
Represents an identifier of a generic subprogram in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaGenericSubpgmKind,
	#superclass : #AdaSubprogramKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'entity-creation' }
AdaGenericSubpgmKind >> checkIf: anIdentifier matches: anEntity [
	^ (anEntity isAdaSubprogram) and:
		[ anEntity isGeneric ]

]
