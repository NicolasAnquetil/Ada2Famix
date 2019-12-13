Class {
	#name : #LwsWalkingVisitor,
	#superclass : #LewisAbstractVisitor,
	#category : #LewisHW
}

{ #category : #visitor }
LwsWalkingVisitor >> acceptAll: aCollection [
	aCollection do: [ :e | e accept: self].

]

{ #category : #'LwsStructureSchema visiting' }
LwsWalkingVisitor >> visitSubprogramBody: aSubprogramBody [
	aSubprogramBody declaration ifNotNil: [ :a | a accept: self ].
	self visitBodyWithLocals: aSubprogramBody.
	aSubprogramBody blockBody ifNotNil: [ :a | a accept: self ].

]

{ #category : #'LwsStructureSchema visiting' }
LwsWalkingVisitor >> visitUseClause: aUseClause [
	self visitImportClause: aUseClause
]
