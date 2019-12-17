Extension { #name : #FAMIXContainerEntity }

{ #category : #'*FAST-Core-Resolution' }
FAMIXContainerEntity >> fastScope [
	^ self privateState cacheAt: #fastScope ifAbsentPut: [self initScope]
]

{ #category : #'*FAST-Core-Resolution' }
FAMIXContainerEntity >> fastScope: aScope [
	self privateState cacheAt: #fastScope put: aScope
]

{ #category : #'*FAST-Core-Resolution' }
FAMIXContainerEntity >> hasScope [
	^ true
]
