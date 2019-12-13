"
Represents a task identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaTaskKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #matching }
AdaTaskKind >> checkIf: anIdentifier matches: anEntity [
	^ anEntity isAdaTask or: [anEntity isAdaUnknownContainer]
]

{ #category : #'entity-creation' }
AdaTaskKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADATask named: name ]
]
