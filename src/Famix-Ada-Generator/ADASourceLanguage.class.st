Class {
	#name : #ADASourceLanguage,
	#superclass : #ADAEntity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Ada-Generator-predefined'
}

{ #category : #'instance creation' }
ADASourceLanguage class >> singleton [
	"This comes from old implementation, but I there is no compelling reason while it should be
	a singleton.
	And singleton makes it more difficult to create the class automatically from the FamixAdaGenerator
	because of the class side variable that a singleton usually need.
	This implementatino is suboptimal, but it relies only on this method"

	self flag: 'to remove'.
	^ self allInstances ifEmpty: [ self new ] ifNotEmpty: [ :instances | instances first ]
]

{ #category : #'as yet unclassified' }
ADASourceLanguage >> casePolicy: aString [
	"Ada is not case sensitive"
	^ aString asUppercase
]
