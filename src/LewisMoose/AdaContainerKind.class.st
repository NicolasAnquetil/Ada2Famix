"
Represents a container identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

In an expression a.b.c, ""a"" and ""b"" are  ""containers"".
A container is usually a package, a task or a subprogram.
But it can also be a structured type and consequently, a variable of a structured type

"
Class {
	#name : #AdaContainerKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'as yet unclassified' }
AdaContainerKind class >> annotation [
	<MSEClass: #ContainerIdentifier super: #FASTAdaIdentifier>
	<package: #FASTAda>
]

{ #category : #matching }
AdaContainerKind >> checkIf: anIdentifier matches: anEntity [
	^ (anEntity isAdaContainer)
		 or: [ anEntity isAdaStructural
				and: [ anEntity declaredType notNil
				and: [
					(anEntity declaredType isAdaContainer)
					or: [(anEntity declaredType isAdaAccessType
							and: [ anEntity declaredType adaAccessed isAdaContainer ])  ]
				]]
		]

]

{ #category : #'entity-creation' }
AdaContainerKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADAUnknownContainer named: name ]
]
