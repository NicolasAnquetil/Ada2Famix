Extension { #name : #FAMIXScopingEntity }

{ #category : #'*FAST-Core-Resolution' }
FAMIXScopingEntity >> initScope [
	self fastScope: (FAMIXScopingEntityScope newWithOwner: self).
	^ self fastScope
]
