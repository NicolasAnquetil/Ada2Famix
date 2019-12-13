"
ADABehaviouralEntity is an abstract class for all entities that have behaviour in Ada.
Basically those that can accept a body (BEGIN statements; END;)
e.g. Packages, Tasks, Procedures/Functions

"
Class {
	#name : #ADABehaviouralEntity,
	#superclass : #ADAContainerEntity,
	#instVars : [
		'fastSubprogramEntity',
		'outgoingInvocations'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADABehaviouralEntity class >> annotation [
	<MSEClass: #BehaviouralEntity super: #ADAContainerEntity>
	<package: #ADA>
	<abstract>
]

{ #category : #accessing }
ADABehaviouralEntity >> fastBehaviouralEntity [
	<MSEProperty: #fastBehaviouralEntity type: #FASTAdaNamedBehaviouralEntity opposite: #adaNamedEntity>
	<MSEComment: 'Corresponding FASTMethodDefinition node'>
	^ fastSubprogramEntity
]

{ #category : #accessing }
ADABehaviouralEntity >> fastBehaviouralEntity: aFASTAdaSubprogram [
	fastSubprogramEntity := aFASTAdaSubprogram.
	aFASTAdaSubprogram adaNamedEntity = self
		ifFalse: [ aFASTAdaSubprogram adaNamedEntity: self ]
]

{ #category : #'initialize-release' }
ADABehaviouralEntity >> initialize [
	super initialize.
	outgoingInvocations := FMNullMultivalueLink on: self opposite: #sender: selector: #outgoingInvocations
]

{ #category : #accessing }
ADABehaviouralEntity >> outgoingInvocations [
	<MSEProperty: #outgoingInvocations type: #FAMIXInvocation opposite: #adaSender>
	<multivalued>
	<derived>
	<MSEComment: 'Outgoing invocations made from this container.'>
	^ outgoingInvocations
]

{ #category : #accessing }
ADABehaviouralEntity >> outgoingInvocations: outgoing [
	outgoingInvocations value: outgoing
]

{ #category : #accessing }
ADABehaviouralEntity >> parentFamixBehaviouralEntity [
	"introduced to solve q bug with AdaType calling an Ada function (see LwsBugsTest>>testTypeCallsFunction"
	^ self
]
