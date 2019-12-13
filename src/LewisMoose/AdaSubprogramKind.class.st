"
Represents a subprogram identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

It is a FASTAdaValueIdentifier in the sens that a function call returns a value and can therefore be used in an expression
"
Class {
	#name : #AdaSubprogramKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'as yet unclassified' }
AdaSubprogramKind class >> annotation [
	<MSEClass: #SubprogramIdentifier  super: #FASTAdaContainerIdentifier>
	<package: #FASTAda>
]

{ #category : #matching }
AdaSubprogramKind >> checkIf: anIdentifier matches: anEntity [
	^ ((anEntity isAdaSubprogram)
			or: [anEntity isAdaUnknownContainer ])
		and: [ anIdentifier nbArguments = anEntity parameters size]

]

{ #category : #'entity-creation' }
AdaSubprogramKind >> stubCreationBlock [
	^ [ :creator :name | creator createSubprogram: name withSignature: name , '(???)' ]
]
