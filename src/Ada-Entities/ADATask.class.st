"
An ADATask represents a Task in Ada.
"
Class {
	#name : #ADATask,
	#superclass : #ADABehaviouralEntityWithParameters,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATask class >> annotation [
	<MSEClass: #Task super: #ADABehaviouralEntityWithParameters>
	<package: #ADA>
]

{ #category : #accessing }
ADATask >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #tasks>
	<MSEComment: 'The container defining this task.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADATask >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #tasks
		from: self container
		to: aContainer
]

{ #category : #testing }
ADATask >> isAdaTask [
	^ true
]
