"
A FASTAdaProcedureCall represents an Ada procedure call statement
"
Class {
	#name : #FASTAdaProcedureCall,
	#superclass : #FASTStatement,
	#instVars : [
		'name',
		'arguments',
		'invocation'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaProcedureCall class >> annotation [
	<MSEClass: #ProcedureCall super: #FASTStatement>
	<package: #FASTAda>
]

{ #category : #'as yet unclassified' }
FASTAdaProcedureCall >> acceptVisitor: aVisitor [
	self flag: 'Without this redefinition, visiting this node always cause MessageNotUnderstood error (look at #acceptVisitor: aVisitor in FASTAbstractVisitor)'
]

{ #category : #accessing }
FASTAdaProcedureCall >> arguments [
	
	^ arguments
]

{ #category : #accessing }
FASTAdaProcedureCall >> arguments: anObject [
	
	arguments := anObject
]

{ #category : #'as yet unclassified' }
FASTAdaProcedureCall >> childrenNodes [
	 ^ nil
]

{ #category : #accessing }
FASTAdaProcedureCall >> invocation [
	
	^ invocation
]

{ #category : #accessing }
FASTAdaProcedureCall >> invocation: anObject [
	
	invocation := anObject
]

{ #category : #accessing }
FASTAdaProcedureCall >> name [
	
	^ name
]

{ #category : #accessing }
FASTAdaProcedureCall >> name: anObject [
	
	name := anObject
]
