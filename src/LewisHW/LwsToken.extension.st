Extension { #name : #LwsToken }

{ #category : #'*LewisHW-converting' }
LwsToken >> asText [ 
	^ self parsedString asText
]

{ #category : #'*LewisHW' }
LwsToken >> endPosition [
	"compatibility with LwsEntity"
	^ self stopPosition
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isBlank [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isComment [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isEof [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isEol [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isIdentifier [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isOperator [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isPragma [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isSemicolon [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isSpace [
	^ false
]

{ #category : #'*LewisHW-classifying' }
LwsToken >> isTabulation [
	^ false
]

{ #category : #'*LewisHW-copying' }
LwsToken >> postCopy [
	super postCopy.
	id := nil.
	start := nil.
	^self
]

{ #category : #'*LewisHW' }
LwsToken >> printOn: aStream [
	aStream
		nextPut: ${;
		nextPut: $[.
	self value printOn: aStream.
	aStream
		nextPut: $];
		space;
		nextPut: $(.
	self startPosition printOn: aStream.
	aStream
		nextPut: $,;
		space.
	self stopPosition printOn: aStream.
	aStream nextPutAll: ')}'
]

{ #category : #'*LewisHW' }
LwsToken >> startPosition [
	^start
]

{ #category : #'*LewisHW' }
LwsToken >> stopPosition [
	^start ifNotNil: [:s | s + value size - 1]
]

{ #category : #'*LewisHW' }
LwsToken class >> value: aString start: anInteger id: anObject [ 
	^(self new)
		value: aString
			start: anInteger
			id: anObject;
		yourself
]

{ #category : #'*LewisHW' }
LwsToken >> value: anObject start: startPositionInteger id: anInteger [ 
	value := anObject.
	start := startPositionInteger.
	id := anInteger
]
