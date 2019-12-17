Class {
	#name : #FASTDefPckgAccessChecker,
	#superclass : #FASTAccessChecker,
	#category : #'FAST-Core-Resolution'
}

{ #category : #testing }
FASTDefPckgAccessChecker >> entity: src canAccess: tgt [
	| srcPckg tgtPckg |
	srcPckg := src famixNamedEntity.
	[ srcPckg isKindOf: FAMIXScopingEntity ] whileFalse: [ srcPckg := srcPckg belongsTo ].
	tgtPckg := tgt .
	[ tgtPckg isKindOf: FAMIXScopingEntity ] whileFalse: [ tgtPckg := tgtPckg belongsTo ].
	
	^ srcPckg = tgtPckg 
]
