"
A scope, used in FAST but attached to a Famix entity 
symbols are not searched in the symbol table but in the Famix children of the Famix entity
"
Class {
	#name : #FAMIXScope,
	#superclass : #FASTAbstractScope,
	#category : #'FAST-Core-Resolution'
}

{ #category : #accessing }
FAMIXScope >> owner: anEntity [
	super owner: anEntity.
	anEntity fastScope: self
]
