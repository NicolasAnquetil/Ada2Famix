"
Scope for AdaContainers

USE clause in Ada is manage by adding the scope of the used package to the parent scopes of the package that uses it.

(another solution would be to introduce a USEClause entity as parent of the package that uses. This USEClause entity would have a scope which would naturally be the parent of the using package's scope)
"
Class {
	#name : #FASTAdaContainerScope,
	#superclass : #FASTAdaScope,
	#category : #'Famix-Ada-Generator-predefinedFAST'
}

{ #category : #'as yet unclassified' }
FASTAdaContainerScope class >> annotation [
	<MSEClass: #ContainerScope super: #FAMIXScopingEntityScope>
	<package: #FASTAda>
]

{ #category : #accessing }
FASTAdaContainerScope >> add: anEntity [
	"in Ada, a scope may have several entities with the same name (but of different kind)"
	| bound symbols |
	self shouldNotImplement.
	self flag: 'symbols used to be an instancevar (cache of local symbols)'.
	bound := symbols at: anEntity nameByPolicy ifAbsent: [ OrderedCollection new ].
	bound add: anEntity.
	symbols at: anEntity nameByPolicy put: bound.
	^ bound
]

{ #category : #accessing }
FASTAdaContainerScope >> addParentScopeIfNotPresent: aScope [
	"intended for scopes of used clauses (that do not have corresponding Famix entity)
	 scopes with Famix owner will be treated by the default #parents behavior which looks
	 for scope of parent Famix entities
	
	 Could be better to create a specific USEClauseScope instead of relying on not having an owner"
	aScope owner ifNil: [parents addIfNotPresent: aScope]
]

{ #category : #'initialize-release' }
FASTAdaContainerScope >> initialize [
	super initialize.
	parents := OrderedCollection new
]

{ #category : #resolving }
FASTAdaContainerScope >> lookupSelectors [

	^ #(#localVariables #packages #subprograms)
	
]

{ #category : #accessing }
FASTAdaContainerScope >> parents [
	^ self owner container
		ifNil: [ parents ]
		ifNotNil: [:p | (OrderedCollection with: p fastScope) , parents ]
]
