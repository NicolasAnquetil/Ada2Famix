Extension { #name : #FASTStatementBlock }

{ #category : #'*FAST-Core-Resolution' }
FASTStatementBlock >> resolveAllSymbols [
	self statements do: [:s | s resolveAllSymbols ]

]
