"
A LwsStubEntity is a temporary entity used in parser to keep trace of its content start end end positions
"
Class {
	#name : #LwsStubEntity,
	#superclass : #LwsEntity,
	#category : #'Lewis-LwsStructureSchema'
}

{ #category : #accessing }
LwsStubEntity >> content [
	^ contents
]

{ #category : #accessing }
LwsStubEntity >> contents: anObject [
	contents := anObject
]
