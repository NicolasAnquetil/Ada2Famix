Extension { #name : #Association }

{ #category : #'*Ada-Entities-FAMIX' }
Association >> getArgVariable [
	^ self value getArgVariable
]

{ #category : #'*Ada-Entities-FAMIX' }
Association >> isAccess [
	^ false
]
