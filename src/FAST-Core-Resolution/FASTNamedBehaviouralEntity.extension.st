Extension { #name : #FASTNamedBehaviouralEntity }

{ #category : #'*FAST-Core-Resolution' }
FASTNamedBehaviouralEntity >> getFamixVariablesPool [
	"gets all local variables declared in the pentNode (i.e. the FAMIXBehaviouralEntity)"
	^ self parentNode localVariablesPool
]

{ #category : #'*FAST-Core-Resolution' }
FASTNamedBehaviouralEntity >> matches: anEntity [
	"matches if entity is a function or method: FAMIXBehaviouralEntity"
	
	^ anEntity isKindOf: FAMIXBehaviouralEntity
]

{ #category : #'*FAST-Core-Resolution' }
FASTNamedBehaviouralEntity >> nameByPolicy [
	^ self sourceLanguage casePolicy: self name
]
