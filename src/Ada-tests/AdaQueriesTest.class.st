Class {
	#name : #AdaQueriesTest,
	#superclass : #TestCase,
	#category : #'Ada-tests'
}

{ #category : #'as yet unclassified' }
AdaQueriesTest >> testPackageScopes [
	"File, Folder, Type, Method"
	self assert: ADAPackage new possibleScopes size equals: 4.
]

{ #category : #'as yet unclassified' }
AdaQueriesTest >> testProgramsScopes [
	"File, Folder, Type, Package"
	self assert: ADASubprogram new possibleScopes size equals: 4.
]

{ #category : #'as yet unclassified' }
AdaQueriesTest >> testTypeScopes [
	"File, Folder, Package"
	self assert: ADAType new possibleScopes size equals: 3.
	self assert: (ADAType new possibleScopes includes: 'Package').
]
