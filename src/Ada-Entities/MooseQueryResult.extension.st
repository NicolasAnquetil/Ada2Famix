Extension { #name : #MooseQueryResult }

{ #category : #'*Ada-Entities' }
MooseQueryResult >> atPackageScope [
	self flag: #pharo4.	"This is needed in ADA while we do not use the new mechanism in our tools."
	^ SystemVersion current major = 4
		ifTrue: [ self collectAtScope: #packageScope ]
		ifFalse: [ self withScope: ADAPackage ]
]

{ #category : #'*Ada-Entities' }
MooseQueryResult >> atTypeScope [
	self flag: #pharo4.	"This is needed in ADA while we do not use the new mechanism in our tools."
	^ SystemVersion current major = 4
		ifTrue: [ self collectAtScope: #typeScope ]
		ifFalse: [ self withScope: ADAType ]
]
