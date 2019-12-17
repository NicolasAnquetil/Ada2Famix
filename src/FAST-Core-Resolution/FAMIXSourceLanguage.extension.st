Extension { #name : #FAMIXSourceLanguage }

{ #category : #'*FAST-Core-Resolution' }
FAMIXSourceLanguage >> casePolicy: aString [ 
	"by default assumes case sensitive so a name remains as it is
	 for non case sensitive languages, would convert name to a given case (upper or lower)"
	^ aString
]
