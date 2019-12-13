Extension { #name : #FASTEntity }

{ #category : #'*Ada-Entities' }
FASTEntity class >> canBeScope [
	^ false
]

{ #category : #'*Ada-Entities' }
FASTEntity >> isAdaContainer [
	^ false
]

{ #category : #'*Ada-Entities' }
FASTEntity >> topLevelContainer [
	^ (self container = self or: [ self container isNil ])
		ifTrue: [ self ]
		ifFalse: [ self container topLevelContainer ]
]
