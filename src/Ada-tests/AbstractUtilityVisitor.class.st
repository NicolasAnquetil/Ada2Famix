Class {
	#name : #AbstractUtilityVisitor,
	#superclass : #TestCase,
	#instVars : [
		'visitor',
		'rootRule'
	],
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #running }
AbstractUtilityVisitor >> parseAndVisit: inputString [
	^ self visitorClass new visit: (self parseFromRootRule: inputString)
]

{ #category : #running }
AbstractUtilityVisitor >> parseFromRootRule: aSource [
	| parser |
	parser := LwsParser on: (ReadStream on: aSource).
	parser setStartingState: ((LwsParser perform: ('startingStateFor' , rootRule) asSymbol)).
	^ parser parse entities first
]
