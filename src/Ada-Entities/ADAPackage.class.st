"
An ADAPackage represents a Package in Ada.
It is a namespace in the sense that the name of entities defined within are local to the package.
"
Class {
	#name : #ADAPackage,
	#superclass : #ADAInstanceableEntity,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAPackage class >> annotation [
	<MSEClass: #Package super: #ADABehaviouralEntity>
	<package: #ADA>
]

{ #category : #accessing }
ADAPackage >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #packages>
	<MSEComment: 'The container defining this package.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADAPackage >> container: aContainer [
	parentPackage := FMMultivalueLink on: self
					update: #packages
					from: self container
					to: aContainer
]

{ #category : #'as yet unclassified' }
ADAPackage >> dataAccessorsForQuickTagging [
	^ self subprograms
]

{ #category : #testing }
ADAPackage >> isAdaPackage [
	^ true
]

{ #category : #testing }
ADAPackage >> isPackage [
	^ self isAdaPackage
]

{ #category : #accessing }
ADAPackage >> isRoot [
	^ self container class = ADATopLevelContainer
]
