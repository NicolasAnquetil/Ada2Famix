"
Instances of this class represent specialized extensions of ADAType instances of type 'tagged record'.
"
Class {
	#name : #ADATypeClass,
	#superclass : #ADAContainerType,
	#instVars : [
		'methods'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeClass class >> annotation [
	<MSEClass: #TypeClass super: #ADAContainerType>
	<package: #ADA>
]

{ #category : #'initialize-release' }
ADATypeClass >> initialize [

	super initialize.
	methods := FMNullMultivalueLink 
		on: self
		opposite: #parentType:
		selector: #methods.

]

{ #category : #accessing }
ADATypeClass >> methodNamed: aString [ 

	^self methodNamed: aString ifAbsent: [self error: 'Method not found']
]

{ #category : #accessing }
ADATypeClass >> methodNamed: aString ifAbsent: aBlock [

	^self methods detect: [ :m | m name = aString ] ifNone: 
		[ self superType 
			ifNil: aBlock 
			ifNotNil: 
				[ :aType | 
				aType methodNamed: aString ifAbsent: aBlock ] ]
]

{ #category : #accessing }
ADATypeClass >> methods [
	<MSEProperty: #methods type: #ADAMethod opposite: #parentType>
	<multivalued>
	<derived>
	<MSEComment: 'Methods declared by this type.'>
	^ methods
]

{ #category : #accessing }
ADATypeClass >> methods: aMethod [
	methods value: aMethod
]
