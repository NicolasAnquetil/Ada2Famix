"
Same as a FASTStatementBlock but without scope because Ada blocks don't declare variables
"
Class {
	#name : #FASTAdaStatementBlock,
	#superclass : #FASTStatementBlock,
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaStatementBlock class >> annotation [
	<MSEClass: #StatementBlock super: #FASTStatementBlock>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaStatementBlock >> accesses [
	^ self parentNode ifNotNil: #accesses
]

{ #category : #accessing }
FASTAdaStatementBlock >> accesses: anObject [
	self parentNode ifNotNil: [ :pn | pn accesses: anObject ]
]

{ #category : #accessing }
FASTAdaStatementBlock >> hasScope [
	^ false
]

{ #category : #accessing }
FASTAdaStatementBlock >> localVariables [
	^ self parentNode ifNotNil: #localVariables
]

{ #category : #accessing }
FASTAdaStatementBlock >> localVariables: anObject [
	self parentNode ifNotNil: [ :pn | pn localVariables: anObject ]
]

{ #category : #accessing }
FASTAdaStatementBlock >> name [
	^ self privateState propertyAt: #name ifAbsent: [ super name ]
]

{ #category : #accessing }
FASTAdaStatementBlock >> name: aString [
	^ self privateState propertyAt: #name put: aString
]

{ #category : #accessing }
FASTAdaStatementBlock >> outgoingInvocations [
	^ self parentNode ifNotNil: #outgoingInvocations
]

{ #category : #accessing }
FASTAdaStatementBlock >> outgoingInvocations: anObject [
	self parentNode ifNotNil: [ :pn | pn outgoingInvocations: anObject ]
]
