Extension { #name : #MooseGroupRuntimeStorage }

{ #category : #'*Ada-Entities' }
MooseGroupRuntimeStorage >> remove: anElement ifAbsent: exceptionBlock [

	elements remove: anElement ifAbsent: [ ^exceptionBlock value ].
	self updateCacheOutFor: anElement.
	^ anElement
]

{ #category : #'*Ada-Entities' }
MooseGroupRuntimeStorage >> updateCacheOutFor: anElement [
	| key group |
	key := anElement class.
	group := byType at: key ifAbsent: [ OrderedCollection new ].
	group remove: anElement ifAbsent: [ self error: 'Internal storage inconsistency' ].
	anElement hasUniqueMooseNameInModel ifFalse: [ ^anElement ].
	key := anElement mooseName asSymbol.
	byName at: key ifAbsent: 
			[ "In theory, objects are registered under their mooseName,
			however some objects are still registered by their name
			if #resetMooseName was not used when needed"
			self resetMooseNameFor: anElement ].
	byName removeKey: key ifAbsent: [ self error: 'Internal storage inconsistency' ].
	^anElement
]
