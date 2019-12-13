"
ADASourceLanguage represents Ada source language
"
Class {
	#name : #ADASourceLanguage,
	#superclass : #FAMIXSourceLanguage,
	#classVars : [
		'singleton'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'as yet unclassified' }
ADASourceLanguage class >> annotation [
	<MSEClass: #SourceLanguage super: #FAMIXSourceLanguage>
	<package: #ADA>
	^self
]

{ #category : #'as yet unclassified' }
ADASourceLanguage class >> new [
	^ self singleton
]

{ #category : #'instance creation' }
ADASourceLanguage class >> singleton [

	^singleton ifNil: [ singleton := self basicNew initializeInstanceVars ].
]

{ #category : #'as yet unclassified' }
ADASourceLanguage >> casePolicy: aString [
	"Ada is not case sensitive"
	^ aString asUppercase
]

{ #category : #accessing }
ADASourceLanguage >> initializeInstanceVars [
	mooseID := self class freshID.
	state := self defaultStateClass with: self
]

{ #category : #accessing }
ADASourceLanguage >> name [
	^ 'Ada'
]
