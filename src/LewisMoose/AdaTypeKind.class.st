"
Represents a type identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaTypeKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'as yet unclassified' }
AdaTypeKind class >> annotation [
	<MSEClass: #TypeIdentifier  super: #FASTAdaContainerIdentifier>
	<package: #FASTAda>
]

{ #category : #matching }
AdaTypeKind >> checkIf: anIdentifier matches: anEntity [
	^ anEntity isAdaType
]

{ #category : #'entity-creation' }
AdaTypeKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADAType named: name ]
]
