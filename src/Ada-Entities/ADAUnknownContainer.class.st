"
A stub that is a container, but we don ́t know what kind (package, task, ...)
"
Class {
	#name : #ADAUnknownContainer,
	#superclass : #ADAContainerEntity,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAUnknownContainer class >> annotation [
	<MSEClass: #UnknownContainer super: #ADAContainerEntity>
	<package: #ADA>
]

{ #category : #accessing }
ADAUnknownContainer >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity>
	<MSEComment: 'The container defining this container.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADAUnknownContainer >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #packages
		from: self container
		to: aContainer
]

{ #category : #testing }
ADAUnknownContainer >> isAdaUnknownContainer [
	^ true
]
