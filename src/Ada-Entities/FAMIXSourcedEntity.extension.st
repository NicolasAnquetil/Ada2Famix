Extension { #name : #FAMIXSourcedEntity }

{ #category : #'*Ada-Entities' }
FAMIXSourcedEntity class >> manuallyAddedParentTypes [
	"There is a problem in Moose that stop us from adding the <container> pragma everywhere it is needed. (Not possible on multi-multi relations) This method allow to manually add some types as parents"

	^ {FAMIXFile}
]

{ #category : #'*Ada-Entities' }
FAMIXSourcedEntity >> parentFamixBehaviouralEntity [
	"introduced to solve q bug with AdaType calling an Ada function (see LwsBugsTest>>testTypeCallsFunction"
	^ self belongsTo
]

{ #category : #'*Ada-Entities' }
FAMIXSourcedEntity >> shouldBeAddedIntoFiles [
	^ self isStub not
		and: [ (self belongsTo isNil or: [ self belongsTo class = ADATopLevelContainer ]) and: [ self hasSourceAnchor ] ]
]
