Extension { #name : #FASTNamedEntity }

{ #category : #'*FAST-Core-Resolution' }
FASTNamedEntity >> matches: anEntity [
	"matches if entity is a variable
	
	we might not have enough information here to decide if it matches
	for example we accept variable or type, but a type on the LHS of an assignement would not do"
	
	^ (anEntity isKindOf: FAMIXStructuralEntity) or: [ anEntity isKindOf: FAMIXType ]
]
