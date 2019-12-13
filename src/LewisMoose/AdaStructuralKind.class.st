"
Represents a variable identifier in the AST of an Ada program.
(see also FASTAdaIdentifier)

note that it is impossible in Ada syntax to differentiate between a function call ""f(1)"" and accessing an element of an array ""a(1)""
"
Class {
	#name : #AdaStructuralKind,
	#superclass : #AdaIdentifierKind,
	#category : #'LewisMoose-resolving'
}

{ #category : #'as yet unclassified' }
AdaStructuralKind class >> annotation [
	<MSEClass: #StructuralIdentifier super: #FASTAdaIdentifier>
	<package: #FASTAda>
]

{ #category : #matching }
AdaStructuralKind >> checkIf: anIdentifier matches: anEntity [
	self flag: 'should check dimensions of arrays too'.
	^ anEntity isAdaStructural

]

{ #category : #'entity-creation' }
AdaStructuralKind >> stubCreationBlock [
	^ [ :creator :name | creator createEntity: ADAStructuralEntity named: name ]
]
