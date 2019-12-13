Extension { #name : #FAMIXMultipleFileAnchor }

{ #category : #'*LewisMoose' }
FAMIXMultipleFileAnchor >> addFileAnchorPath: aPath startPosition: startPos endPosition: endPos [

	| fileList |
	fileList := (self allFiles) select: [ :each | each fileName = aPath ].
	fileList
		detect: [ :fAnch |  fAnch startPos = startPos ]
		ifOne: [ :found |  found endPos: endPos ]
		ifNone: [
			fileList 
				detect: [ :fAnch |  fAnch startPos isNil ]
				ifOne: [ :found |  found startPos: startPos.  found endPos: endPos ]
				ifNone: [ self createAnchorWithPath: aPath startPosition: startPos endPosition: endPos ]
		]
]

{ #category : #'*LewisMoose' }
FAMIXMultipleFileAnchor >> createAnchorWithPath: aPath startPosition: startPos endPosition: endPos [
	self allFiles
		add:
			(FAMIXIndexedFileAnchor new
				fileName: aPath;
				startPos: startPos;
				endPos: endPos;
				mooseModel: self mooseModel;
				yourself)
]
