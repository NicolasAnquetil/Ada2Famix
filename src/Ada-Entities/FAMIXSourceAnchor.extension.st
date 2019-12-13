Extension { #name : #FAMIXSourceAnchor }

{ #category : #'*Ada-Entities' }
FAMIXSourceAnchor >> hasDuplicateSourceFiles [
	self flag: #todo. "Cyril: I am not sure about this... I got a MNU with Gnat parser on this."
	^ false 
]
