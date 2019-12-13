Class {
	#name : #Ada95Test,
	#superclass : #TestCase,
	#instVars : [
		'result'
	],
	#category : #'Lewis-AdaParser'
}

{ #category : #parsing }
Ada95Test >> backEnd [

]

{ #category : #parsing }
Ada95Test >> parse: aSource [ 
	| parser  |
	parser := self parserClass on: (ReadStream on: aSource).
	result := parser parse.
	self backEnd.
	^ result

]

{ #category : #parsing }
Ada95Test >> parse: aSource rule: aSymbolOrString [
	| parser |
	parser := self parserClass on: (ReadStream on: aSource).
	parser setStartingState: ((self parserClass perform: ('startingStateFor' , aSymbolOrString) asSymbol)).
	result := parser parse.
	self backEnd.
	^result

]

{ #category : #parsing }
Ada95Test >> parserClass [

	^ Ada95Parser
]
