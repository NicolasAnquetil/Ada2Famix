"
Represents an instance of a generic subprogram in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaGenSubpgmInstanceKind,
	#superclass : #AdaSubprogramKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'entity-creation' }
AdaGenSubpgmInstanceKind >> checkIf: anIdentifier matches: anEntity [
	^ (anEntity class = ADAGenericSubprogramInstanciation)

]
