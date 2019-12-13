"
ADAContainerEntity is an abstract class for all things in Ada that can define other things within them:
Packages, Procedures/Functions, Tasks, and even Types

"
Class {
	#name : #ADAContainerEntity,
	#superclass : #FAMIXContainerEntity,
	#instVars : [
		'accesses',
		'packages',
		'separates',
		'tasks',
		'localVariables',
		'attributes',
		'adaOutgoingReferences',
		'adaIncomingReferences'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAContainerEntity class >> annotation [
	<MSEClass: #ContainerEntity super: #FAMIXContainerEntity>
	<package: #ADA>
	<abstract>
]

{ #category : #accessing }
ADAContainerEntity >> accesses [
	<MSEProperty: #accesses type: #FAMIXAccess opposite: #adaAccessor>
	<multivalued>
	<derived>
	<MSEComment: 'Accesses to variables made by this behaviour.'>
	^ accesses
]

{ #category : #accessing }
ADAContainerEntity >> accesses: aCollection [ 
	accesses value: aCollection
]

{ #category : #accessing }
ADAContainerEntity >> adaIncomingReferences [
	<MSEProperty: #adaIncomingReferences type: #FAMIXReference opposite: #adaTarget>
	<multivalued>
	<derived>
	<MSEComment: 'References to this entity by other entities.'>
	self flag: #todo.	"Remove the ada prefixe when we will move to moose 6.1"
	^ adaOutgoingReferences
]

{ #category : #accessing }
ADAContainerEntity >> adaIncomingReferences: aReference [
	adaIncomingReferences value: aReference
]

{ #category : #accessing }
ADAContainerEntity >> adaOutgoingReferences [
	<MSEProperty: #adaOutgoingReferences type: #FAMIXReference opposite: #adaSource>
	<multivalued>
	<derived>
	<MSEComment: 'References from this entity to other entities.'>
	self flag: #todo.	"Remove the ada prefixe when we will move to moose 6.1"
	^ adaOutgoingReferences
]

{ #category : #accessing }
ADAContainerEntity >> adaOutgoingReferences: aReference [
	adaOutgoingReferences value: aReference
]

{ #category : #accessing }
ADAContainerEntity >> addAccess: anAccess [
	self accesses add: anAccess
]

{ #category : #accessing }
ADAContainerEntity >> addLocalVariable: aVariable [
	self localVariables add: aVariable
]

{ #category : #accessing }
ADAContainerEntity >> addPackage: aPackage [
	self packages add: aPackage
]

{ #category : #accessing }
ADAContainerEntity >> addSeparate: aSeparateDecl [
	self separates add: aSeparateDecl
]

{ #category : #accessing }
ADAContainerEntity >> addSubprogram: aSubprogram [
	self subprograms add: aSubprogram
]

{ #category : #accessing }
ADAContainerEntity >> addTask: aTask [
	self tasks add: aTask
]

{ #category : #accessing }
ADAContainerEntity >> attributes [
	<MSEProperty: #attributes type: #ADAAttribute opposite: #parentType>
	<multivalued>
	<derived>
	<MSEComment: 'Attributes declared by this container.'>
	^ attributes
]

{ #category : #accessing }
ADAContainerEntity >> attributes: aMethod [
	attributes value: aMethod
]

{ #category : #accessing }
ADAContainerEntity >> belongsTo [
	^ self container
]

{ #category : #resolving }
ADAContainerEntity >> classOfMyScope [
	^ FASTAdaContainerScope
]

{ #category : #'as yet unclassified' }
ADAContainerEntity >> commonBooleanFilters [
	^ {(#numberOfTasks -> 'Number of tasks')} , super commonBooleanFilters
]

{ #category : #accessing }
ADAContainerEntity >> container [
	"We reuse parentPackage in order to not use too much memory."

	^ parentPackage
]

{ #category : #accessing }
ADAContainerEntity >> container: aContainer [
	parentPackage := aContainer
]

{ #category : #display }
ADAContainerEntity >> dataEntitiesForQuickTagging [
	^ self localVariables
]

{ #category : #display }
ADAContainerEntity >> dataReceivedFrom: anOtherEntity [
	| dataAccessed |
	dataAccessed := (self accesses select: [ :acc | acc isReadAccessWithin: anOtherEntity ])
							collectAsSet: [ :acc | acc variable ]  .

	packages do: [ :f | dataAccessed addAll: (f dataReceivedFrom: anOtherEntity) ].
	tasks do: [ :f | dataAccessed addAll: (f dataReceivedFrom: anOtherEntity) ].
	functions do: [ :f | dataAccessed addAll: (f dataReceivedFrom: anOtherEntity) ].
	"should include types too?
	 types do: [ :f | dataAccessed addAll: (f dataReceivedFrom: anOtherEntity) ]."
	anOtherEntity children do: [ :aChild | dataAccessed addAll: (self dataReceivedFrom: aChild) ].
	
	
	^ dataAccessed
]

{ #category : #connections }
ADAContainerEntity >> incomingInvocations [
	^ self receivingInvocations
]

{ #category : #accessing }
ADAContainerEntity >> incomingReferences [
	^ self adaIncomingReferences
]

{ #category : #resolving }
ADAContainerEntity >> initScope [

	^self classOfMyScope newWithOwner: self
]

{ #category : #'initialize-release' }
ADAContainerEntity >> initialize [
	super initialize.
	separates := FMNullMultivalueLink on: self opposite: #container: selector: #separates.
	packages := FMNullMultivalueLink on: self opposite: #container: selector: #packages.
	tasks := FMNullMultivalueLink on: self opposite: #container: selector: #tasks.
	types := FMNullMultivalueLink on: self opposite: #container: selector: #types.
	functions := FMNullMultivalueLink on: self opposite: #container: selector: #functions.
	localVariables := FMNullMultivalueLink on: self opposite: #container: selector: #localVariables.
	accesses := FMNullMultivalueLink on: self opposite: #accessor: selector: #accesses.
	adaOutgoingReferences := FMNullMultivalueLink on: self opposite: #source: selector: #adaOutgoingReferences.
	adaIncomingReferences := FMNullMultivalueLink on: self opposite: #target: selector: #adaIncomingReferences
]

{ #category : #testing }
ADAContainerEntity >> isAdaAlias [
	^self class isAlias
]

{ #category : #testing }
ADAContainerEntity >> isAdaContainer [
	^ true
]

{ #category : #accessing }
ADAContainerEntity >> localVariables [
	<MSEProperty: #localVariables type: #ADAStructuralEntity opposite: #container>	<multivalued>	<derived>
	<MSEComment: 'Variables defined in the container, if any.'>

	^ localVariables
]

{ #category : #accessing }
ADAContainerEntity >> localVariables: aCollection [
	
	localVariables value: aCollection
]

{ #category : #resolving }
ADAContainerEntity >> lookup: aSymbol [
	^ self fastScope lookup: aSymbol
]

{ #category : #resolving }
ADAContainerEntity >> lookup: aSymbol where: aBlock [

	#advancedLookup.
	^ self fastScope lookup: aSymbol where: aBlock
]

{ #category : #display }
ADAContainerEntity >> mooseNameOn: aStream [
	(self container isNotNil 
		and: [ self container isTopLevelContainer not 
		and: [ self container name isNotNil ] ]) 
	ifTrue: 
			[ self container mooseNameOn: aStream.
			aStream << self mooseNameSeparator ].
	super mooseNameOn: aStream
]

{ #category : #display }
ADAContainerEntity >> mooseNameSeparator [
	^ ' -> '
]

{ #category : #accessing }
ADAContainerEntity >> numberOfAccesses [
	<MSEProperty: #numberOfAccesses type: #Number>
	<derived>
	<MSEComment: 'The number of accesses from a method'>
	
	^ self 
		lookUpPropertyNamed: #numberOfAccesses
		computedAs: [ self accesses size ]
]

{ #category : #'as yet unclassified' }
ADAContainerEntity >> numberOfLinesOfCode [
	<MSEProperty: #numberOfLinesOfCode type: #Number>
	<derived>
	<MSEComment: 'The number of lines of code in a method.'>
	self sourceAnchor ifNil: [ ^ SYNUnavailableMetric ].
	^ self lookUpPropertyNamed: #numberOfLinesOfCode computedAs: [ self sourceAnchor lineCount ]
]

{ #category : #accessing }
ADAContainerEntity >> numberOfTasks [
	<MSEProperty: #numberOfTasks type: #Number>
	<derived>
	<MSEComment: 'The number of tasks from the entity'>
	^ self tasks size
]

{ #category : #accessing }
ADAContainerEntity >> outgoingReferences [
	^ self adaOutgoingReferences
]

{ #category : #accessing }
ADAContainerEntity >> packages [
	<MSEProperty: #packages type: #ADAPackage opposite: #container>
	<multivalued>
	<derived>
	<MSEComment: 'Packages defined in the container, if any.'>
	^ packages
]

{ #category : #accessing }
ADAContainerEntity >> packages: aCollection [
	
	packages value: aCollection
]

{ #category : #accessing }
ADAContainerEntity >> parentFamixEntity [
	^ self 
]

{ #category : #resolving }
ADAContainerEntity >> resolve: aSymbol forNode: caller [
	^ self fastScope resolve: aSymbol forNode: caller
]

{ #category : #resolving }
ADAContainerEntity >> resolvingAuthority [
	"everything is based on locality of names, so it's a public access rule: if you see it you can access it"
	^ FASTPublicAccessChecker new
]

{ #category : #accessing }
ADAContainerEntity >> separates [
	<MSEProperty: #separates type: #ADASeparateDeclaration opposite: #container>	<multivalued>	<derived>
	<MSEComment: 'SEPARATE declarations found in the container, if any.'>
	^ separates
]

{ #category : #accessing }
ADAContainerEntity >> separates: aCollection [
	
	separates value: aCollection
]

{ #category : #accessing }
ADAContainerEntity >> sourceLanguage [
	^  ADASourceLanguage singleton
]

{ #category : #accessing }
ADAContainerEntity >> subprograms [
	<MSEProperty: #subprograms type: #ADASubprogram opposite: #container>	<multivalued>	<derived>
	<MSEComment: 'Subprograms (functions/procedures) defined in the container, if any.'>
	
	^ functions
]

{ #category : #accessing }
ADAContainerEntity >> subprograms: aCollection [
	
	self functions: aCollection
]

{ #category : #accessing }
ADAContainerEntity >> tasks [
	<MSEProperty: #tasks type: #ADATask opposite: #container>	<multivalued>	<derived>
	<MSEComment: 'Tasks defined in the container, if any.'>

	^ tasks
]

{ #category : #accessing }
ADAContainerEntity >> tasks: aCollection [
	
	tasks value: aCollection
]

{ #category : #accessing }
ADAContainerEntity >> thalesMessageScope [
	^ nil
]

{ #category : #accessing }
ADAContainerEntity >> types [
	"overriding FAMIXContainerEntity>>types to change the pragma"

	<MSEProperty: #types type: #ADAType opposite: #container> <multivalued> <derived>
	<MSEComment: 'Types contained (declared) in this entity, if any.
#types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.'>
	
	^types
]
