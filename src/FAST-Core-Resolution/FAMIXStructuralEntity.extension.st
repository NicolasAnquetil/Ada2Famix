Extension { #name : #FAMIXStructuralEntity }

{ #category : #'*FAST-Core-Resolution' }
FAMIXStructuralEntity >> fastOwnerScope [
	^ self privateState cacheAt: #fastOwnerScope ifAbsent: nil
]

{ #category : #'*FAST-Core-Resolution' }
FAMIXStructuralEntity >> fastOwnerScope: anOwnerScope [
	^ self privateState cacheAt: #fastOwnerScope put: anOwnerScope
]
