"
Instances of this class represent specialized extensions of ADAType instances of type 'task'.
"
Class {
	#name : #ADATypeTask,
	#superclass : #ADAType,
	#instVars : [
		'adaTask'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeTask class >> annotation [
	<MSEClass: #Typetask super: #ADAType>
	<package: #ADA>
]

{ #category : #accessing }
ADATypeTask >> adaTask [
	<MSEProperty: #adaTask type: #ADATask>
	<MSEComment: 'In case this is an Ada TASK type, the related ADATask object'>

	^ adaTask
]

{ #category : #accessing }
ADATypeTask >> adaTask: anObject [
	adaTask := anObject
]

{ #category : #testing }
ADATypeTask >> isAdaTaskType [

	^true
]
