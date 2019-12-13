"
Class for a special container that represents the top level
"
Class {
	#name : #ADATopLevelContainer,
	#superclass : #ADAContainerEntity,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATopLevelContainer class >> annotation [
	<MSEClass: #TopLevelContainer super: #ADAContainerEntity>
	<package: #ADA>
]

{ #category : #accessing }
ADATopLevelContainer >> childNamedEntities [
	self flag: #todo. "This is a hack to make Gnat work. I should be removed after."
	^ Mock new
]

{ #category : #accessing }
ADATopLevelContainer >> isDead [
	^ false
]

{ #category : #testing }
ADATopLevelContainer >> isTopLevelContainer [
	^ true
]

{ #category : #accessing }
ADATopLevelContainer >> name [
	^ 'TopContainer'
]
