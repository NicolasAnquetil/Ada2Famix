"
An ADAModel is MooseModel with AdaEntities in it

"
Class {
	#name : #ADAModel,
	#superclass : #SYNModel,
	#instVars : [
		'singletonAnonymousArray'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #meta }
ADAModel class >> annotation [
	<MSEClass: #Model super: #SYNModel>
	<package: #ADA>

]

{ #category : #accessing }
ADAModel >> allAdaClasses [
	<navigation: 'All Ada classes'> 
	^self allWithType: ADATypeClass
]

{ #category : #accessing }
ADAModel >> allAdaPackages [
	<navigation: 'All Ada packages'> 
	^self allWithSubTypesOf: ADAPackage
]

{ #category : #accessing }
ADAModel >> allAdaParameters [
	<navigation: 'All Ada Parameters'> 
	^self allWithType: ADAParameter
]

{ #category : #accessing }
ADAModel >> allAdaSubprograms [
	<navigation: 'All Ada subprograms'> 
	^self allWithSubTypesOf: ADASubprogram
]

{ #category : #accessing }
ADAModel >> allAdaTasks [
	<navigation: 'All Ada tasks'> 
	^self allWithType: ADATask
]

{ #category : #accessing }
ADAModel >> allAdaTypes [
	<navigation: 'All Ada types'> 
	^self allWithSubTypesOf: ADAType
]

{ #category : #accessing }
ADAModel >> allAdaVariables [
	<navigation: 'All Ada variable'> 
	^self allWithSubTypesOf: ADAStructuralEntity
]

{ #category : #'non-stub-groups' }
ADAModel >> allModelAdaPackages [
	"all non-stub ada packages"
	<navigation: 'All Model Ada packages'> 
	^self allAdaPackages reject: #isStub
]

{ #category : #'non-stub-groups' }
ADAModel >> allModelAdaSubprograms [
	<navigation: 'All Ada subprograms'> 
	^self allAdaSubprograms reject: #isStub
]

{ #category : #'non-stub-groups' }
ADAModel >> allModelAdaTasks [
	<navigation: 'All non stub Ada tasks'> 
	^self allAdaTasks reject: #isStub
]

{ #category : #'non-stub-groups' }
ADAModel >> allModelAdaTypes [
	<navigation: 'All non-stub Ada types'>
	| types |
	(types := self allAdaTypes)
		detect: [ :each | each name = '**AnonymousArrayType**' ]
		ifFound: [ :entity | types remove: entity ].
	^ types
]

{ #category : #groups }
ADAModel >> computeAllContainers [
	^ (self allWithSubTypesOf: ADAContainerEntity) reject: #isStub
]

{ #category : #'non-stub-groups' }
ADAModel >> computeAllExecutables [
	^ self allModelAdaPackages , self allModelAdaSubprograms , self allModelAdaTasks
]

{ #category : #groups }
ADAModel >> computeAllMainEntities [
	^ self allExecutables
]

{ #category : #metrics }
ADAModel >> computeNumberOfLinesOfCode [
	"we consider all code to be contained in the packages"

	^ self allModelAdaPackages sum: #numberOfLinesOfCode
]

{ #category : #indicators }
ADAModel >> defaultIndicators [
	| indicators |
	indicators := OrderedCollection new.
	self
		addIndicatorQueryCode:
			'| highLevelContainers min max |
	highLevelContainers := inputCollection sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ].
	highLevelContainers asCollection
		ifNotEmpty: [ 
			min := highLevelContainers last numberOfLinesOfCode.
			max := highLevelContainers first numberOfLinesOfCode.
			highLevelContainers select: [ :c | c numberOfLinesOfCode >= (0.75 * (max - min) + min) ] ]
		ifEmpty: [ highLevelContainers ]'
		entityTypes: ADAPackage asCollection
		englishQueryName: 'Big packages'
		frenchQueryName: 'Gros packages'
		englishDescription:
			'Collects the packages that have a big number of lines of code compared to the other model packages'
		frenchDescription:
			'Collecte les packages qui ont un grand nombre de lignes de code par rapport aux autres packages du modèle'
		to: indicators.
	self
		addIndicatorQueryCode:
			'| highLevelContainers min max |
	highLevelContainers := inputCollection sorted: [ :a :b | a allClients size > b allClients size ].
	highLevelContainers asCollection
		ifNotEmpty: [ 
			min := highLevelContainers last allClients size.
			max := highLevelContainers first allClients size.
			highLevelContainers select: [ :p | p allClients size >= (0.75 * (max - min) + min) ] ]
		ifEmpty: [ highLevelContainers ]'
		entityTypes: ADAPackage asCollection
		englishQueryName: 'Core packages'
		frenchQueryName: 'Packages noyaux'
		englishDescription: 'Collects the packages that have a big number of clients compared to the other model packages'
		frenchDescription:
			'Collecte les packages qui ont un grand nombre de clients par rapport aux autres packages du modèle'
		to: indicators.
	self
		addIndicatorQueryCode:
			'| sourcedEntities min max |
	sourcedEntities := inputCollection sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ].
	sourcedEntities asCollection
		ifNotEmpty: [ 
			min := sourcedEntities last numberOfLinesOfCode.
			max := sourcedEntities first numberOfLinesOfCode.
			sourcedEntities select: [ :c | c numberOfLinesOfCode >= (0.75 * (max - min) + min) ] ]
		ifEmpty: [ sourcedEntities ]'
		entityTypes: ADASubprogram asCollection
		englishQueryName: 'Big subprograms'
		frenchQueryName: 'Gros sous-programmes'
		englishDescription:
			'Collects the subprograms that have a big number of lines of code compared to the other model subprograms'
		frenchDescription:
			'Collecte les sous-programmes qui ont un grand nombre de lignes de code par rapport aux autres sous-programmes du modèle'
		to: indicators.
	^ indicators
]

{ #category : #duplication }
ADAModel >> dupDetectionParams [
	^ DPParameters new
		frequency: 2;
		minNumberOfLines: 10;
		minNumberOfCharacters: 80;
		cleaner: DPAdaCleaner new
]

{ #category : #duplication }
ADAModel >> entitiesForDupDetection [
	"for ada, there are some entities that are defined in the same files 4 times but this is not allowed by the language. But this may give wrong results. To remove these entities from duplication algo, we check if the file is defined in the similar files and remove them from the analysis. Moreover, there are entities whose children appear as duplicated to themselves. So, all the subprograms with children are not considered for the duplication."

	^ ((self allModelAdaSubprograms select: [ :each | each class = ADASubprogram ])
		select: [ :each | each functions isEmpty ])
		difference: (self allModelAdaSubprograms select: [ :prog | prog hasSourceAnchor and:  [ prog sourceAnchor hasDuplicateSourceFiles] ])
]

{ #category : #actions }
ADAModel >> importFromMSEStream: aStream [
	"clean the model before importing new entities"
	self removeAll: self entities copy.
	super importFromMSEStream: aStream
]

{ #category : #'initialize-release' }
ADAModel >> initialize [
	super initialize.
	self sourceLanguage: ADASourceLanguage new.
	self add: ADATopLevelContainer new.

	"Since stub are not created anymore, there is no need for this either
	#( INTEGER POSITIVE FLOAT BOOLEAN STRING ) do: [ :typ |
		self initializeDefaultType: typ
	]"
]

{ #category : #rules }
ADAModel >> initializeDefaultRules [
	self flag: #TODO. "reactivate this after the duplication bug is corrected."
	self
		query: 'Long Programs'
		meaning: 'Code should not be longer than 50 lines of code'
		as: [ :aModel | 
			self
				elementsFrom: aModel allModelAdaSubprograms
				satisfying: [ :each | each hasSourceAnchor and: [ each numberOfLinesOfCode > 50 ] ]
				progressTitle: 'Analyzing Lines of Code' ]
		remediationTime: 15.
	self
		query: 'Complexity of Programs'
		meaning: 'Functions should not be complex: cyclomatic complexity of more than 50'
		as: [ :aModel | aModel allModelAdaSubprograms select: [ :each | each cyclomaticComplexity > 50 ] ]
		remediationTime: 40.
	self
		query: 'Duplication'
		meaning: 'Programs should not have duplicate code'
		as: [ :aModel | aModel allModelAdaSubprograms select: [ :each | each cloneLocations size > 0 ] ]
		remediationTime: 10.
	self
		query: 'Programs Parameters'
		meaning: 'Programs should not have more than 5 parameters'
		as: [ :aModel | aModel allModelAdaSubprograms select: [ :each | each numberOfParameters > 5 ] ]
		remediationTime: 10.
	self
		query: 'Incoming Links'
		meaning: 'More than 50 incoming calls mean that function is too complex'
		as: [ :aModel | aModel allModelAdaSubprograms select: [ :each | each incomingInvocations size > 50 ] ]
		remediationTime: 10
]

{ #category : #'initialize-release' }
ADAModel >> initializeDefaultType: aString [

	(self entityNamed: aString)
		ifNil: [
			ADAType new
				name: aString ;
				container: ((self allWithType: ADATopLevelContainer) first) ;
				stub: true ;
				mooseModel: self
		].

]

{ #category : #'post-generation' }
ADAModel >> postGeneration [
	"Add files and folders to the model"

	SYNAddFileSystemEntitiesTask runWithProgressOn: self
]

{ #category : #accessing }
ADAModel >> projectRoots [
	^ ((self allWithSubTypesOf: FAMIXAbstractFile) select: #isRoot)
		sorted: [ :a :b | 
			a isFolder
				ifTrue: [ 
					b isFolder
						ifTrue: [ a name < b name ]
						ifFalse: [ true ] ]
				ifFalse: [ 
					b isFolder
						ifTrue: [ false ]
						ifFalse: [ a name < b name ] ] ]
]

{ #category : #accessing }
ADAModel >> rootPackages [
	^ (self allWithType: ADAPackage) select: #isRoot
]

{ #category : #accessing }
ADAModel >> singletonAnonymousArray [
	^ singletonAnonymousArray
		ifNil: [ 
			singletonAnonymousArray := ADAType new
				name: '**AnonymousArrayType**';
				mooseModel: self;
				yourself ]
]
