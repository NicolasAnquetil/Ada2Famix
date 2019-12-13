"
abstract class for all kinds of identifiers that may be found in an Ada program.

It defines methods:
- to check whether a FASTAdaQualifiedIdentifier matches an entity
- how an entity of this kind may be created (in this case, it will be a stub as all known entities should have been created after LwsAdaVisitorDef)
"
Class {
	#name : #AdaIdentifierKind,
	#superclass : #Object,
	#category : #'LewisMoose-resolving'
}

{ #category : #annotation }
AdaIdentifierKind class >> annotation [
	<MSEClass: #Identifier super: #FASTExpression>
	<package: #FASTAda>
]

{ #category : #'entity-creation' }
AdaIdentifierKind class >> defaultStubCreationBlock [
	^ [ :creator :stubName | creator createEntity: ADAUnknownContainer named: stubName ]
]

{ #category : #initialization }
AdaIdentifierKind class >> named: aString [
	^ self new name: aString; yourself
]

{ #category : #matching }
AdaIdentifierKind >> checkIf: anIdentifier matches: anEntity [
	self subclassResponsibility
]

{ #category : #'entity-creation' }
AdaIdentifierKind >> stubCreationBlock [
	self subclassResponsibility 
]
