Extension { #name : #FAMIXFile }

{ #category : #'*Ada-Entities' }
FAMIXFile >> initialToDisplay [
	^ self name ifNil: [ super initialToDisplay ] ifNotNil: [ ($. split: self name) last ]
]
