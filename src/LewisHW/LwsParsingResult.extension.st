Extension { #name : #LwsParsingResult }

{ #category : #'*LewisHW-pretty-printing' }
LwsParsingResult >> asPrettyPrinted [
	| pureSource   |
	pureSource := LwsPrinter format: self.
	^ pureSource
]
