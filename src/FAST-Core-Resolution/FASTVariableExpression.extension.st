Extension { #name : #FASTVariableExpression }

{ #category : #'*FAST-Core-Resolution' }
FASTVariableExpression >> matches: anEntity [
	"matches if entity is a variable
	
	we might not have enough information here to decide if it matches
	for example we accept variable or type, but a type on the LHS of an assignement would not do"
	
	^ (anEntity isKindOf: FAMIXStructuralEntity) or: [ anEntity isKindOf: FAMIXType ]
]

{ #category : #'*FAST-Core-Resolution' }
FASTVariableExpression >> nameByPolicy [
	^ self sourceLanguage casePolicy: self name
]

{ #category : #'*FAST-Core-Resolution' }
FASTVariableExpression >> resolveAllSymbols [
	self parentNode resolve: self
]
