Extension { #name : #FAMIXSourcedEntity }

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> accept: aVisitor andAssociateWithPackageInstance: packageInstance [
	"Double dispatch
	The association depends on the receiver"
	self subclassResponsibility

]

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> accept: aVisitor andCreateAssociationWith: aQualifiedIdentifier [
	"Double dispatch
	The created association depends on the receiver"
	self subclassResponsibility

]

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> addSourceAnchorForPath: aPath posFromToken: aToken [
	"
	May be should not create the sourceAnchor ?
	Above comment from NicolasAnquetil.58
	aToken ifNil: [ ^self ].
	"
	self 
		addSourceAnchorForPath: aPath 
		startPosition: (aToken ifNotNil: [ aToken startPosition ]) 
		endPosition: (aToken ifNotNil: [ aToken endPosition ])
]

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> addSourceAnchorForPath: aPath startPosition: startPos [

	self 
		addSourceAnchorForPath: aPath 
		startPosition: startPos 
		endPosition: nil
]

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> addSourceAnchorForPath: aPath startPosition: startPos endPosition: endPos [

	self ensureMultiSourceAnchor 
			addFileAnchorPath: aPath 
			startPosition: startPos 
			endPosition: endPos
]

{ #category : #'*LewisMoose' }
FAMIXSourcedEntity >> isAssociation [
	^ false
]
