Class {
	#name : #LwsParser,
	#superclass : #Ada95Parser,
	#category : #'Lewis-AdaParser'
}

{ #category : #accessing }
LwsParser >> defaultBuilder [
	^ LwsAstBuilder new parser: self
]
