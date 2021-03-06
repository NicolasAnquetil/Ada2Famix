Extension { #name : #FAMIXNamedEntity }

{ #category : #'*Ada-Entities' }
FAMIXNamedEntity class >> isAlias [

	^false
]

{ #category : #'*Ada-Entities' }
FAMIXNamedEntity >> parentSelector [
	self deprecated: '01/09/2017 Cyril: Instead of doing `self perform: self parentSelector`, just call #belongsTo'.
	^ #belongsTo
]

{ #category : #'*Ada-Entities' }
FAMIXNamedEntity class >> parentSelectors [
	^ parentSelectors ifNil: [ parentSelectors := (self privateParentSelectors , { #containerFiles }) ] 
]

{ #category : #'*Ada-Entities' }
FAMIXNamedEntity class >> parentTypes [
	"This is created in order to add the Files and Folders into the scope of MooseQuery. MooseQuery is based on the container pragma but the entities cannot use this pragma since an entity can be in multiple files. The container pragma cannot bu used in that case."

	^ self privateParentTypes , self manuallyAddedParentTypes
]
