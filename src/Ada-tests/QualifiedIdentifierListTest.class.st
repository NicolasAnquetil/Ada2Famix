Class {
	#name : #QualifiedIdentifierListTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Ada-tests'
}

{ #category : #tests }
QualifiedIdentifierListTest >> createIdentifier: aString [
	^ AdaIdentifierKind new name: aString ; yourself

]

{ #category : #running }
QualifiedIdentifierListTest >> setUp [
	model := ADAModel new
]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsContainerMatchesPackage [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asContainerIdentifier equals: q.
	self assert: (q matches: (ADAPackage new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsStructuralMatchesParameter [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asStructuralIdentifier equals: q.
	self assert: (q matches: (ADAParameter new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsSubprogramDoesNotMatchFunctionWrongParamNumber [
	| q |
	"a.b.c(1,2)"
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).
	q addArgument: 1.
	q addArgument: 2.

	self assert: q asSubprogramIdentifier equals: q.
	self deny: (q matches: (ADASubprogram new
										name: 'C' ;
										addParameter: (ADAParameter new) ;
										yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsSubprogramMatchesFunctionNoParam [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asSubprogramIdentifier equals: q.
	self assert: (q matches: (ADASubprogram new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsSubprogramMatchesFunctionWithParams [
	| q |
	"a.b.c(1,2)"
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).
	q addArgument: 1.
	q addArgument: 2.

	self assert: q asSubprogramIdentifier equals: q.
	self assert: (q matches: (ADASubprogram new
											name: 'C' ;
											addParameter: (ADAParameter new) ;
											addParameter: (ADAParameter new) ;
											yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsTaskDoesNotMatchPackage [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asTaskIdentifier equals: q.
	self deny: (q matches: (ADAPackage new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsTaskMatchesTask [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asTaskIdentifier equals: q.
	self assert: (q matches: (ADATask new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsTypeMatchesType [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asTypeIdentifier equals: q.
	self assert: (q matches: (ADAType new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsValueMatchesFunctionNoParam [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asValueIdentifier equals: q.
	self assert: (q matches: (ADASubprogram new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testAsValueMatchesVariable [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q asValueIdentifier equals: q.
	self assert: (q matches: (ADAStructuralEntity new name: 'C' ; yourself))

]

{ #category : #tests }
QualifiedIdentifierListTest >> testContainers [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).
	self assert: q containers size equals: 2.
	self assert: q size equals: 3.
	self assert: q containers first equals: #a.
	self assert: q containers second equals: #b.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testContainersDifferentFromQualified [
	| q cont |
	q := FASTAdaQualifiedIdentifier withAll: #( a b ).
	q addArgument: 1.
	cont := q containers.

	self assert: q asStructuralIdentifier equals: q.
	self assert: q hasArguments.

	self assert: cont asContainerIdentifier equals: cont.
	self deny: cont hasArguments.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testContainersEmpty [
	| q |
	q := FASTAdaQualifiedIdentifier new.
	self assert: q containers size equals: 0.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testContainersNone [
	| q |
	q := FASTAdaQualifiedIdentifier with: #a.
	self assert: q containers size equals: 0.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testContainersWithArgs [
	| q |
	"a.b.c(1)"
	q := FASTAdaQualifiedIdentifier withAll: {#a . #b . #c }.
	q addArgument: (FASTAdaQualifiedIdentifier with: 1).

	self assert: q containers size equals: 2.
	self assert: q containers first equals: #a.
	self assert: q containers second equals: #b.
	self assert: q hasArguments.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testHasArguments [
	| q |
	"a.b(1)"
	q := FASTAdaQualifiedIdentifier new.
	self deny: q hasArguments.
	q addIdentifier: #a.
	self deny: q hasArguments.
	q addIdentifier: #b.
	self deny: q hasArguments.
	q addArgument: (FASTAdaQualifiedIdentifier with: 1).
	self assert: q hasArguments.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testMainIdentifier [
	| q |
	q := FASTAdaQualifiedIdentifier new.
	self assert: q mainIdentifier equals: nil.
	q addIdentifier: #a.     "a"
	self assert: q mainIdentifier equals: #a.
	q addIdentifier: #b.     "a.b"
	self assert: q mainIdentifier equals: #b.
	q addArgument: (FASTAdaQualifiedIdentifier with: 1).     "a.b(1)"
	self assert: q mainIdentifier equals: #b.

]

{ #category : #tests }
QualifiedIdentifierListTest >> testQualifiedNameByPolicy [
	| q |
	q := FASTAdaQualifiedIdentifier withAll: #( a b c ).

	self assert: q nameByPolicy equals: 'C'

]

{ #category : #tests }
QualifiedIdentifierListTest >> testSimpleNameByPolicy [
	| q |
	q := FASTAdaQualifiedIdentifier with: 'a'.

	self assert: q nameByPolicy equals: 'A'

]

{ #category : #tests }
QualifiedIdentifierListTest >> testWithoutContainers [
	| q1 q2 |
	q1 := FASTAdaQualifiedIdentifier withAll: #( a b c ).
	q1 asPackageIdentifier ; asTaskIdentifier.
	q2 := q1 withoutContainers.
	self assert: q2 containers size equals: 0.
	self assert: q2 size equals: 1.
	self assert: q2 mainIdentifier equals: #c.

	self assert: (q2 matches: (ADAPackage new name: 'C' ; yourself)).
	self assert: (q2 matches: (ADATask new name: 'C' ; yourself)).
	self deny:   (q2 matches: (ADAType new name: 'C' ; yourself)).

]
