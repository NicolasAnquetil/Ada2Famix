Extension { #name : #FAMIXMultipleFileAnchor }

{ #category : #'*Ada-Entities' }
FAMIXMultipleFileAnchor >> hasDuplicateSourceFiles [
	| anchorsGroupedByFiles |
	"check if the entity has same files associated to it. This is a problem in Ada program we received."
	anchorsGroupedByFiles := self allFiles groupedBy: [ :anchor | (anchor fileName substrings: '/') last ].
	^ anchorsGroupedByFiles keys allSatisfy: [ :key | (anchorsGroupedByFiles at: key) size > 1 ]
]
