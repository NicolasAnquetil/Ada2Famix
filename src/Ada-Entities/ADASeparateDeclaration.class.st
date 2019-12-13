"
An ADASeparateDeclaration is a container to represent an Ada SEPARATE when we don't know what it is (a package, a procedure, ...)

"
Class {
	#name : #ADASeparateDeclaration,
	#superclass : #ADAContainerEntity,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADASeparateDeclaration class >> annotation [
	<MSEClass: #SeparateDeclaration super: #ADAContainerEntity>
	<package: #ADA>
]

{ #category : #accessing }
ADASeparateDeclaration >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #separates>
	<MSEComment: 'The container declaring this SEPARATE.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADASeparateDeclaration >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #separates
		from: self container
		to: aContainer
]
