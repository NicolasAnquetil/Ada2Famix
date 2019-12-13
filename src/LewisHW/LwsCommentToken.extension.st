Extension { #name : #LwsCommentToken }

{ #category : #'*LewisHW-classifying' }
LwsCommentToken >> haveSomethingBeforeOnTheSameLine [
	^ haveSomethingBeforeOnTheSameLine ifNil: [ haveSomethingBeforeOnTheSameLine := false ]
]

{ #category : #'*LewisHW-classifying' }
LwsCommentToken >> haveSomethingBeforeOnTheSameLine: aBoolean [
	haveSomethingBeforeOnTheSameLine := aBoolean
]

{ #category : #'*LewisHW-classifying' }
LwsCommentToken >> isComment [
	^ true
]
