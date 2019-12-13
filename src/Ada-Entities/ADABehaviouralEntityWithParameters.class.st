Class {
	#name : #ADABehaviouralEntityWithParameters,
	#superclass : #ADAInstanceableEntity,
	#instVars : [
		'parameters',
		'signature',
		'declaredType'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADABehaviouralEntityWithParameters class >> annotation [
	<MSEClass: #BehaviouralEntityWithParameters super: #ADABehaviouralEntity>
	<package: #ADA>
	<abstract>
]

{ #category : #testing }
ADABehaviouralEntityWithParameters class >> isDisplayable [
	^ self ~= ADABehaviouralEntityWithParameters
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> addParameter: aParameter [

	"No need to supply a default mode for the parameter,
	the parameter object will automagically supply the default"
	parameters add: aParameter
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> declaredType [
	<MSEProperty: #declaredType type: #ADAType opposite: #subprogramsWithDeclaredType>
	<MSEComment: 'Return type of the function (nil for procedures)'>
	
	^ declaredType
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> declaredType: aType [
	declaredType :=  FMMultivalueLink on: self
					update: #subprogramsWithDeclaredType
					from: self declaredType
					to: aType.

	"if its a generic, sets the declaredType of its instances"
	self instances do: [ :i | i declaredType: aType]
]

{ #category : #initialization }
ADABehaviouralEntityWithParameters >> initialize [
	super initialize.
	parameters := FMNullMultivalueLink on: self opposite: #container: selector: #parameters
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> parameters [
	<MSEProperty: #parameters type: #ADAParameter opposite: #container> <multivalued> <derived>
	<MSEComment: 'List of formal parameters declared by this subprogram.'>

	^ parameters
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> parameters: aCollection [
	parameters value: aCollection
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> removeParameter: aParameter [

	parameters unsafeRemove: aParameter
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> signature [
	<MSEProperty: #signature type: #String>
	<MSEComment: 'Signature characterizing this subprogram.'>

	^ signature
]

{ #category : #accessing }
ADABehaviouralEntityWithParameters >> signature: anObject [
	
	signature := anObject
]
