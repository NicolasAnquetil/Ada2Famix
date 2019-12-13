"
Represents a package identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

"
Class {
	#name : #AdaPackageKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #matching }
AdaPackageKind >> checkIf: anIdentifier matches: anEntity [
	^ anEntity isAdaPackage or: [anEntity isAdaUnknownContainer]
]

{ #category : #'entity-creation' }
AdaPackageKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADAPackage named: name ]
]
