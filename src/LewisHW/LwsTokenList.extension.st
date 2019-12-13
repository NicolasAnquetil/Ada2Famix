Extension { #name : #LwsTokenList }

{ #category : #'*LewisHW-private' }
LwsTokenList >> addToken: aToken [
	self tokens add: aToken
]

{ #category : #'*LewisHW-private' }
LwsTokenList >> ifNotEmpty: aBlock [ 
	^ self tokens ifNotEmpty: aBlock 
]
