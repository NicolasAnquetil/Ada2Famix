"
An ADAParameter is a formal parameter in a Subprogram declaration.

"
Class {
	#name : #ADAParameter,
	#superclass : #ADAStructuralEntity,
	#instVars : [
		'mode'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAParameter class >> annotation [
	<MSEClass: #Parameter super: #ADAStructuralEntity>
	<package: #ADA>
]

{ #category : #modes }
ADAParameter class >> defaultMode [

	^self inModeSymbol
]

{ #category : #modes }
ADAParameter class >> inModeSymbol [
	^ #inputMode
]

{ #category : #modes }
ADAParameter class >> inOutModeSymbol [
	^ #inputOutputMode
]

{ #category : #modes }
ADAParameter class >> outModeSymbol [
	^ #outputMode
]

{ #category : #accessing }
ADAParameter >> accept: aVisitor [

	aVisitor visitParameter: self
]

{ #category : #accessing }
ADAParameter >> container [
	"redefining pragma to specify the type of container"

	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADABehaviouralEntityWithParameters opposite: #parameters>
	<MSEComment: 'The subprogram defining this parameter'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADAParameter >> container: aContainer [
	"container must be a subprogram, we need a special treatment to add parameters to it
	this special treatment is handled by addParameter: , but with must take care of not
	entering infinite recursion"

	| old |
	old := parentPackage.
	old ~= aContainer
		ifTrue: [ 
			old ifNotNil: [ old removeParameter: self ].
			parentPackage := aContainer.
			aContainer ifNotNil: [ aContainer addParameter: self ] ]
]

{ #category : #accessing }
ADAParameter >> inMode [
	^ self mode asSymbol = self class inModeSymbol or: [ self mode asSymbol = self class inOutModeSymbol ]
]

{ #category : #accessing }
ADAParameter >> mode [
	<MSEProperty: #mode type: #String>
	<MSEComment: 'The mode (input/output/inputOutput) for this parameter'>

	^ mode ifNil: [ self class defaultMode ]
]

{ #category : #accessing }
ADAParameter >> mode: aSymbol [
	
	mode := aSymbol
]

{ #category : #accessing }
ADAParameter >> outMode [
	^ self mode asSymbol = self class outModeSymbol or: [ self mode asSymbol = self class inOutModeSymbol ]
]

{ #category : #accessing }
ADAParameter >> typeContainer [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #typeContainer to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #container property. Thus we do not want to export it two times.
	"

	"redefining pragma to specify the type of container"

	<MSEProperty: #typeContainer type: #ADAType opposite: #parameters>
	<MSEComment: 'The type defining this parameter'>
	^ self container
]

{ #category : #accessing }
ADAParameter >> typeContainer: aType [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #typeContainer to be good with the pragmas. 
	"

	^ self container: aType
]
