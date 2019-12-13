Extension { #name : #FAMIXAccess }

{ #category : #'*Ada-Entities' }
FAMIXAccess >> adaAccessor [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaAccessor to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #accessor property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaAccessor type: #ADAContainerEntity opposite: #accesses>
	<MSEComment: 'Behavioural entity making the access to the variable. from-side of the association'>
	<derived>
	<source>
	^ self accessor
]

{ #category : #'*Ada-Entities' }
FAMIXAccess >> adaAccessor: aBehaviouralEntity [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaAccessor to be good with the pragmas. 
	"

	^ self accessor: aBehaviouralEntity
]

{ #category : #'*Ada-Entities' }
FAMIXAccess >> getArgVariable [
	^ self variable
]

{ #category : #'*Ada-Entities' }
FAMIXAccess >> invocation [
	<MSEProperty: #invocation type: #FAMIXInvocation opposite: #arguments>
	<MSEComment: 'A possible invocation where this access occurs (access of a parameter)'>
	^ self privateState attributeAt: #invocation ifAbsent: [ nil ]
]

{ #category : #'*Ada-Entities' }
FAMIXAccess >> invocation: anObject [
	self privateState
		attributeAt: #invocation
		put:
			(FMMultivalueLink
				on: self
				update: #arguments
				from: self invocation
				to: anObject)
]

{ #category : #'*Ada-Entities' }
FAMIXAccess >> isReadAccessWithin: aContainerEntity [
	| ret accessed |
	ret := nil.
	self isWrite
		ifTrue: [ ret := false ]  "by default assumes accesses are read. This does not follow the convention in FAMIXAccess>>isRead"
		ifFalse: [ accessed := self variable ].
	[ ret isNil ] whileTrue: [ 
		"as long as we don't know, keep looking"
		(accessed isNil)
			ifTrue: [ ret := false ]
			ifFalse: [
				(accessed = aContainerEntity)
					ifTrue: [ ret := true ]
					ifFalse: [ accessed := accessed container ]
			]
	].
	^ ret
]
