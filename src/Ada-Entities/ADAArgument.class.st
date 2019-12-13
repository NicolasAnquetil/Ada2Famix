"
An ADAArgument makes the connection between an ADAStructuralEntity Access and an ADAParameter in an invocation
"
Class {
	#name : #ADAArgument,
	#superclass : #FAMIXSourcedEntity,
	#instVars : [
		'parameter',
		'argument',
		'invocation'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAArgument class >> annotation [
	<MSEClass: #Argument super: #FAMIXSourcedEntity>
	<package: #ADA>
	^self
]

{ #category : #accessing }
ADAArgument >> argument [
	<MSEProperty: #argument type: #FAMIXAccess>
	<MSEComment: 'Access to an ADAStructuralEntity passed as argument to an Invocation'>

	^ argument
]

{ #category : #accessing }
ADAArgument >> argument: anObject [
	
	argument := anObject
]

{ #category : #accessing }
ADAArgument >> invocation [
	<MSEProperty: #invocation type: #FAMIXInvocation>
	<MSEComment: 'The invocation where this argument is passed'>
	^ invocation
]

{ #category : #accessing }
ADAArgument >> invocation: anObject [
	invocation := FMMultivalueLink
		on: self
		update: #arguments
		from: self invocation
		to: anObject
]

{ #category : #testing }
ADAArgument >> isAdaStructural [
	^ true
]

{ #category : #accessing }
ADAArgument >> parameter [
	<MSEProperty: #parameter type: #ADAParameter>
	<MSEComment: 'ADAParameter receiving an argument in an Invocation'>

	^ parameter
]

{ #category : #accessing }
ADAArgument >> parameter: anObject [
	
	parameter := anObject
]
