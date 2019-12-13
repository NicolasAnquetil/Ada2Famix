"
Instances of this class represent specialized extensions of ADAType instances of type 'enum'.

The values of the enumeration are listed using the 'enumValues' instance variable. The enumerated values are instances of ADAStructuralEntity.

There are two types of enumerated values.
identifiers :		type t_enum is (ARTIFACT,TEST,OTHER)
characters :		 type t_enum is ('d','f','g')

For identifier enumerated values, the name of the ADAStructuralEntity is the identifier itself, i.e. ARTIFACT, TEST, OTHER

For character enumerated values, the name of the ADAStructuralEntity is the value of the character surrounded by single quotes, i.e. 'd', 'f', 'g'
		
		



"
Class {
	#name : #ADATypeEnum,
	#superclass : #ADAContainerType,
	#instVars : [
		'enumValues'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeEnum class >> annotation [
	<MSEClass: #TypeEnum super: #ADAContainerType>
	<package: #ADA>
]

{ #category : #accessing }
ADATypeEnum >> enumValues [
	<MSEProperty: #enumValues type: #ADAStructuralEntity opposite: #parentEnum>
	<multivalued>
	<MSEComment: 'Variables defined in the enum type.'>
	^ enumValues
]

{ #category : #accessing }
ADATypeEnum >> enumValues: aCollection [
	enumValues value: aCollection
]

{ #category : #initialization }
ADATypeEnum >> initialize [

	super initialize.
	enumValues := FMNullMultivalueLink 
		on: self 
		opposite: #parentEnum: 
		selector: #enumValues.

]

{ #category : #testing }
ADATypeEnum >> isAdaEnumeratedType [

	^true
]
