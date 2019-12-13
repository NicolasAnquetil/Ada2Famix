"
Represents a subprogram (procedure of function) in Ada
"
Class {
	#name : #FASTAdaNamedBehaviouralEntity,
	#superclass : #FASTNamedBehaviouralEntity,
	#instVars : [
		'adaNamedEntity'
	],
	#category : #'Ada-Entities-FAST'
}

{ #category : #'as yet unclassified' }
FASTAdaNamedBehaviouralEntity class >> annotation [
	<MSEClass: #NamedBehaviouralEntity super: #FASTNamedBehaviouralEntity>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> accesses [
	^ self parentNode ifNotNil: #accesses
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> accesses: anObject [
	self parentNode ifNotNil: [ :pn | pn accesses: anObject ]
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> adaNamedEntity [
	<MSEProperty: #adaNamedEntity type: #ADABehaviouralEntity opposite: #fastBehaviouralEntity>
	<MSEComment: 'ADABehaviouralEntity corresponding to this node'>
	^ adaNamedEntity
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> adaNamedEntity: anAdaBehaviouralEntity [
	adaNamedEntity := anAdaBehaviouralEntity.
	anAdaBehaviouralEntity fastBehaviouralEntity = self
		ifFalse: [ anAdaBehaviouralEntity fastBehaviouralEntity: self ]
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> functions [
	^ self parentNode ifNotNil: #functions
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> functions: anObject [
	self parentNode ifNotNil: [ :pn | pn functions: anObject ]
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> outgoingInvocations [
	^ self parentNode ifNotNil: #outgoingInvocations
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> outgoingInvocations: anObject [
	self parentNode ifNotNil: [ :pn | pn outgoingInvocations: anObject ]
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> packages [
	^ self parentNode ifNotNil: #packages
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> packages: anObject [
	self parentNode ifNotNil: [ :pn | pn packages: anObject ]
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> parentNode [
	^ self adaNamedEntity
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> parentNode: aFamixBehaviouralEntity [
	self adaNamedEntity: aFamixBehaviouralEntity
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> sourceAnchor [
	^ self parentNode sourceAnchor
]

{ #category : #accessing }
FASTAdaNamedBehaviouralEntity >> sourceAnchor: anObject [

	self shouldNotImplement
]
