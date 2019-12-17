Class {
	#name : #FASTPrivateAccessChecker,
	#superclass : #FASTAccessChecker,
	#category : #'FAST-Core-Resolution'
}

{ #category : #testing }
FASTPrivateAccessChecker >> entity: src canAccess: tgt [
	| srcCls tgtCls |
	
	"get containing FamixTypes"
	srcCls := src famixNamedEntity.
	[ srcCls isKindOf: FAMIXScopingEntity ] whileFalse: [ srcCls := srcCls belongsTo ].
	tgtCls := tgt.
	[ tgtCls isKindOf: FAMIXScopingEntity ] whileFalse: [ tgtCls := tgtCls belongsTo ].
	
	^ srcCls = tgtCls 
]
