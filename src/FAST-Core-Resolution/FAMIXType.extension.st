Extension { #name : #FAMIXType }

{ #category : #'*FAST-Core-Resolution' }
FAMIXType >> initScope [
	self fastScope: (FAMIXTypeScope newWithOwner: self).
	^ self fastScope
]
