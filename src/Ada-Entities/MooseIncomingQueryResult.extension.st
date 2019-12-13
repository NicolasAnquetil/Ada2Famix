Extension { #name : #MooseIncomingQueryResult }

{ #category : #'*Ada-Entities' }
MooseIncomingQueryResult >> primCollectAtScope: aScopeSymbol [
	"
	^ self opposites collectAtScope: aScopeSymbol
	"
	^ self storage flatCollect: [ :dep | ((self opposite: dep) perform: aScopeSymbol) asOrderedCollection ]
]
