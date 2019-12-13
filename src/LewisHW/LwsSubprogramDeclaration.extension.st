Extension { #name : #LwsSubprogramDeclaration }

{ #category : #'*LewisHW' }
LwsSubprogramDeclaration >> signature [

	^ String
		streamContents: [ :s | 
			s nextPutAll: self asString.
			s nextPutAll: ': ('.
			self parameters do: [ :each | s nextPutAll: each domainName name ] separatedBy: [ s nextPutAll: ', ' ].
			s nextPutAll: ')']
]
