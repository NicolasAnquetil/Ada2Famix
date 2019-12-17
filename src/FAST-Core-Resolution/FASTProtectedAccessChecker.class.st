Class {
	#name : #FASTProtectedAccessChecker,
	#superclass : #FASTAccessChecker,
	#category : #'FAST-Core-Resolution'
}

{ #category : #testing }
FASTProtectedAccessChecker >> entity: src canAccess: tgt [
	| srcCls tgtCls |
	"get containing FamixTypes"
	srcCls := src famixNamedEntity.
	[ srcCls isKindOf: FAMIXType ] whileFalse: [ srcCls := srcCls belongsTo ].
	tgtCls := tgt.
	[ tgtCls isKindOf: FAMIXType ] whileFalse: [ tgtCls := tgtCls belongsTo ].
	
	^ srcCls superclassHierarchy includes: tgtCls
]
