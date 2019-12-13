"
Represents a separate declaration identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaSeparateKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #matching }
AdaSeparateKind >> checkIf: anIdentifier matches: anEntity [
	^ anEntity class = ADASeparateDeclaration
]

{ #category : #'entity-creation' }
AdaSeparateKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADASeparateDeclaration named: name ]
]
