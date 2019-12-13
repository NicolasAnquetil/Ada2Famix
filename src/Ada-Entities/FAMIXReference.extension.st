Extension { #name : #FAMIXReference }

{ #category : #'*Ada-Entities' }
FAMIXReference >> adaSource [
	<MSEProperty: #adaSource type: #ADAContainerEntity opposite: #adaOutgoingReferences>
	<MSEComment: 'Ada source entity making the reference. from-side of the association'>
	<derived>
	<source>
	^ source
]

{ #category : #'*Ada-Entities' }
FAMIXReference >> adaSource: aContainerEntity [
	source := FMMultivalueLink
		on: self
		update: #adaOutgoingReferences
		from: self adaSource
		to: aContainerEntity
]

{ #category : #'*Ada-Entities' }
FAMIXReference class >> adaSource: source target: target [
	^ self new
		adaSource: source;
		adaTarget: target;
		yourself
]

{ #category : #'*Ada-Entities' }
FAMIXReference >> adaTarget [
	<MSEProperty: #adaTarget type: #ADAContainerEntity opposite: #adaIncomingReferences>
	<MSEComment: 'Ada target entity referenced. to-side of the association'>
	<derived>
	<target>
	^ target
]

{ #category : #'*Ada-Entities' }
FAMIXReference >> adaTarget: aContainerEntity [
	target := FMMultivalueLink
		on: self
		update: #adaIncomingReferences
		from: self adaTarget
		to: aContainerEntity
]
