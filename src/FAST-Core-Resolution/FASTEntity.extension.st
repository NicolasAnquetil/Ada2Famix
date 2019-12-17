Extension { #name : #FASTEntity }

{ #category : #'*FAST-Core-Resolution' }
FASTEntity >> lookup: aSymbol where: aBlock [
	"default behaviour is to delegate to scope if receiver has one
	 in all cases, also delegates to parentNode"

	#advancedLookup.
	(self fastScope 
		ifNotNil: [ :scope | scope lookup: aSymbol where: aBlock ])
			ifNotNil: [ :candidate | ^candidate ].				
	^self parentNode lookup: aSymbol where: aBlock
]
