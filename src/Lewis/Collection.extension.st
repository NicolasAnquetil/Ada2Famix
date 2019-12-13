Extension { #name : #Collection }

{ #category : #'*Lewis-core' }
Collection >> unsafeAdd: anObject [
	(self includes: anObject) ifFalse: [ self add: anObject  ]
]
