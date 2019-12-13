Extension { #name : #FASTAdaQualifiedIdentifier }

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asContainerIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaContainerKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asGenPackageInstanceIdentifier [
	matchingTypes add: AdaGenPackageInstanceKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asGenSubpgmInstanceIdentifier [
	"adds AdaGenericSubpgmInstKind to the list of matching types"
	matchingTypes add: AdaGenSubpgmInstanceKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asGenericPackageIdentifier [
	matchingTypes add: AdaGenericPackageKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asGenericSubpgmIdentifier [
	"adds AdaGenericSubpgmKind to the list of matching types"
	matchingTypes add: AdaGenericSubpgmKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asPackageIdentifier [
	"adds FASTAdaPackageIdentifier in the list of matching types"
	matchingTypes add: AdaPackageKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asSeparateIdentifier [
	matchingTypes add: AdaSeparateKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asStructuralIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaStructuralKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asSubprogramIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaSubprogramKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asTaskIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaTaskKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asTypeIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	matchingTypes add: AdaTypeKind new
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> asValueIdentifier [
	"adds FASTAdaContainerIdentifier in the list of matching types"
	self asStructuralIdentifier.
	self asSubprogramIdentifier
]

{ #category : #'*LewisMoose' }
FASTAdaQualifiedIdentifier >> createStubFor: theCreator [
	"gets the stubCreationBlock from the first matchingType
	 This blocks takes two arguments: the creator of the stub and the name of the stub"
	| stubCreationBlock |
	stubCreationBlock := (matchingTypes isEmpty)
							ifTrue:  [ AdaIdentifierKind defaultStubCreationBlock ]
							ifFalse: [ matchingTypes first stubCreationBlock ].
	^ stubCreationBlock value: theCreator value: self mainIdentifier
]
