Extension { #name : #ADASubprogram }

{ #category : #'*SYNAda-Entities-Lewis' }
ADASubprogram >> accept: aVisitor andCreateAssociationWith: aQualifiedIdentifier [
	"Double dispatch
	The created association is an Invokation"
	^aVisitor createSubprogramInvocationFor: aQualifiedIdentifier resolvedAs: self
]

{ #category : #'*SYNAda-Entities-THALES' }
ADASubprogram >> sendsThalesMessage [
	self isFunction ifTrue: [ ^ false ].	"assuming only procedures may lead to a call to a SEND procedure"
	(self name matches: '*SEND') ifTrue: [ ^ true ].
	
	^ self privateState attributeAt: #sendsThalesMessage ifAbsentPut: [
		self outgoingInvocations anySatisfy: [ :i | i candidates anySatisfy: [:c | c sendsThalesMessage] ] ]
]
