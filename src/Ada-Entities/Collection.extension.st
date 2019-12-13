Extension { #name : #Collection }

{ #category : #'*Ada-Entities-FAMIX' }
Collection >> getArgVariable [
	^ self collect: [ :e | e getArgVariable ]
]
